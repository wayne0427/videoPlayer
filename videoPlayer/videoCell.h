//
//  videoCell.h
//  videoPlayer
//
//  Created by 鄭偉強 on 2017/3/21.
//  Copyright © 2017年 Wei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class videoModel;

@interface videoCell : UITableViewCell
@property (nonatomic, strong) videoModel *video;
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
