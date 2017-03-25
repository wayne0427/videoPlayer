//
//  videoCell.m
//  videoPlayer
//
//  Created by 鄭偉強 on 2017/3/21.
//  Copyright © 2017年 Wei. All rights reserved.
//

#import "videoCell.h"
#import "videoModel.h"
#import "UIImageView+WebCache.h"
#import "UIView+Extension.h"

@interface videoCell ()
@property (nonatomic, weak) UIView *divider;
@end

@implementation videoCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"video";
    videoCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[videoCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIView *divider = [[UIView alloc] init];
        divider.backgroundColor = [UIColor lightGrayColor];
        divider.alpha = 0.2;
        [self.contentView addSubview:divider];
        self.divider = divider;
    }
    return self;
}


- (void)setVideo:(videoModel *)video
{
    _video = video;
    
    self.textLabel.text = video.name;
    self.detailTextLabel.text = [NSString stringWithFormat:@"片長:%d分鐘" , video.length];
    
    // video.image == resources/images/minion_01.png
    NSString *imageUrl = [NSString stringWithFormat:@"http://172.20.10.2:8080/MJServer/%@", video.image];
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"pic"]];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 調整子控件的frame
    CGFloat imageX = 10;
    CGFloat imageY = 10;
    CGFloat imageH = self.height - 2 * imageY;
    CGFloat imageW = imageH * 200 / 112;
    self.imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    
    //    CGRect textF = self.textLabel.frame;
    //    textF.origin.x = CGRectGetMaxX(self.imageView.frame) + 10;
    //    self.textLabel.frame = textF;
    self.textLabel.x = CGRectGetMaxX(self.imageView.frame) + 10;
    
    //    CGRect detailTextF = self.detailTextLabel.frame;
    //    detailTextF.origin.x = textF.origin.x;
    //    self.detailTextLabel.frame = detailTextF;
    self.detailTextLabel.x = self.textLabel.x;
    
    CGFloat dividerH = 1;
    CGFloat dividerY = self.height - dividerH;
    CGFloat dividerW = self.width;
    self.divider.frame = CGRectMake(0, dividerY, dividerW, dividerH);
}





@end
