//
//  videoModel.h
//  videoPlayer
//
//  Created by 鄭偉強 on 2017/3/21.
//  Copyright © 2017年 Wei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface videoModel : NSObject
/**
 *  ID
 */
@property (assign, nonatomic) int ID;
/**
 *  名稱
 */
@property (copy, nonatomic) NSString *name;
/**
 *  長度
 */
@property (assign, nonatomic) int length;
/**
 *  圖片
 */
@property (copy, nonatomic) NSString *image;
/**
 *  鏈接
 */
@property (copy, nonatomic) NSString *url;

+(instancetype)videoModelWithDict:(NSDictionary *)dict;

@end
