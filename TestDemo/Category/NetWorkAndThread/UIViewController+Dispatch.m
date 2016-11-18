//
//  UIViewController+Dispatch.m
//  TestDemo
//
//  Created by ClearWB on 16/9/8.
//  Copyright © 2016年 zhl. All rights reserved.
//

#import "UIViewController+Dispatch.h"
typedef void (^requestFinishedCompletionBlock)();
@implementation UIViewController (Dispatch)
-(void)dispatch_gruop{
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_queue_create("com.gcd-group.www", DISPATCH_QUEUE_CONCURRENT);

    __block NSData *data1 = nil;
    __block NSData *data2 = nil;
    dispatch_group_async(group, queue, ^{
        data1 =  [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://www.baidu.com"]];
//        NSLog(@"%@",data1 );
    });
    dispatch_group_async(group, queue, ^{
        data2 =  [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://www.baidu.com"]];
//        NSLog(@"%@",data2 );
        
    });
    dispatch_group_notify(group,  queue, ^{
        NSLog(@"%@--%@",data1,data2 );
    });
}






- (NSURLSessionDataTask *)requestSellerWithCompletion:(requestFinishedCompletionBlock)successBlock
{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    NSURLSessionDataTask *task = [manager GET:@"https://www.baidu.com" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //    task.currentRequest
        //      NSLog(@"%@",task.taskDescription);
        
        if (successBlock  ) {
            successBlock(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    return  task;
}


-(void)cancelTask{
    NSURLSessionDataTask *task = nil;
    for (int i = 1; i <= 10; i++) {
        if (task) {
            [task cancel];
        }
        task = [self requestSellerWithCompletion:^(id object) {
            NSLog(@"finished download %d",i);
        }];
    }
}

-(void)si{
    //信号量
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    //创建全局并行
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //任务一
    dispatch_group_async(group, queue, ^{
        [self getAdvertList:^{ //这个block是此网络任务异步请求结束时调用的,代表着网络请求的结束.
            //一个任务结束时标记一个信号量
            dispatch_semaphore_signal(semaphore);
        }];
    });
    //任务六
    dispatch_group_async(group, queue, ^{
//        [self getNews:^{
//            dispatch_semaphore_signal(semaphore);
//        }];
    });
    
    dispatch_group_notify(group, queue, ^{
        //6个任务,6个信号等待.
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        //这里就是所有异步任务请求结束后执行的代码
//        [self.homeTableView.mj_header endRefreshing];
        
    });
}
-(void)getAdvertList:(void(^)())finish{
    //网络请求..成功后调用一下finish,失败也调用finish
}


@end
