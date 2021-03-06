//
// Created by wangyang on 16/11/25.
//

#include "ELGameObject.h"
#include "ELComponent.h"
#include "ELLight.h"

ELGameObject::ELGameObject(ELWorld *world) : ELNode(), world(world) {
    specificEffectName = "";
}

void ELGameObject::addComponent(ELComponent *component) {
    ELNode::addNode(dynamic_cast<ELNode *>(component));
    component->didAddedToGameObject(this);
}

void ELGameObject::render() {
    ELNode::render();
}

std::vector<ELLight *> ELGameObject::lights() {
    std::vector<ELLight *> lights = getNodesFromWorld<ELLight *>();
    return lights;
}

ELCamera * ELGameObject::mainCamera() {
    return world->activedCamera;
}

ELEffect * ELGameObject::activeEffect() {
    if (specificEffectName != "") {
        ELEffect * effect = (ELEffect *)world->findChildWithIdentity(specificEffectName);
        if (effect != NULL) {
            return effect;
        }
    }
    return world->activedEffect;
}

template <typename T>
std::vector<T> ELGameObject::getNodesFromWorld() {
    std::vector<T> nodes;
    for (int i = 0; i < world->children.size(); ++i) {
        T node = dynamic_cast<T>(world->children.at(i));
        if (node != NULL) {
            nodes.push_back(node);
        }
    }
    return nodes;
}
