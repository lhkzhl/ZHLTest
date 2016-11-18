//
//  UIButton+ZSC.m
//  WineAndRose
//
//  Created by ZSC on 15/12/9.
//  Copyright © 2015年 ZSC. All rights reserved.
//

#import "UIButton+ZSC.h"

@implementation UIButton (ZSC)

- (void)setZSCBtnLeftTitle:(NSString *)title andFontSize:(NSInteger)fontSize andRightImg:(UIImage *)image
{
//    self.imageEdgeInsets = UIEdgeInsetsMake(0, [CommonTools getZSCTextWidth:title andTextFontSize:fontSize], 0, -[CommonTools getZSCTextWidth:title andTextFontSize:fontSize]);
//    self.titleEdgeInsets = UIEdgeInsetsMake(0, -image.size.width-5, 0, image.size.width+5);
}

-(void)startTime:(NSInteger )timeout title:(NSString *)tittle waitTittle:(NSString *)waitTittle{
    
    self.selected = YES;
//    self.backgroundColor = Color_LightGray;
    
    __block NSInteger timeOut=timeout; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeOut<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self setTitle:tittle forState:UIControlStateNormal];
                self.userInteractionEnabled = YES;
                self.selected = NO;
//                self.backgroundColor = [UIColor whiteColor];
            });
        }else{
            //            int minutes = timeout / 60;
            int seconds = timeOut % 61;
            NSString *strTime = [NSString stringWithFormat:@"%d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
//                NSLog(@"____%@",strTime);
                [self setTitle:[NSString stringWithFormat:@"%@%@",strTime,waitTittle] forState:UIControlStateNormal];
                [self setTitleColor:Color_LabeText forState:UIControlStateSelected];
                self.userInteractionEnabled = NO;
                
            });
            timeOut--;
            
        }
    });
    dispatch_resume(_timer);
    
}

@end
