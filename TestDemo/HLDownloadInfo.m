//
//  HLDownloadInfo.m
//  TestDemo
//
//  Created by hailong on 2016/12/24.
//  Copyright © 2016年 zhl. All rights reserved.
//

#import "HLDownloadInfo.h"
#import "HLFileManager.h"

/** 默认cache 根目录 */
static NSString * const kDownloadCacheDirectory = @"HLDownloadCache";

@interface HLDownloadInfo ()


// >>>>>>>>>>>>>>>>>>>>>>文件 download info
/** 文件url */
@property (nonatomic, strong) NSString *urlString;
/** 文件名 */
@property (nonatomic, strong) NSString *fileName;
/** 文件路径 */
@property (nonatomic, strong) NSString *downloadDirectory;
/** 下载路径 如果设置了downloadDirectory，文件下载完成后会移动到这个目录，否则，在manager默认cache目录里 */
@property (nonatomic, strong) NSString *filePath;

// >>>>>>>>>>>>>>>>>>>>>> task info
/** 下载状态 */
@property (nonatomic, assign) HLDownloadState donwloadState;
/** 下载进度 */
@property (nonatomic, strong) HLDownLoadProgress *downloadProgress;
/** 下载任务 */
@property (nonatomic, strong) NSURLSessionTask *task;
/** 文件流 */
@property (nonatomic, strong) NSOutputStream *stream;





@end



@implementation HLDownloadInfo

-(id)initWithUrlString:(NSString *)urlString{
    return [self initWithUrlString:urlString filePath:nil];
}
-(id)initWithUrlString:(NSString *)urlString filePath:(NSString *)filePath{
    if (self = [super init]) {
        _urlString = urlString;
        _filePath = filePath;
        
        //fileName
        _fileName = filePath.lastPathComponent;
        _downloadDirectory = filePath.stringByDeletingLastPathComponent;
    }
    return self;
}


#pragma mark - getter
-(NSString *)fileName{
    if (!_fileName) {
        _fileName = _urlString.lastPathComponent;
    }
    return _fileName;
}

-(NSString *)downloadDirectory{
    if (!_downloadDirectory) {
        _downloadDirectory = [[HLFileManager cachesDir] stringByAppendingPathComponent:kDownloadCacheDirectory];
        
//        if ([HLFileManager isExistsAtPath:_downloadDirectory]) {
//            [HLFileManager createDirectoryAtPath:_downloadDirectory];
//        }
    }
    return _downloadDirectory;
}

-(NSString *)filePath{
    if (!_filePath) {
        _filePath = [self.downloadDirectory stringByAppendingPathComponent:self.fileName];
    }
    return _filePath;
}


#pragma mark - download

/** 取消下载 */
-(void)cancel{
    if (!self.task  && self.donwloadState == HLDownloadStateReadying) {
        
    }
    
    [self.task cancel];
    self.donwloadState = HLDownloadStateNone;
}


@end




@implementation HLDownLoadProgress

@end

