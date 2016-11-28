//
// Created by wangyang on 16/11/25.
//

#include <core/ELLight.h>
#include "ELEffect.h"
#include "core/ELProgram.h"
#include "core/ELGameObject.h"

ELEffect::ELEffect() {

}

ELEffect::ELEffect(const char *vertexShader,const char *fragmentShader) {
    program = new ELProgram(vertexShader, fragmentShader);
}

ELEffect::~ELEffect() {
    delete program;
}

ELEffect * ELEffect::defaultEffect() {
    return new ELEffect();
}

void ELEffect::prepare() {
    glUseProgram(program->value);

    ELGameObject *gameObj = (ELGameObject *)gameObject();
    std::vector<ELLight *> lights = gameObj->lights();

    char buffer[128];

    for (int index = 0; index < lights.size(); ++index) {
        ELLight *light = lights[index];
        snprintf(buffer, 1024, "lights[%d].color",index);
        glUniform4fv(program->uniform(buffer), 1, light->color.v);
        snprintf(buffer, 1024, "lights[%d].position",index);
        glUniform3fv(program->uniform(buffer), 1, light->position.v);
        snprintf(buffer, 1024, "lights[%d].intensity",index);
        glUniform1f(program->uniform(buffer), light->intensity);
    }

    glUniform1i(program->uniform("lightNum"), lights.size());
}

std::string ELEffect::kind() {
    return "effect";
}