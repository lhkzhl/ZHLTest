//
//  HLDownloadInfo.h
//  TestDemo
//
//  Created by hailong on 2016/12/24.
//  Copyright © 2016年 zhl. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum : NSUInteger {
    HLDownloadStateNone = 0,    // 未下载
    HLDownloadStateReadying,    // 等待下载
    HLDownloadStateRunning,     // 正在下载
    HLDownloadStateSuspended,   // 下载暂停
    HLDownloadStateCompleted,   // 下载完成
    HLDownloadStateFailed       // 下载失败
} HLDownloadState;

typedef void(^HLDownloadStateChangedBlock)();
typedef void(^HLDownloadProgressChangedBlock)();

@class HLDownLoadProgress;
@interface HLDownloadInfo : NSObject

// >>>>>>>>>>>>>>>>>>>>>>文件 download info
/** 文件url */
@property (nonatomic, strong, readonly) NSString *urlString;
/** 文件名 */
@property (nonatomic, strong, readonly) NSString *fileName;
/** 文件路径 */
@property (nonatomic, strong, readonly) NSString *downloadDirectory;
/** 下载路径 如果设置了downloadDirectory，文件下载完成后会移动到这个目录，否则，在manager默认cache目录里 */
@property (nonatomic, strong, readonly) NSString *filePath;


// >>>>>>>>>>>>>>>>>>>>>> task info
/** 下载状态 */
@property (nonatomic, assign, readonly) HLDownloadState donwloadState;
/** 下载进度 */
@property (nonatomic, strong, readonly) HLDownLoadProgress *downloadProgress;
/** 下载任务 */
@property (nonatomic, strong, readonly) NSURLSessionTask *task;
/** 文件流 */
@property (nonatomic, strong, readonly) NSOutputStream *stream;



// >>>>>>>>>>>>>>>>>>>>>> download block
/** 状态更新block */
@property (nonatomic, copy) HLDownloadStateChangedBlock stateChangedBlcok;
/** 进度更新block */
@property (nonatomic, copy) HLDownloadProgressChangedBlock progressChangedBlock;


-(id)initWithUrlString:(NSString *)urlString;
-(id)initWithUrlString:(NSString *)urlString filePath:(NSString *)filePath;
@end




@interface HLDownLoadProgress : NSObject

/** 这次写入的数量 */
@property(nonatomic, assign) int64_t bytesWritten;
/** 已下载的数量 */
@property(nonatomic, assign) int64_t totalBytesWritten;
/** 文件的总大小 */
@property(nonatomic, assign) int64_t totalBytesExpectWritten;
/** 续传大小 */
@property(nonatomic, assign) int64_t resumeBytesWritten;
/** 下载进度 */
@property(nonatomic, assign) CGFloat progress;
/** 下载速度 */
@property(nonatomic, assign) CGFloat speed;
/** 下载剩余时间 */
@property(nonatomic, assign) int remainingTime;



@end


