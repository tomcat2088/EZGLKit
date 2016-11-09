//
//  ObjLoader.m
//  OpenESRD
//
//  Created by wang yang on 2016/10/6.
//  Copyright © 2016年 wangyang. All rights reserved.
//

#import "EZGLWaveFrontFile.h"

#import "tiny_obj_loader.h"
#import "UIImage+GL.h"

@implementation EZGLWaveFrontShape

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.material = [EZGLMaterial defaultMaterial];
    }
    return self;
}

@end


@implementation EZGLWaveFrontFile

- (instancetype)initWithFilePath:(NSString *)path {
    self = [super init];
    if (self) {
        [self loadFromObjFile:path];
    }
    return self;
}

- (void)loadFromObjFile:(NSString *)file {
    std::string inputfile = std::string([file cStringUsingEncoding:NSUTF8StringEncoding]);
    tinyobj::attrib_t attrib;
    std::vector<tinyobj::shape_t> shapes;
    std::vector<tinyobj::material_t> materials;

    std::string err;
    std::string resourcePath([[[[NSBundle mainBundle] resourcePath] stringByAppendingString:@"/"] cStringUsingEncoding:NSUTF8StringEncoding]);
    tinyobj::LoadObj(&attrib, &shapes, &materials, &err, inputfile.c_str(),resourcePath.c_str());

    if (!err.empty()) { // `err` may contain warning message.
        NSLog(@"%@", [NSString stringWithUTF8String:err.c_str()]);
    }

    std::vector<GLfloat> vertices;
    std::vector<tinyobj::index_t> indices;
    NSArray *glMaterials = [self loadMaterials:materials];
    NSMutableArray *glShapes = [NSMutableArray new];
    for (size_t s = 0; s < shapes.size(); s++) {
        EZGLWaveFrontShape * shape = [self buildShape:shapes.at(s) attrib:attrib materials:glMaterials];
        [glShapes addObject:shape];
    }
    self.shapes = [glShapes copy];
}

- (EZGLWaveFrontShape *)buildShape:(tinyobj::shape_t)shape attrib:(tinyobj::attrib_t)attrib materials:(NSArray *)materials {
    std::vector<tinyobj::index_t> indices;
    for (size_t index = 0; index < shape.mesh.indices.size(); index++) {
        tinyobj::index_t indice = shape.mesh.indices[index];
        indices.push_back(indice);
    }
    
    EZGLWaveFrontShape *glShape = [EZGLWaveFrontShape new];
    if (shape.mesh.material_ids[0] >= 0 && shape.mesh.material_ids[0] < materials.count) {
        glShape.material = materials[shape.mesh.material_ids[0]];
    }
    std::vector<GLfloat> buffer = [self generateVertexBuffer:attrib indices:indices];
    [self generateVertexVBO:buffer shape:glShape];
    return glShape;
}

- (NSArray *)loadMaterials:(std::vector<tinyobj::material_t>)materials {
    NSMutableArray *mats = [NSMutableArray new];

    for (size_t index = 0; index < materials.size(); index++) {
        EZGLMaterial *material = [EZGLMaterial new];
        tinyobj::material_t material_t = materials.at(index);
        material.ambient = GLKVector4Make(material_t.ambient[0], material_t.ambient[1], material_t.ambient[2], 1.0);
        material.specular = GLKVector4Make(material_t.specular[0], material_t.specular[1], material_t.specular[2], 1.0);
        material.diffuse = GLKVector4Make(material_t.diffuse[0], material_t.diffuse[1], material_t.diffuse[2], 1.0);
        material.diffuseMap = [self loadTexture:material_t.diffuse_texname];
        [mats addObject:material];
    }

    return [mats copy];
}

- (GLuint)loadTexture:(std::string)texName {
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    NSString *diffuseMapFileName = [NSString stringWithFormat:@"%@/%@",resourcePath,[NSString stringWithUTF8String:texName.c_str()]];
    UIImage *diffuseImage = [UIImage imageWithContentsOfFile:diffuseMapFileName];
    if (diffuseImage) {
        return [UIImage textureFromCGImage:diffuseImage.CGImage];
    }
    return 0;
}

- (std::vector<GLfloat>)generateVertexBuffer:(tinyobj::attrib_t)attrib indices:(std::vector<tinyobj::index_t>)indices {
    std::vector<GLfloat> vertices;
    std::vector<GLfloat> tangents;
    std::vector<GLfloat> bitangents;
    
    std::vector<GLKVector3> positions;
    std::vector<GLKVector2> uvs;
    for (size_t i = 0; i < indices.size(); i++) {
        tinyobj::index_t indice = indices[i];
        GLfloat x = attrib.vertices[indice.vertex_index * 3 + 0];
        GLfloat y = attrib.vertices[indice.vertex_index * 3 + 1];
        GLfloat z = attrib.vertices[indice.vertex_index * 3 + 2];
        GLfloat u = attrib.texcoords[indice.texcoord_index * 2 + 0];
        GLfloat v = attrib.texcoords[indice.texcoord_index * 2 + 1];
        GLfloat nx = attrib.texcoords[indice.normal_index * 3 + 0];
        GLfloat ny = attrib.texcoords[indice.normal_index * 3 + 1];
        GLfloat nz = attrib.texcoords[indice.normal_index * 3 + 2];
        
        positions.push_back(GLKVector3Make(x, y, z));
        uvs.push_back(GLKVector2Make(u, v));
        GLKVector3 tangent,bitangent;
        [self caculateTangents:&tangent bitangents:&bitangent position:GLKVector3Make(x, y, z) normal:GLKVector3Make(nx, ny, nz)];
        tangents.push_back(tangent.x);
        tangents.push_back(tangent.y);
        tangents.push_back(tangent.z);
        bitangents.push_back(bitangent.x);
        bitangents.push_back(bitangent.y);
        bitangents.push_back(bitangent.z);
        
        
//        if (positions.size() == 3) {
//            GLKVector3 tangent,bitangent;
//            [self caculateTangents:&tangent bitangents:&bitangent position:GLKVector3Make(x, y, z) normal:GLKVector3Make(nx, ny, nz)];
//            
//            
//            [self caculateTangents:&tangent bitangents:&bitangent positions:positions uvs:uvs];
//            
//            for (int i=0; i < 3; i++) {
//                tangents.push_back(tangent.x);
//                tangents.push_back(tangent.y);
//                tangents.push_back(tangent.z);
//                bitangents.push_back(bitangent.x);
//                bitangents.push_back(bitangent.y);
//                bitangents.push_back(bitangent.z);
//            }
//            positions.clear();
//        }
    }
    
    
    for (size_t i = 0; i < indices.size(); i++) {
        tinyobj::index_t indice = indices[i];
        GLfloat x = attrib.vertices[indice.vertex_index * 3 + 0];
        GLfloat y = attrib.vertices[indice.vertex_index * 3 + 1];
        GLfloat z = attrib.vertices[indice.vertex_index * 3 + 2];
        GLfloat u = attrib.texcoords[indice.texcoord_index * 2 + 0];
        GLfloat v = attrib.texcoords[indice.texcoord_index * 2 + 1];
        
        vertices.push_back(x);
        vertices.push_back(y);
        vertices.push_back(z);
        vertices.push_back(attrib.normals[indice.normal_index * 3 + 0]);
        vertices.push_back(attrib.normals[indice.normal_index * 3 + 1]);
        vertices.push_back(attrib.normals[indice.normal_index * 3 + 2]);
        vertices.push_back(u);
        vertices.push_back(v);
        vertices.push_back(tangents[i * 3 + 0]);
        vertices.push_back(tangents[i * 3 + 1]);
        vertices.push_back(tangents[i * 3 + 2]);
        vertices.push_back(bitangents[i * 3 + 0]);
        vertices.push_back(bitangents[i * 3 + 1]);
        vertices.push_back(bitangents[i * 3 + 2]);
    }
    
    
    return vertices;
}

- (void)caculateTangents:(GLKVector3 *)pTangent bitangents:(GLKVector3 *)pBitangent position:(GLKVector3)position normal:(GLKVector3)normal {
    CGFloat x = position.x;
    CGFloat y = position.y;
    CGFloat z = position.z;
    CGFloat nx = normal.x;
    CGFloat ny = normal.y;
    CGFloat nz = normal.z;

    CGFloat x1 = x + 1;CGFloat z1 = z + 1;CGFloat y1 = (nz * (z - z1) + nx * (x - x1))/ny + y;
    GLKVector3 resultY = GLKVector3Make(x1 - x, y1 - y, z1 - z);
    
    x1 = x + 1;y1 = y + 1;z1 = (ny * (y - y1) + nx * (x - x1))/nz + z;
    GLKVector3 resultZ = GLKVector3Make(x1 - x, y1 - y, z1 - z);
    
    z1 = z + 1;y1 = y + 1;x1 = (ny * (y - y1) + nz * (z - z1))/nx + x;
    GLKVector3 resultX = GLKVector3Make(x1 - x, y1 - y, z1 - z);

    if (resultX.x < 50) {
        *pTangent = resultX;
        *pBitangent = GLKVector3CrossProduct(normal, resultX);
    } else if (resultY.y < 50) {
        *pTangent = resultY;
        *pBitangent = GLKVector3CrossProduct(normal, resultY);
    } else {
        *pTangent = resultZ;
        *pBitangent = GLKVector3CrossProduct(normal, resultZ);
    }
}

- (void)caculateTangents:(GLKVector3 *)pTangent bitangents:(GLKVector3 *)pBitangent positions:(std::vector<GLKVector3>)positions uvs:(std::vector<GLKVector2>)uvs {
    GLKVector3 deltaPos1 = GLKVector3Subtract(positions[1],positions[0]);
    GLKVector3 deltaPos2 = GLKVector3Subtract(positions[2],positions[0]);

    GLKVector2 deltaUV1 = GLKVector2Subtract(uvs[1],uvs[0]);
    GLKVector2 deltaUV2 = GLKVector2Subtract(uvs[2],uvs[0]);
    float r = 1.0f / (deltaUV1.x * deltaUV2.y - deltaUV1.y * deltaUV2.x);
    
    GLKVector3 tangent = GLKVector3Subtract(GLKVector3MultiplyScalar(deltaPos1, deltaUV2.y), GLKVector3MultiplyScalar(deltaPos2,deltaUV1.y));
    *pTangent = GLKVector3MultiplyScalar(tangent,r);

    GLKVector3 bitangent = GLKVector3Subtract(GLKVector3MultiplyScalar(deltaPos2, deltaUV1.x), GLKVector3MultiplyScalar(deltaPos1,deltaUV2.x));
    *pBitangent = GLKVector3MultiplyScalar(bitangent,r);
}

- (void)generateVertexVBO:(std::vector<float>)vertices shape:(EZGLWaveFrontShape *)shape {
    GLuint vertexVBO;
    GLfloat *pVertices = vertices.data();
    glGenBuffers(1, &vertexVBO);
    glBindBuffer(GL_ARRAY_BUFFER, vertexVBO);
    glBufferData(GL_ARRAY_BUFFER, sizeof(GLfloat) * vertices.size(), pVertices, GL_STATIC_DRAW);
    glBindBuffer(GL_ARRAY_BUFFER, 0);

    shape.vertexVBO = vertexVBO;
    shape.vertexStride = sizeof(GLfloat) * 14;
    shape.vertexCount = (GLsizei)(vertices.size() / 14);
}

- (void)generateIndiceVBO:(std::vector<tinyobj::index_t>)indices shape:(EZGLWaveFrontShape *)shape {
    GLuint indiceVBO;
    std::vector<GLuint> vertexIndices;
    for (size_t index = 0; index < indices.size(); index++) {
        vertexIndices.push_back((GLuint)indices[index].vertex_index);
    }
    GLuint *pIndices = (GLuint *)vertexIndices.data();
    glGenBuffers(1, &indiceVBO);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, indiceVBO);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(GLuint) * vertexIndices.size(), pIndices, GL_STATIC_DRAW);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);

    shape.indiceVBO = indiceVBO;
    shape.indiceCount = (GLsizei)vertexIndices.size();
}

@end
