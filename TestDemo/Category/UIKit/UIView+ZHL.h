//
//  UIView+ZHL.h
//  TestDemo
//
//  Created by ClearWB on 16/10/21.
//  Copyright © 2016年 zhl. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UIView (ZHL)
//#define ZHLViewFrame
#ifdef ZHLViewFrame
@property (nonatomic) CGFloat left;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat top;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat width;       ///< Shortcut for frame.size.width.
@property (nonatomic) CGFloat height;      ///< Shortcut for frame.size.height.
@property (nonatomic) CGFloat centerX;     ///< Shortcut for center.x
@property (nonatomic) CGFloat centerY;     ///< Shortcut for center.y
@property (nonatomic) CGPoint origin;      ///< Shortcut for frame.origin.
@property (nonatomic) CGSize  size;
#endif


-(void)hl_roundRectWithCorners:(UIRectCorner)rectCorner cornerRadii:(CGFloat)radii;


//目前仅支持，普通view和圆角view不支持其它形式
-(void)hl_addDashedLineWithlineLength:(int)length
                          lineSpacing:(int)spacing
                            lineColor:(UIColor *)color;

@end
