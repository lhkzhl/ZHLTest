//
//  UIColor+ZHL.m
//  TestDemo
//
//  Created by ClearWB on 16/9/13.
//  Copyright © 2016年 zhl. All rights reserved.
//

#import "UIColor+ZHL.h"

@implementation UIColor (ZHL)


-(NSArray <NSNumber *> *)getRGBA{
    const CGFloat *componts = CGColorGetComponents(self.CGColor);
    
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0 ; i < 4; i ++) {
        [array addObject:@(componts[i])];
    }
    return array;
}

-(CGFloat *)RGBA{
    const CGFloat *componts = CGColorGetComponents(self.CGColor);
    
    CGFloat *a = (CGFloat *)malloc(sizeof(CGFloat)*4);
    for (int i = 0 ; i < 4; i ++) {
        *(a + i) = componts[i];
    }
    return a;
}

@end
