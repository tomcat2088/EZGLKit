//
// Created by wang yang on 2016/11/27.
//

#ifndef EZGL_ELCUBEGEOMETRY_H
#define EZGL_ELCUBEGEOMETRY_H

#include "ELVertexBufferGeometry.h"
#include "utils/ELGeometryVertexBuffer.h"

class ELSphereGeometry : public ELVertexBufferGeometry {
public:
    ELSphereGeometry(ELFloat radius, ELFloat ring, ELFloat segments);
    ELSphereGeometry(ELFloat radius, ELFloat ring, ELFloat segments, bool smooth);

    virtual void fillVertexBuffer(ELGeometryVertexBuffer *vertexBuffer);
    virtual void render();
private:
    ELFloat radius;
    ELFloat ring;
    ELFloat segments;

    void genHalfSphere(ELInt step, ELGeometryVertexBuffer *vertexBuffer);
};


#endif //EZGL_ELCUBEGEOMETRY_H
