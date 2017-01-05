//
// Created by wangyang on 16/12/30.
//

#ifndef EZGL_ELDAELOADER_H
#define EZGL_ELDAELOADER_H

#include <fbxsdk.h>
#include "component/ELGeometry.h"
#include <vector>

class ELGeometryVertexBuffer;
class ELMeshGeometry;

class ELFBXLoader {
public:
    static void setupFbxEnv();
    static std::vector<ELMeshGeometry *> loadFromFile(const char *filePath);
    static ELMeshGeometry *loadMesh(FbxMesh *mesh);
    static void loadAnimation(FbxScene *scene);
    static void loadSkin(FbxMesh *mesh);
    static void computerLinearDeformation(FbxAMatrix& pGlobalPosition, FbxMesh *mesh, FbxTime time);
    static void computerClusterDeformation(FbxAMatrix& pGlobalPosition, FbxMesh *mesh, FbxCluster *cluster, FbxAMatrix& vertexTransform);
private:
    static FbxManager *fbxManager;

    static void generateVertexVBO(ELGeometryVertexBuffer *buffer, ELGeometryData * geometryData);
};


#endif //EZGL_ELDAELOADER_H
