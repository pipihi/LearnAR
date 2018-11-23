//
//  Scene.m
//  LearnAR
//
//  Created by Beauty-jishu on 2018/8/6.
//  Copyright © 2018年 码叔. All rights reserved.
//

#import "Scene.h"

@implementation Scene

- (void)didMoveToView:(SKView *)view {
    // Setup your scene here
}

- (void)update:(CFTimeInterval)currentTime {
    // Called before each frame is rendered
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if (![self.view isKindOfClass:[ARSKView class]]) {
        return;
    }
    
    ARSKView *sceneView = (ARSKView *)self.view;
    ARFrame *currentFrame = [sceneView.session currentFrame];
    
    // Create anchor using the camera's current position
    // 使用当前摄像机（手机）的位置创建抛锚
    if (currentFrame) {
        
        // Create a transform with a translation of 0.2 meters in front of the camera
        // 创建一个变换，移动到摄像机前0.2米
        matrix_float4x4 translation = matrix_identity_float4x4;
        translation.columns[3].z = -0.2f;
        // 当前摄像机位置和位移相乘，就得到了抛锚的位置
        matrix_float4x4 transform = matrix_multiply(currentFrame.camera.transform, translation);
        
        // Add a new anchor to the session
        ARAnchor *anchor = [[ARAnchor alloc] initWithTransform:transform];
        [sceneView.session addAnchor:anchor];
    }
}

@end
