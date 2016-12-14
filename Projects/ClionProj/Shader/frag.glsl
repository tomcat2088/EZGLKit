//
//  Shader.fsh
//  OpenESRD
//
//  Created by wangyang on 2016/9/30.
//  Copyright © 2016年 wangyang. All rights reserved.
#version 330 core

precision highp float;

#ifdef ES
#define OUT varying
#define outColor gl_FragColor
#define tex2D(map, uv) texture2D(map, uv)
#else
#define OUT in
out vec4 GLfragColor;
#define outColor GLfragColor
#define tex2D(map, uv) texture(map, uv)
#endif

out float outDepth;

struct light {
    vec3 position;
    vec4 color;
    float intensity;
    float intensityFallOff;
};

struct material_struct {
    vec4 diffuse;
    vec4 ambient;
    vec4 specular;
};

struct projector_struct {
    mat4 viewProjection;
};

OUT highp vec4 fragPosition;
OUT lowp vec2 fragTexcoord;
OUT highp vec3 fragNormal;
OUT highp vec3 fragTangent;
OUT highp vec3 fragBitangent;
OUT highp vec4 fragColor;

uniform highp vec3 cameraPosition;
uniform highp mat4 viewProjection;
uniform highp mat4 modelMatrix;
uniform highp mat3 normalMatrix;

uniform light lights[6];
uniform mediump int lightNum;
uniform sampler2D shadowMap[6];
uniform highp mat4 lightViewProjection[6];

uniform sampler2D ambientMap;
uniform sampler2D diffuseMap;
uniform sampler2D normalMap;
uniform sampler2D specularMap;

uniform material_struct material;

uniform int renderShadow;
uniform int renderBorder;
uniform vec4 borderColor;

uniform int onlyUseColorAttrib;

uniform projector_struct projectors[4];
uniform sampler2D projectorMap;
uniform int projectorNum;

uniform int enableTerrainMix;

vec4 project(projector_struct projector) {
    highp vec4 projectorMVPPosition = projector.viewProjection * modelMatrix * fragPosition;
    projectorMVPPosition = projectorMVPPosition / projectorMVPPosition.w;
    projectorMVPPosition = projectorMVPPosition * 0.5 + 0.5;
    vec4 projectColor;
    if (projectorMVPPosition.x >= 0.0 && projectorMVPPosition.x <= 1.0
    && projectorMVPPosition.y < 1.0 && projectorMVPPosition.y > 0.0) {
        projectColor = tex2D(projectorMap, projectorMVPPosition.st);
    } else {
        projectColor = vec4(0.0,0.0,0.0,0.0);
    }
    return projectColor;
}

void pointLight(
                in vec3 normal,
                out vec4 ambient,
                out vec4 diffuse,
                out vec4 specular,
                in vec3 vp,
                in vec3 eye,
                in float lightDistance,
                in vec4 lightAmbient,
                in vec4 lightDiffuse,
                in vec4 lightSpecular
                ) {
    ambient = lightAmbient;
    vec3 halfVector = normalize(vp + eye);
    float shininess = 70.0;
    float nDotViewPosition = clamp(dot(normal,vp),0.0,1.0);
    diffuse = lightDiffuse * nDotViewPosition;
    float nDotViewHalfVector = clamp(dot(normal,halfVector),0.0,1.0);
    float powerFactor = max(0.0, pow(nDotViewHalfVector,shininess));
    specular = lightSpecular * powerFactor / 10.0;

//    //if (lightDistance > 5.0)
//    {
//    float total = 100.0;
//        float percent = (total - lightDistance) / total;
//        percent = percent < 0?0:percent;
//        diffuse = vec4(0,0,0,0);
//        ambient = vec4(0.1,0.1,0.1,1.0);
//        specular = vec4(0,0,0,0);
//    }
}

void transformNormal(in vec3 position, in vec3 normal,out vec3 newNormal)
{
    highp vec3 normalTarget = position + normalize(normal);
    highp vec3 mMatrixNormalTarget = (modelMatrix * vec4(normalTarget, 1.0)).xyz;
    highp vec3 mMatrixPosition = (modelMatrix * vec4(position, 1.0)).xyz;
    newNormal = normalize(mMatrixNormalTarget - mMatrixPosition);
}

const float PackUpscale = 256. / 255.; // fraction -> 0..1 (including 1)
const float UnpackDownscale = 255. / 256.; // 0..1 -> fraction (excluding 1)

const vec3 PackFactors = vec3( 256. * 256. * 256., 256. * 256.,  256. );
const vec4 UnpackFactors = UnpackDownscale / vec4( PackFactors, 1. );

const float ShiftRight8 = 1. / 256.;

vec4 pack (float v)
{
    vec4 r = vec4( fract( v * PackFactors ), v );
    r.yzw -= r.xyz * ShiftRight8; // tidy overflow
    return r * PackUpscale;
}

float unpack (vec4 v)
{
    return dot( v, UnpackFactors );
}

float frogFactor() {
    float start = 1000;
    float end = 1200;
    highp vec4 pos = viewProjection * modelMatrix * fragPosition;
    float distanceToCamera = distance(pos.xyz,vec3(0,0,0));
    float factor = clamp((end - distanceToCamera) / (end - start),0.0,1.0);
    factor = 1.0 - smoothstep(start,end,distanceToCamera);
    //factor = sin(factor * 3.14 / 2.0);
    return factor;
}

vec4 renderAsShadow() {
    highp vec4 v_v4TexCoord = viewProjection * modelMatrix * fragPosition;
    highp vec3 lightPosition = lights[0].position;
    float normalizedDistance  = distance(v_v4TexCoord.xyz,lightPosition.xyz);
    return pack(v_v4TexCoord.z);
}

float shadowValue(float bias,out vec4 shadowColor) {
    highp vec4 lightMVPPosition = lightViewProjection[0] * modelMatrix * fragPosition;
    lightMVPPosition = lightMVPPosition / lightMVPPosition.w;
    lightMVPPosition = lightMVPPosition * 0.5 + 0.5;
    float nearestDepth = tex2D(shadowMap[0], lightMVPPosition.st).x;
    float shadow = 0.0;
    vec2 texelSize = 1.0 / textureSize(shadowMap[0], 0);
    int blurSize = 1;
    for(int x = -blurSize; x <= blurSize; ++x)
    {
        for(int y = -blurSize; y <= blurSize; ++y)
        {
            float pcfDepth = tex2D(shadowMap[0], lightMVPPosition.xy + vec2(x, y) * texelSize).r;
            shadow += lightMVPPosition.z - bias > pcfDepth ? 0.5 : 0.0;
        }
    }
    shadow /= 9.0;

    shadowColor = tex2D(shadowMap[0], fragTexcoord);
    return 1 - shadow;
}

vec4 surfaceColor() {
    if (enableTerrainMix == 0) {
        return tex2D(diffuseMap, fragTexcoord) + material.diffuse;
    } else {
        // diffuse 0 ~ 0.3
        // ambient 0.3 ~ 0.7
        // specular 0.7 ~ 1
        vec4 color1 = tex2D(diffuseMap, fragTexcoord);
        vec4 color2 = tex2D(specularMap, fragTexcoord);
        vec4 color3 = vec4(.0,0.0,1.0,1.0);//tex2D(specularMap, fragTexcoord);
        highp vec4 lightMVPPosition = modelMatrix * fragPosition;
        float bottom = -15;
        float top = 35;
        float percent1 = (lightMVPPosition.y - bottom) / 70.0 / 0.4;
        percent1 = percent1 > 1.0 ? 1.0 : percent1;
        percent1 = percent1 < 0.0 ? 0.0 : percent1;
        percent1 = 1.0-percent1;

        float percent2 = (lightMVPPosition.y - bottom - 70.0 * 0.2) / 70.0 / 0.8;
        percent2 = percent2 > 1.0 ? 1.0 : percent2;
        percent2 = percent2 < 0.0 ? 0.0 : percent2;

        return vec4((color1 * percent1 + color2 * percent2).rgb,1.0);
    }
}

vec4 render() {
 // 扰动法向量
    highp vec3 rgb = tex2D( normalMap, fragTexcoord ).rgb;
    highp float tnx = 2.0 * (rgb.r - 0.5);
    highp float tny = 2.0 * (rgb.g - 0.5);
    highp float tnz = 2.0 * (rgb.b - 0.5);
#ifdef Use_BumpMap
    highp vec3 textureNormal = normalize(vec3(tnx, tny, tnz));
#else
    highp vec3 textureNormal;
    transformNormal(fragPosition.xyz, fragNormal, textureNormal);
#endif

    // 计算TBN变换矩阵
    highp vec3 tbnNormal, tbnTangent, tbnBitangent;
    transformNormal(fragPosition.xyz, fragNormal, tbnNormal);
    transformNormal(fragPosition.xyz, fragTangent, tbnTangent);
    transformNormal(fragPosition.xyz, fragBitangent, tbnBitangent);
//    tbnBitangent = normalize(cross(tbnTangent, tbnNormal));
    highp mat3 tbn = mat3(tbnTangent.x, tbnBitangent.x, tbnNormal.x,
                          tbnTangent.y, tbnBitangent.y, tbnNormal.y,
                          tbnTangent.z, tbnBitangent.z, tbnNormal.z);

    highp vec3 mMatrixPosition = (modelMatrix * fragPosition).xyz;

    // 计算表面点到摄像机的向量
    highp vec3 eye;
    eye = normalize(cameraPosition - mMatrixPosition);
#ifdef Use_BumpMap
    eye = normalize(tbn * eye);
#endif

    highp vec4 sum_ambient = vec4(0.0,0.0,0.0,0.0), sum_diffuse = vec4(0.0,0.0,0.0,0.0), sum_specular = vec4(0.0,0.0,0.0,0.0);
    for (int i=0; i< lightNum; i++) {
        // 计算表面点到光源的向量
        light defaultLight = lights[i];
        highp vec3 vp = normalize(defaultLight.position - mMatrixPosition);
#ifdef Use_BumpMap
        vp = normalize(tbn * vp);
#endif

        // 计算表面到光源的位置
        float lightDistance = distance(defaultLight.position,mMatrixPosition);

        // 计算光源
        highp vec4 ambient, diffuse, specular;
#ifdef Use_SpecularMap
        highp vec4 specularColor = tex2D(specularMap, fragTexcoord);
#else
        highp vec4 specularColor = material.specular;
#endif
        pointLight(textureNormal,ambient,diffuse,specular,vp,eye,lightDistance,material.ambient,defaultLight.color,vec4(1.0,1.0,1.0,1.0));

        sum_ambient = sum_ambient + ambient;
        sum_diffuse = sum_diffuse + diffuse;
        sum_specular = sum_specular + specular;
    }

    for(int i=0;i<projectorNum;i++) {
        sum_ambient += project(projectors[i]);
        sum_diffuse += project(projectors[i]);
    }

    highp vec3 lightPosition = lights[0].position;
    highp vec3 vp = normalize(lightPosition - mMatrixPosition);
    float cosTheta = clamp(dot(textureNormal, vp),0,1);
    float bias = 0.005*tan(acos(cosTheta));
    bias = clamp(bias, 0,0.01);

    vec4 shadowColor;
    float shadow = shadowValue(bias, shadowColor);

    highp vec4 finalColor = surfaceColor();
    if (finalColor.a == 0.0) {
        discard;
    } else {
        highp vec4 outputColor = (finalColor * sum_diffuse + finalColor * sum_ambient + finalColor * sum_specular) * shadow;

        highp vec4 frogColor = vec4(0.0,0.0,0.0,1.0);
        float frogFact = frogFactor();
        if (frogFact == 0.0) {
            return frogColor;
        } else {
            return vec4((outputColor * frogFact + frogColor * (1 - frogFact)).rgb,1.0);
        }
    }
}

//#define Use_BumpMap

void main()
{
    if (renderBorder == 1) {
        outColor = borderColor;
    } else {
        if (onlyUseColorAttrib == 1) {
//            float r = sqrt(pow(fragTexcoord.x - 0.5, 2.0) + pow(fragTexcoord.y- 0.5, 2.0));
//            outColor = vec4(fragColor.rgb, fragColor.a * cos(r * 3.14));
            highp vec4 finalColor = tex2D(diffuseMap, fragTexcoord);
            outColor = fragColor * finalColor.a;//vec4(().rgb,finalColor.a);
        } else {
            outColor = render();
        }
    }
}