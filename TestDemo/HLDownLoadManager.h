//
//  HLDownLoadManager.h
//  TestDemo
//
//  Created by hailong on 2016/12/24.
//  Copyright © 2016年 zhl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HLDownloadInfo.h"
@interface HLDownLoadManager : NSObject

/** 最大同时下载数 */
@property(nonatomic, assign) NSInteger maxDownlaodingCount;
/** 回调的队列 */
@property (nonatomic, strong) NSOperationQueue *queue;
/** 下载的session会话 */
@property (nonatomic, strong) NSURLSession *session;

+(HLDownLoadManager *)manager;

-(HLDownloadInfo *)downloadUrlString:(NSString *)urlString toDestinationPath:(NSString *)destinationPath progress:(HLDownloadProgressChangedBlock)progress state:(HLDownloadStateChangedBlock)state;

@end
