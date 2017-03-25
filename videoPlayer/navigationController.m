//
//  navigationController.m
//  videoPlayer
//
//  Created by 鄭偉強 on 2017/3/22.
//  Copyright © 2017年 Wei. All rights reserved.
//

#import "navigationController.h"

@interface navigationController ()

@end

@implementation navigationController

#pragma mark - 實現這個方法来控制螢幕方向
/**
 *  控制當前控制器支持哪些方向
 *  返回值是UIInterfaceOrientationMask*
 */
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    /**
     *  UIInterfaceOrientationMaskPortrait : 直屏(正常)
     *  UIInterfaceOrientationMaskPortraitUpsideDown : 直屏(上下颠倒)
     *  UIInterfaceOrientationMaskLandscapeLeft : 横屏向左
     *  UIInterfaceOrientationMaskLandscapeRight : 横屏向右
     *  UIInterfaceOrientationMaskLandscape : 横屏(横屏向左\横屏向右)
     *  UIInterfaceOrientationMaskAll : 全部方向(包括上面的所有情况)
     */
    return UIInterfaceOrientationMaskPortrait;
}

@end
