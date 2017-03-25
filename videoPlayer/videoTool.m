//
//  videoTool.m
//  videoPlayer
//
//  Created by 鄭偉強 on 2017/3/21.
//  Copyright © 2017年 Wei. All rights reserved.
//

#import "videoTool.h"
#import "videoModel.h"
#import "GDataXMLNode.h"

@interface videoTool ()<NSXMLParserDelegate>
@property (nonatomic, strong) NSMutableArray *videos;

@end

@implementation videoTool

- (NSArray *)parseJSONData:(NSData *)data
{
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    NSArray *array = dict[@"videos"];
    
    NSMutableArray *videos = [NSMutableArray arrayWithCapacity:array.count];
    for (NSDictionary *tmp in array) {
        videoModel *model = [videoModel videoModelWithDict:tmp];
        [videos addObject:model];
    }
    
    return videos;
}

- (NSArray *)parseXMLData:(NSData *)data
{
    // GDateXML解析方法：使用此法解析程式碼較為簡單，但僅適合小型專案。
    // return [self DOMparseXMLWithData:data];
    
    // 原始的解析方法
     return [self SAXparseXMLWithData:data];
     
}

// GDataXML解析
- (NSArray *)DOMparseXMLWithData:(NSData *)data
{
    // 1.加載文檔
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:data options:0 error:nil];
    
    // 2.獲得根元素
    GDataXMLElement *root = doc.rootElement;
    
    // 3.獲得所有video元素
    NSArray *elements = [root elementsForName:@"video"];
    
    // 4.將GDataXMLElement對象轉成HMVideo模型
    NSMutableArray *videos = [NSMutableArray array];
    for (GDataXMLElement *ele in elements) {
        videoModel *video = [[videoModel alloc] init];
        video.ID = [ele attributeForName:@"id"].stringValue.intValue;
        video.length = [ele attributeForName:@"length"].stringValue.intValue;
        video.name = [ele attributeForName:@"name"].stringValue;
        video.image = [ele attributeForName:@"image"].stringValue;
        video.url = [ele attributeForName:@"url"].stringValue;
        [videos addObject:video];
    }
    return videos;}


// NSXMLParser解析
- (NSArray *)SAXparseXMLWithData:(NSData *)data
{
    // 1.創建解析器
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    // 2.設置代理
    parser.delegate = self;
    // 3.開始解析
    [parser parse];
    
    return self.videos;
}

#pragma mark - NSXMLParserDelegate

//  開始解析文檔時调用
- (void)parserDidStartDocument:(NSXMLParser *)parser
{
//        NSLog(@"parserDidStartDocument----");

}

// 结束解析文檔時调用(解析完畢)
- (void)parserDidEndDocument:(NSXMLParser *)parser
{
//        NSLog(@"parserDidEndDocument----");

}

// 解析到一個元素的開頭時调用 <videos>
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict
{
    
    //    NSLog(@"didStartElement----%@", elementName);
    if ([@"videos" isEqualToString:elementName]) { // 解析到一个videos標簽
        self.videos = [NSMutableArray array];
    } else if ([@"video" isEqualToString:elementName]) { // 解析到一个video標簽, 創建一个模型
        videoModel *model = [videoModel videoModelWithDict:attributeDict];
        [self.videos addObject:model];
    }
}

// 解析到一个元素的结尾時调用 </videos>
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
//        NSLog(@"didEndElement----%@", elementName);

}



@end
