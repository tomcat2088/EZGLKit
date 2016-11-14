//
//  EZGLRigidBody.m
//  OpenESRD
//
//  Created by wangyang on 2016/10/18.
//  Copyright © 2016年 wangyang. All rights reserved.
//

#import "EZGLRigidBody.h"
#import "btBulletDynamicsCommon.h"
#import "btBulletCollisionCommon.h"

#import "EZGLGeometry.h"

@interface EZGLRigidBody () {
    btRigidBody *rigidBody;
    btVector3 adjustOffset;
}
@end

@implementation EZGLRigidBody
- (instancetype)initAsSphere:(float)radius mass:(float)mass geometry:(EZGLGeometry *)geometry
{
    self = [super init];
    if (self) {
        adjustOffset = btVector3(0,0,0);
        btCollisionShape *shape = new btSphereShape(radius);
        shape->setUserPointer((__bridge void *)self);
        btTransform defaultTransform = [self btTransformFromGeometry:geometry];
        btDefaultMotionState *motionState = new btDefaultMotionState(defaultTransform);
        btVector3 fallInertia(0,0,0);
        shape->calculateLocalInertia(mass, fallInertia);
        
        rigidBody = new btRigidBody(mass,motionState,shape,fallInertia);
        rigidBody->setRestitution(.4);
        
        self.geometry = geometry;
    }
    return self;
}

- (instancetype)initAsBox:(GLKVector3)halfMargins mass:(float)mass geometry:(EZGLGeometry *)geometry
{
    self = [super init];
    if (self) {
        adjustOffset = btVector3(0,0,0);
        btCollisionShape *shape = new btBoxShape(btVector3(halfMargins.x,halfMargins.y,halfMargins.z));
        shape->setUserPointer((__bridge void *)self);
        btTransform defaultTransform = [self btTransformFromGeometry:geometry];
        btDefaultMotionState *motionState = new btDefaultMotionState(defaultTransform);
        btVector3 fallInertia(0,0,0);
        shape->calculateLocalInertia(mass, fallInertia);
        
        rigidBody = new btRigidBody(mass,motionState,shape,fallInertia);
        rigidBody->setRestitution(.4);
        
        self.geometry = geometry;
    }
    return self;
}

- (instancetype)initAsCone:(GLfloat)radius height:(GLfloat)height mass:(float)mass geometry:(EZGLGeometry *)geometry
{
    self = [super init];
    if (self) {
        adjustOffset = btVector3(0,0,0);
        btCollisionShape *shape = new btConeShape(radius,height);
        shape->setUserPointer((__bridge void *)self);
        btTransform defaultTransform = [self btTransformFromGeometry:geometry];
        btDefaultMotionState *motionState = new btDefaultMotionState(defaultTransform);
        btVector3 fallInertia(0,0,0);
        shape->calculateLocalInertia(mass, fallInertia);
        
        rigidBody = new btRigidBody(mass,motionState,shape,fallInertia);
        rigidBody->setRestitution(.4);
        
        self.geometry = geometry;
    }
    return self;
}

- (instancetype)initAsStaticPlane:(float)size geometry:(EZGLGeometry *)geometry
{
    self = [super init];
    if (self) {
        btCollisionShape *shape = new btStaticPlaneShape(btVector3(0,1,0),0);
        shape->setUserPointer((__bridge void *)self);
        adjustOffset = btVector3(0,0,0);
        
        btTransform defaultTransform = [self btTransformFromGeometry:geometry];
        btDefaultMotionState *motionState = new btDefaultMotionState(defaultTransform);
        rigidBody = new btRigidBody(0,motionState,shape,btVector3(0,0,0));
        rigidBody->setRestitution(1);
        self.geometry = geometry;
    }
    return self;
}

- (void *)rigidBody {
    return (void *)rigidBody;
}

- (void)sync {
    [self applyTransform:rigidBody->getWorldTransform() toGeometry:self.geometry];
}

- (void)applyTransform:(btTransform)transform toGeometry:(EZGLGeometry *)geometry {
    geometry.transform.translateX = transform.getOrigin().x() - adjustOffset.x();
    geometry.transform.translateY = transform.getOrigin().y() - adjustOffset.y();
    geometry.transform.translateZ = transform.getOrigin().z() - adjustOffset.z();
    
    btQuaternionFloatData quaternionFloatData;
    transform.getRotation().serialize(quaternionFloatData);

    geometry.transform.quaternion = GLKQuaternionMake((float)quaternionFloatData.m_floats[0], (float)quaternionFloatData.m_floats[1], (float)quaternionFloatData.m_floats[2], (float)quaternionFloatData.m_floats[3]);
}

- (btTransform)btTransformFromGeometry:(EZGLGeometry *)geometry {
    EZGLTransform *glTransform = geometry.transform;
    GLKQuaternion glkQuaternion = geometry.transform.quaternion;
    btQuaternion quaternion(glkQuaternion.x,glkQuaternion.y,glkQuaternion.z,glkQuaternion.w);
    btTransform transform(quaternion,btVector3(glTransform.translateX + adjustOffset.x(),glTransform.translateY + adjustOffset.y(),glTransform.translateZ + adjustOffset.z()));
    return transform;
}

@end
