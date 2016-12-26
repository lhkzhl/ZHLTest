//
//  HLDownLoadManager.m
//  TestDemo
//
//  Created by hailong on 2016/12/24.
//  Copyright © 2016年 zhl. All rights reserved.
//

#import "HLDownLoadManager.h"

@interface HLDownLoadManager() <NSURLSessionDelegate>

@end


@implementation HLDownLoadManager




#pragma mark - init
+(HLDownLoadManager *)manager{
    static HLDownLoadManager *shareManager  = nil;
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        shareManager = [[self alloc] init];
    });
    return shareManager;
}

#pragma mark - getter
-(NSURLSession *)session{
    if (!_session) {
        _session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:self.queue];
    }
    return _session;
}

#pragma mark - downlaod
-(HLDownloadInfo *)downloadUrlString:(NSString *)urlString toDestinationPath:(NSString *)destinationPath progress:(HLDownloadProgressChangedBlock)progress state:(HLDownloadStateChangedBlock)state{
    NSAssert(urlString, @"urlStign can't be nil");
    
    HLDownloadInfo *info = [self downloadInfoForUrlString:urlString];
    info.progressChangedBlock = progress;
    info.stateChangedBlcok = state;
    
    return info;
}
#pragma mark - 获得下载信息
-(HLDownloadInfo *)downloadInfoForUrlString:(NSString *)urlString{
    HLDownloadInfo *downloadInfo = [[HLDownloadInfo alloc] initWithUrlString:urlString];
    return downloadInfo;
}


#pragma mark - NSURLSessionDelegate

- (void)URLSession:(NSURLSession *)session didBecomeInvalidWithError:(nullable NSError *)error{
    
}
- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge
 completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * _Nullable credential))completionHandler{
    
}
- (void)URLSessionDidFinishEventsForBackgroundURLSession:(NSURLSession *)session {
    
}


@end
