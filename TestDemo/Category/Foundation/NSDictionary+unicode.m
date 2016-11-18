//
//  NSDictionary+unicode.m
//  ios试验
//
//  Created by 周磊 on 15/12/8.
//  Copyright © 2015年 zhl. All rights reserved.
//

#import "NSDictionary+unicode.h"

@implementation NSDictionary (unicode)

-(NSString *)chinese{
    NSString *tempStr1 = [self.description stringByReplacingOccurrencesOfString:@"\\u"withString:@"\\U"];
    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\""withString:@"\\\""];
    NSString *tempStr3 = [[@"\""stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];

    NSString* returnStr = [NSPropertyListSerialization propertyListWithData:tempData options:NSPropertyListImmutable format:NULL error:NULL];
    return [returnStr stringByReplacingOccurrencesOfString:@"\\r\\n"withString:@"\n"];
    

}

@end
