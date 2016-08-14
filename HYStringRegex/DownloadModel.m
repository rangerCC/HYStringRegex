//
//  DownloadModel.m
//  HYStringRegex
//
//  Created by 恒阳 on 16/8/13.
//  Copyright © 2016年 恒阳. All rights reserved.
//

#import "DownloadModel.h"

#define IMG_DOWNLOAD_URL1 @"http://ww4.sinaimg.cn/bmiddle/0060lm7Tgw1f6n969r39oj30dw0hmgns.jpg"
#define IMG_DOWNLOAD_URL2 @"http://ww3.sinaimg.cn/bmiddle/0060lm7Tgw1f6mf4kgzosj30dw0iiwgi.jpg"

typedef void(^DowonloadHandle)(void);
@implementation DownloadModel
- (instancetype)init
{
    if ((self=[super init])) {
        
    }
    return self;
}

- (DowonloadHandle )getDownloadHandle:(NSString *)url
{
    NSString *urlString = url;
    return ^{
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
        NSError *error = nil;
        NSDate *startTime = [NSDate date];
        
        NSData *data = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:nil
                                                         error:&error];
        if (!error) {
            NSDate *endTime = [NSDate date];
            NSTimeInterval timeInterval = [endTime timeIntervalSinceDate:startTime];
            NSLog(@"download url : %@ , data size: %ld , using time: %f s",urlString,[data length],timeInterval);
        } else {
            NSLog(@"download error : %@",[error userInfo]);
        }
    };
}

- (void)start
{
    dispatch_queue_t downloadQueue1 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t downloadQueue2 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_group_t downloadQueueGroup = dispatch_group_create();
    
    NSDate *startTime = [NSDate date];
    
    dispatch_group_async(downloadQueueGroup, downloadQueue1, [self getDownloadHandle:IMG_DOWNLOAD_URL1]);
    dispatch_group_async(downloadQueueGroup, downloadQueue2, [self getDownloadHandle:IMG_DOWNLOAD_URL2]);
    
    dispatch_group_wait(downloadQueueGroup, DISPATCH_TIME_FOREVER);
    
    NSDate *endTime = [NSDate date];
    NSTimeInterval timeInterval = [endTime timeIntervalSinceDate:startTime];
    
    NSLog(@"download urls total using time : %f s",timeInterval);
}
@end
