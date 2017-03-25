//
//  videoTool.h
//  videoPlayer
//
//  Created by 鄭偉強 on 2017/3/21.
//  Copyright © 2017年 Wei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface videoTool : NSObject
- (NSArray *)parseJSONData:(NSData *)data;
- (NSArray *)parseXMLData:(NSData *)data;

@end
