//
//  ViewController.m
//  videoPlayer
//
//  Created by 鄭偉強 on 2017/3/21.
//  Copyright © 2017年 Wei. All rights reserved.
//

#import "ViewController.h"
#import "videoModel.h"
#import "MBProgressHUD+MJ.h"
#import "videoTool.h"
#import "videoCell.h"
#import <MediaPlayer/MediaPlayer.h>
#import "videoPlayer.h"
//#import <AVKit/AVKit.h>
//#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
@property (nonatomic, strong) NSArray *videos;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [MBProgressHUD showMessage:@"正在加載影片中..."];
    
    // XML
    NSString *urlString = @"http://172.20.10.2:8080/MJServer/video?type=XML";

    
    // Json
    // NSString *urlString = @"http://172.20.10.2:8080/MJServer/video?type=JSON";
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:5.0];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
       
        [MBProgressHUD hideHUD];
        
        if (data) {
            videoTool *tool = [[videoTool alloc] init];
            
            // XML
            self.videos = [tool parseXMLData:data];
            
            // JSON
            // self.videos = [tool parseJSONData:data];
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
            
        } else {
            [MBProgressHUD showMessage:@"網路繁忙"];
        }
    }];
    [task resume];
}

#pragma mark - tableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.videos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    videoCell *cell = [videoCell cellWithTableView:tableView];
    
    cell.video = self.videos[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // MediaPlayer已停用，改用AVKit + AVFoundation(下次改版時候修改)
    videoModel *video = self.videos[indexPath.row];
    NSString *videoUrl = [NSString stringWithFormat:@"http://172.20.10.2:8080/MJServer/%@",video.url];
    videoPlayer *player = [[videoPlayer alloc] initWithContentURL:[NSURL URLWithString:videoUrl]];
    [self presentMoviePlayerViewControllerAnimated:player];
    
//    MPMoviePlayerViewController // 只能全屏播放("此專案用此方法")
//    MPMoviePlayerController; // 可以随意控制播放器的尺寸
}




@end
