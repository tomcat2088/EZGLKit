//
// Created by wangyang on 16/11/24.
//

#ifndef EZGL_ELCAMERA_H
#define EZGL_ELCAMERA_H

#include "types/EZGLTypes.h"
#include "ELNode.h"

class ELCamera : public ELNode {
public:
    ELVector3 eye;
    ELVector3 lookAt;
    ELVector3 up;
    ELFloat nearZ;
    ELFloat farZ;
    ELFloat fovyRadians;
    ELFloat aspect;

    ELFloat radiansAroundLeft;
    ELFloat radiansAroundUp;
    ELFloat radiansAroundForward;

    ELVector3 translation;

    ELVector4 orthoView;

public:
    // Perspective Camera
    ELCamera();
    ELCamera(ELVector3 eye,ELVector3 lookAt,ELVector3 up,ELFloat fovyRadians,ELFloat aspect,ELFloat nearZ,ELFloat farZ);
    void asOrtho(ELFloat left,ELFloat right,ELFloat top,ELFloat bottom,ELFloat nearZ,ELFloat farZ);

    //TODO: Orth Camera Construct

    ELMatrix4 matrix();
    void rotateEye(ELFloat radians, ELVector3 axis);
    void rotateLookAtAroundUp(ELFloat radians);
    void rotateLookAtAroundLeft(ELFloat radians);
    void rotateLookAtAroundForward(ELFloat radians);
    void translateForward(ELFloat distance);
    void translateUp(ELFloat distance);
    void translateLeft(ELFloat distance);
    void translateTo(ELVector3 loc);

    void lockOn(ELTransform *transform);

    ELVector3 forward();
//    ELVector3 left();
//    ELVector3 up();
    ELVector3 position();
    ELVector3 lookAtPosition();

    virtual void update(ELFloat timeInSecs);

private:
    bool isOrtho;
    ELVector3 leftVector();
    ELVector3 forwardVector();
    ELQuaternion quaternion();

    ELTransform * lockOnTransform;
};


#endif //EZGL_ELCAMERA_H