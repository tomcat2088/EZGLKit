//
// Created by wangyang on 16/11/24.
//

#ifndef EZGL_EZGLBASE_H
#define EZGL_EZGLBASE_H

#define Platform_OSX 1

#include <string>
#include <vector>
#include <map>

#include "glad/glad.h"

#if Platform_OSX
#include <GLFW/glfw3.h>
#endif

#define glBindVertexArrayEL(value) glad_glBindVertexArray(value)
#define glGenVertexArraysEL(num, value) glad_glGenVertexArrays(num, value)

#define BUFFER_OFFSET(i) ((char *)NULL + (i))

#endif //EZGL_EZGLBASE_H