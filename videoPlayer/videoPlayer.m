//
//  videoPlayer.m
//  videoPlayer
//
//  Created by 鄭偉強 on 2017/3/21.
//  Copyright © 2017年 Wei. All rights reserved.
//

#import "videoPlayer.h"

@implementation videoPlayer
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 移除程式進入後台的通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:nil];
    
}

#pragma mark - 實现這個方法来控制螢幕方向
/**
 *  控制當前控制器支持哪些方向
 *  返回值是UIInterfaceOrientationMask*
 */
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    /**
     typedef NS_OPTIONS(NSUInteger, UIInterfaceOrientationMask) {
     UIInterfaceOrientationMaskPortrait = (1 << UIInterfaceOrientationPortrait),
     UIInterfaceOrientationMaskLandscapeLeft = (1 << UIInterfaceOrientationLandscapeLeft),
     UIInterfaceOrientationMaskLandscapeRight = (1 << UIInterfaceOrientationLandscapeRight),
     UIInterfaceOrientationMaskPortraitUpsideDown = (1 << UIInterfaceOrientationPortraitUpsideDown),
     UIInterfaceOrientationMaskLandscape = (UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight),
     UIInterfaceOrientationMaskAll = (UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight | UIInterfaceOrientationMaskPortraitUpsideDown),
     UIInterfaceOrientationMaskAllButUpsideDown = (UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight),
     }
     */
    return UIInterfaceOrientationMaskLandscape;
}

@end
