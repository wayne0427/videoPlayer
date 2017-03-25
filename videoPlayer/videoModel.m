//
//  videoModel.m
//  videoPlayer
//
//  Created by 鄭偉強 on 2017/3/21.
//  Copyright © 2017年 Wei. All rights reserved.
//

#import "videoModel.h"

@implementation videoModel
    /**
     dict = { "id":1,
     "url":"resources/videos/minion_01.mp4",
     "name":"測試影片 第01部",
     "length":10,
     "image":"resources/images/minion_01.png" }
     */

+ (instancetype)videoModelWithDict:(NSDictionary *)dict
{
    videoModel *video = [[videoModel alloc] init];
    video.name = dict[@"name"];
    video.image = dict[@"image"];
    video.url = dict[@"url"];
    video.length = [dict[@"length"] intValue];
    video.ID = [dict[@"id"] intValue];

    return video;
}

@end
