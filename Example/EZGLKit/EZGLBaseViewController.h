//
//  EZGLBaseViewController.h
//  EZGLKit
//
//  Created by wangyang on 2016/11/11.
//  Copyright © 2016年 ocean. All rights reserved.
//

#import <GLKit/GLKit.h>
#import <EZGLKit/EZGLKit.h>

@interface EZGLBaseViewController : GLKViewController

@property (strong, nonatomic) EZGLWorld *world;

// override this
- (NSString *)shaderName;

@end