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



static NSString * const HLDownloadProgressDidChangeNotification = @"HLDownloadProgressDidChangeNotification";
static NSString * const HLDownloadStateDidChangeNotification = @"HLDownloadStateDidChangeNotification";
static NSString * const HLDownloadInfoKey = @"HLDownloadInfoKey";

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
@property (nonatomic, assign) HLDownloadState downloadState;
/** 下载进度 */
@property (nonatomic, strong) HLDownLoadProgress *downloadProgress;
/** 下载任务 */
@property (nonatomic, strong) NSURLSessionTask *task;
/** 文件流 */
@property (nonatomic, strong) NSOutputStream *stream;

/** 错误 */
@property (nonatomic,strong) NSError  *error;




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
#pragma mark - setter
-(void)setDownloadState:(HLDownloadState)downloadState{
    if (_downloadState != downloadState) {
        _downloadState = downloadState;
        
        [self notifyStateChange];
    }
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
        
        if (![HLFileManager isExistsAtPath:_downloadDirectory]) {
            [HLFileManager createDirectoryAtPath:_downloadDirectory];
        }
        
    }
    return _downloadDirectory;
}

-(NSString *)filePath{
    if (!_filePath) {
        _filePath = [self.downloadDirectory stringByAppendingPathComponent:self.fileName];
    }
    return _filePath;
}


-(void)setupTaskWithSession:(NSURLSession *)session{
    if (self.task) {
        return;
    }
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.urlString]];
    
    NSString *range = [NSString stringWithFormat:@"bytes=%zd-",[[HLFileManager sizeOfFileAtPath:self.filePath] longLongValue]];
    [request setValue:range forHTTPHeaderField:@"Range"];
    
    self.task = [session dataTaskWithRequest:request];
    self.task.taskDescription = self.urlString;
}


-(NSOutputStream *)stream{
    if (!_stream) {
        _stream = [NSOutputStream outputStreamToFileAtPath:self.filePath append:YES];
    }
    return _stream;
}

-(HLDownLoadProgress *)downloadProgress{
    if (!_downloadProgress) {
        _downloadProgress = [[HLDownLoadProgress alloc] init];
    }
    //刷新 已下载的数量
    _downloadProgress.totalBytesWritten = [[HLFileManager sizeOfFileAtPath:self.filePath] longLongValue];
    return _downloadProgress;
}

+(NSString *)downloadStateSringForState:(HLDownloadState)state{
    NSArray *array = @[
    @"HLDownloadStateNone",    // 未下载
    @"HLDownloadStateReadying",    // 等待下载
    @"HLDownloadStateRunning",     // 正在下载
    @"HLDownloadStateSuspended",   // 下载暂停
    @"HLDownloadStateCompleted",   // 下载完成
    @"HLDownloadStateFailed"
    ];
    return array[state];
}
#pragma mark - Notification
-(void)notifyProgressChange{
    if (self.progressChangedBlock) {
        self.progressChangedBlock(self.downloadProgress);
    }
    [HLNoteCenter postNotificationName:HLDownloadProgressDidChangeNotification object:self userInfo:@{HLDownloadInfoKey:self}];
}

-(void)notifyStateChange{
    if (self.stateChangedBlcok) {
        self.stateChangedBlcok(self.downloadState,self.filePath,self.error);
    }
    [HLNoteCenter postNotificationName:HLDownloadStateDidChangeNotification object:self userInfo:@{HLDownloadInfoKey:self}];
}

#pragma mark - download

/** 取消下载 */
-(void)cancel{
    if (!self.task  && self.downloadState == HLDownloadStateReadying) {
        
    }
    
    [self.task cancel];
    self.downloadState = HLDownloadStateNone;
}


-(void)resume{
    [self.task resume];
}
-(void)suspend{
    [self.task suspend];
}

#pragma mark - task delegate

-(void)didReceiveResponse:(NSURLResponse *)response{
    
    self.downloadState = HLDownloadStateRunning;
    [self.stream open];
    
    //更新文件的总大小
    self.downloadProgress.totalBytesExpectWritten = self.task.countOfBytesExpectedToReceive;
    //TODO:保存
    
}

-(void)didReceiveData:(NSData *)data{
    
    NSInteger result = [self.stream write:data.bytes maxLength:data.length];
    
    if (result == -1) {
        //错误情况  1.文件所在目录不存在，2 notOpen
        NSLog(@"stream--- result :%zd  error: %@ ",result,self.stream.streamError);
    }else{
        NSLog(@"stream result :%zd",result);
        
        //更新这次写入字节数量
        self.downloadProgress.bytesWritten = result;
        
        
    }
    
    
    
    if (self.progressChangedBlock) {
        self.progressChangedBlock(self.downloadProgress);
    }
    
    
    
}

-(void)didCompleteWithError:(NSError *)error{
    
    if (error) {
        self.downloadState = HLDownloadStateFailed;
    }else{
        self.downloadState = HLDownloadStateCompleted;
    }
    
    
    [self.stream close];
    self.stream = nil;
}

@end




@implementation HLDownLoadProgress


@end

