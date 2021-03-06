//
// Created by wangyang on 16/11/25.
//

#include "ELLight.h"
#include "ELConfig.h"

#define UseDepthFramebuffer 1

ELLight::ELLight() : shadowTexture(-1) ,
                     isShadowEnabled(false) ,
                     cameraForShadowMap(NULL),
                     type(ELLightTypeDirection)
{

}

ELLight::~ELLight() {

}

std::string ELLight::kind() {
    return "light";
}

void ELLight::update(ELFloat timeInSecs) {
    ELNode::update(timeInSecs);
    if (cameraForShadowMap != NULL) {
        cameraForShadowMap->originEye = position;
    }
}

void ELLight::enableShadow() {
    if (shadowTexture < 0) {
        createShadowFramebuffer();
    }
    isShadowEnabled = true;
}

void ELLight::disableShadow() {
    isShadowEnabled = false;
}

ELCamera * ELLight::shadowMapGenCamera() {
    if (cameraForShadowMap == NULL) {
        cameraForShadowMap = new ELCamera();
        ELVector3 center = ELVector3Make(0,0,0);
        ELVector3 up = ELVector3Make(0,0,1);
        cameraForShadowMap = new ELCamera(position, center,up,60,1,0,0);
        cameraForShadowMap->ortho(-40.0, 40.0, 40, -40, -40, 40);
        cameraForShadowMap->identity = this->identity + "-shadow-camera";
    }
    cameraForShadowMap->originEye = position;
    return cameraForShadowMap;
}

void ELLight::beginGenShadowMap() {
    glViewport(0,0,ELConfig::shadowMapWidth,ELConfig::shadowMapHeight);
    glBindFramebuffer(GL_FRAMEBUFFER, shadowFramebuffer);
    glClear(GL_DEPTH_BUFFER_BIT);
}

void ELLight::endGenShadowMap() {
    glBindFramebuffer(GL_FRAMEBUFFER, 0);
}

void ELLight::createShadowFramebuffer() {
#if UseDepthFramebuffer
    genDepthFramebuffer();
#else
    genColorFramebuffer();
#endif
}

void ELLight::genDepthFramebuffer() {
    GLuint framebuffer;
    GLuint shadowTexture;

    glGenFramebuffers(1, &framebuffer);
    glBindFramebuffer(GL_FRAMEBUFFER, framebuffer);

    glGenTextures(1, &shadowTexture);
    glBindTexture(GL_TEXTURE_2D, shadowTexture);
    //glTexImage2D(GL_TEXTURE_2D, 0, GL_DEPTH_COMPONENT24, ELConfig::shadowMapWidth, ELConfig::shadowMapHeight, 0, GL_DEPTH_COMPONENT, GL_FLOAT, 0);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_DEPTH_COMPONENT, ELConfig::shadowMapWidth, ELConfig::shadowMapHeight, 0, GL_DEPTH_COMPONENT, GL_FLOAT, 0);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);


    glFramebufferTexture2D(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_TEXTURE_2D, shadowTexture, 0);
    //glDrawBuffer(GL_NONE);
    //glReadBuffer(GL_NONE);
    glBindFramebuffer(GL_FRAMEBUFFER, 0);

    this->shadowFramebuffer = framebuffer;
    this->shadowTexture = shadowTexture;
}

void ELLight::genColorFramebuffer() {
    GLuint framebuffer;
    GLuint shadowTexture;

    glGenFramebuffers(1, &framebuffer);
    glBindFramebuffer(GL_FRAMEBUFFER, framebuffer);

    glGenTextures(1, &shadowTexture);
    glBindTexture(GL_TEXTURE_2D, shadowTexture);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, ELConfig::shadowMapWidth, ELConfig::shadowMapHeight, 0, GL_RGBA, GL_UNSIGNED_BYTE, NULL);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);

    glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, shadowTexture, 0);

    glBindFramebuffer(GL_FRAMEBUFFER, 0);

    this->shadowFramebuffer = framebuffer;
    this->shadowTexture = shadowTexture;
}
