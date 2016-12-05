//
//  AppDelegate.m
//  TestDemo
//
//  Created by ClearWB on 16/9/5.
//  Copyright © 2016年 zhl. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    
    NSDecimalNumber *num1 = [[NSDecimalNumber alloc] initWithFloat:100.65];
    NSDecimalNumber *num2 = [[NSDecimalNumber alloc] initWithFloat:7.0];
    NSDecimalNumber *num3 = [num1 decimalNumberByDividingBy:num2];
    NSDecimalNumberHandler *handle = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:2 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:YES];
    NSDecimalNumber *num4 = [num3 decimalNumberByRoundingAccordingToBehavior:handle];
    NSDecimalNumber *num5 = [num4 decimalNumberByMultiplyingBy:num2];
    NSLog(@"%@\n%lld",num2,num5.longLongValue);
    
    
    double a = (double)100.59/7.0;
    
    double b = [NSString stringWithFormat:@"%.2f",a].doubleValue;
    double c = b;
    NSLog(@"a:%lf--b:%lf",a,b);
    NSLog(@"%lf---%lf--%lf",14.380000*7.0,b*7,c*7);
    
    return YES;
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
