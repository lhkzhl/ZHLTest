//
//  UIButton+ZSC.h
//  WineAndRose
//
//  Created by ZSC on 15/12/9.
//  Copyright © 2015年 ZSC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ZSC)
/**
 *  按钮左文字右图片
 *
 *  @param title    title
 *  @param fontSize 字体
 *  @param image    按钮图片
 */
- (void)setZSCBtnLeftTitle:(NSString *)title andFontSize:(NSInteger)fontSize andRightImg:(UIImage *)image;

-(void)startTime:(NSInteger )timeout title:(NSString *)tittle waitTittle:(NSString *)waitTittle;

@end
