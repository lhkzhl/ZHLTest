//
//  NSArray+ZHL.h
//  TestDemo
//
//  Created by ClearWB on 16/10/9.
//  Copyright © 2016年 zhl. All rights reserved.
//

#import <Foundation/Foundation.h>
//只能设置两种颜色，黑色和白色，系统默认黑色
//设置为白色方法：
//（1）在plist里面添加Status bar style，值为UIStatusBarStyleLightContent（白色）或UIStatusBarStyleDefault（黑 色）
//（2）在Info.plist中设置UIViewControllerBasedStatusBarAppearance 为NO
//模拟器的位置:
///Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs
//
//文档安装位置:
///Applications/Xcode.app/Contents/Developer/Documentation/DocSets
//
//插件保存路径:
//~/Library/ApplicationSupport/Developer/Shared/Xcode/Plug-ins
//
//自定义代码段的保存路径:
//~/Library/Developer/Xcode/UserData/CodeSnippets/
//如果找不到CodeSnippets文件夹，可以自己新建一个CodeSnippets文件夹。
//
//证书路径
//~/Library/MobileDevice/Provisioning Profiles

//NSArray *array = [NSArray arrayWithObjects:@"2.0", @"2.3", @"3.0", @"4.0", @"10", nil];
//CGFloat sum = [[array valueForKeyPath:@"@sum.floatValue"] floatValue];
//CGFloat avg = [[array valueForKeyPath:@"@avg.floatValue"] floatValue];
//CGFloat max =[[array valueForKeyPath:@"@max.floatValue"] floatValue];
//CGFloat min =[[array valueForKeyPath:@"@min.floatValue"] floatValue];
@interface NSArray (ZHL)

@end
