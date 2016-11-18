//
//  UIView+ZHL.m
//  TestDemo
//
//  Created by ClearWB on 16/10/21.
//  Copyright © 2016年 zhl. All rights reserved.
//

#import "UIView+ZHL.h"

@implementation UIView (ZHL)


-(void)hl_addDashedLineWithlineLength:(int)length
                          lineSpacing:(int)spacing
                            lineColor:(UIColor *)color{
    
    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    borderLayer.fillColor = [UIColor clearColor].CGColor;
    borderLayer.strokeColor = color.CGColor;
    CGFloat lineWidth = 1.f;
    borderLayer.lineWidth = lineWidth;
    borderLayer.path =    [UIBezierPath bezierPathWithRoundedRect:CGRectMake(1, 1, self.width -2*lineWidth, self.height - 2*lineWidth) cornerRadius:self.layer.cornerRadius].CGPath;
    borderLayer.lineCap = kCALineCapRound;
    borderLayer.lineDashPattern = @[@(length), @(spacing)];
    [self.layer addSublayer:borderLayer];
}
-(void)hl_roundRectWithCorners:(UIRectCorner)rectCorner cornerRadii:(CGFloat)radii{
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = self.bounds;
    //第二个radii感觉没有
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:layer.bounds byRoundingCorners:rectCorner cornerRadii:CGSizeMake(radii, radii)];
    layer.path = path.CGPath;
    layer.masksToBounds = YES;
    self.layer.mask = layer;

}

#ifdef ZHLViewFrame
- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

#endif

@end
