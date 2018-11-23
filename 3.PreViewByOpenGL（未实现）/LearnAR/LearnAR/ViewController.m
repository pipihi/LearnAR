//
//  ViewController.m
//  LearnAR
//
//  Created by Beauty-jishu on 2018/8/6.
//  Copyright © 2018年 码叔. All rights reserved.
//

#import "ViewController.h"
#import "Scene.h"

@interface ViewController () <ARSKViewDelegate>

@property(nonatomic, strong)  ARSession * arSession;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    // Create a session configuration
    // 创建一个会话配置
    ARWorldTrackingConfiguration *configuration = [ARWorldTrackingConfiguration new];
    self.arSession = [[ARSession alloc] init];
    [self.arSession runWithConfiguration:configuration];
    self.arSession.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - ARSessionDelegate

/**
 This is called when a new frame has been updated.
 当有新一帧的时候被调用
 @param session The session being run.
 @param frame The frame that has been updated.
 */
- (void)session:(ARSession *)session didUpdateFrame:(ARFrame *)frame {
    CVPixelBufferRef pixelBuffer = frame.capturedImage;
    size_t width = CVPixelBufferGetWidth(pixelBuffer);
    size_t height = CVPixelBufferGetHeight(pixelBuffer);
    // 两个平面 Y-UV
    size_t planeCount = CVPixelBufferGetPlaneCount(pixelBuffer);
//  OSType format = CVPixelBufferGetPixelFormatType(pixelBuffer)
    void *yBaseAddress = CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0);
    void *uvBaseAddress = CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 1);

    NSLog(@"frame:width=%lu, height=%lu, paneCount=%lu", width, height, planeCount);
}

/**
 This is called when new anchors are added to the session.

 @param session The session being run.
 @param anchors An array of added anchors.
 */
- (void)session:(ARSession *)session didAddAnchors:(NSArray<ARAnchor*>*)anchors {

}

/**
 This is called when anchors are updated.

 @param session The session being run.
 @param anchors An array of updated anchors.
 */
- (void)session:(ARSession *)session didUpdateAnchors:(NSArray<ARAnchor*>*)anchors {

}

/**
 This is called when anchors are removed from the session.

 @param session The session being run.
 @param anchors An array of removed anchors.
 */
- (void)session:(ARSession *)session didRemoveAnchors:(NSArray<ARAnchor*>*)anchors {

}

@end
