//
//  HLDownLoadManager.m
//  TestDemo
//
//  Created by hailong on 2016/12/24.
//  Copyright © 2016年 zhl. All rights reserved.
//

#import "HLDownLoadManager.h"


@interface HLDownloadInfo ()




-(void)setupTaskWithSession:(NSURLSession *)session;

-(void)resume;
-(void)cancel;
-(void)suspend;


-(void)didReceiveResponse:(NSURLResponse *)response;

-(void)didReceiveData:(NSData *)data;

-(void)didCompleteWithError:(NSError *)error;

@end



@interface HLDownLoadManager() <NSURLSessionDataDelegate>

@property (nonatomic,strong) NSMutableDictionary  *downloadInfoDict;

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

-(NSMutableDictionary *)downloadInfoDict{
    if (!_downloadInfoDict) {
        _downloadInfoDict = [NSMutableDictionary dictionary];
    }
    return _downloadInfoDict;
}


#pragma mark - downlaod
-(HLDownloadInfo *)downloadUrlString:(NSString *)urlString toDestinationPath:(NSString *)destinationPath progress:(HLDownloadProgressChangedBlock)progress state:(HLDownloadStateChangedBlock)state{
    NSAssert(urlString, @"urlStign can't be nil");
    
    HLDownloadInfo *info = [self downloadInfoForUrlString:urlString];
    info.progressChangedBlock = progress;
    info.stateChangedBlcok = state;
    
    [info setupTaskWithSession:self.session];
    
    [info resume];
    return info;
}
#pragma mark - 获得下载信息
-(HLDownloadInfo *)downloadInfoForUrlString:(NSString *)urlString{
 
    HLDownloadInfo *downloadInfo = self.downloadInfoDict[urlString];
    if (!downloadInfo) {
        downloadInfo = [[HLDownloadInfo alloc] initWithUrlString:urlString];
        [self.downloadInfoDict setValue:downloadInfo forKey:urlString];
    }
    return downloadInfo;
}


#pragma mark - NSURLSessionDataDelegate

-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler{
    HLDownloadInfo *info = [self downloadInfoForUrlString:dataTask.taskDescription];
    [info didReceiveResponse:response];
    
    completionHandler(NSURLSessionResponseAllow);
}

-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data{
    HLDownloadInfo *info = [self downloadInfoForUrlString:dataTask.taskDescription];
    [info didReceiveData:data];

}

-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error{
    HLDownloadInfo *info = [self downloadInfoForUrlString:task.taskDescription];
    [info didCompleteWithError:error];

    
    //TODO: resume Next
}

@end
