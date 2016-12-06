#version 330 core

#ifdef ES
#define OUT varying
#define IN attribute
#define outColor gl_FragColor
#else
#define OUT out
#define IN in
out vec4 fragColor;
#define outColor fragColor
#endif

IN vec4 position;
IN vec3 normal;
IN vec2 texcoord;
IN vec3 tangent;
IN vec3 bitangent;

OUT vec2 fragTexcoord;
OUT vec3 fragNormal;
OUT vec4 fragPosition;
OUT vec3 fragTangent;
OUT vec3 fragBitangent;

uniform mat4 viewProjection;
uniform mat4 modelMatrix;
uniform int renderBorder;
uniform float borderWidth;

void main()
{
    fragTexcoord = texcoord;
    fragNormal = normal;
    fragPosition = position + vec4(normalize(fragNormal) * 0.4, 0.0);
    fragTangent = tangent;
    fragBitangent = bitangent;

    if (renderBorder == 1) {
        vec4 adjustPosition = position + vec4(normalize(fragNormal) * borderWidth, 0.0);
        vec4 finalPos = viewProjection * modelMatrix * adjustPosition;
        gl_Position = finalPos;
    } else {
        gl_Position = viewProjection * modelMatrix * position;
    }
}