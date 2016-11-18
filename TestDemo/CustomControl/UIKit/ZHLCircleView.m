//
//  ZHLCircleView.m
//  TestDemo
//
//  Created by ClearWB on 16/9/24.
//  Copyright © 2016年 zhl. All rights reserved.
//

#import "ZHLCircleView.h"


#define Angle(x) (M_PI*(x)/180.0)//角度

@interface ZHLCircleView ()
@property (nonatomic,strong) CALayer  *rotateLayer;

@end

@implementation ZHLCircleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CAShapeLayer *shapeLayerlayer = [CAShapeLayer layer];
        shapeLayerlayer.frame = self.bounds;
        shapeLayerlayer.path = [UIBezierPath bezierPathWithOvalInRect:self.bounds].CGPath;
        shapeLayerlayer.strokeColor = Color_Random.CGColor;
        shapeLayerlayer.fillColor = [UIColor blackColor].CGColor;
        [self.layer addSublayer:shapeLayerlayer];
        
        CALayer  * layer = [CALayer layer];
        layer.frame = CGRectMake(0, 0, 20, 20);
        layer.backgroundColor = [UIColor cyanColor].CGColor;
        [self.layer addSublayer:layer];
        
        CGFloat  r = self.width/2;
        CGFloat a = 0;
        layer.position = CGPointMake(r*(1+cos(Angle(a))), r*(1-sin(Angle(a))));
        
        _rotateLayer = layer;
    }
    return self;
}
-(void)setAngle:(CGFloat )angle{
    CGFloat  r = self.width/2;
    CGFloat a = -angle;
    _rotateLayer.position = CGPointMake(r*(1+cos(Angle(a))), r*(1-sin(Angle(a))));
    
//    CGFloat xSpace = fabs(_rotateLayer.position.x-r);
//    CGFloat ySpace =fabs(r - _rotateLayer.position.y);
//    CGFloat currentAngle = atan(ySpace/xSpace)*360;
//    while (currentAngle <= angle ) {
//        CGFloat a = -currentAngle;
//        _rotateLayer.position = CGPointMake(r*(1+cos(Angle(a))), r*(1-sin(Angle(a))));
//        currentAngle ++ ;
//    }
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self test];
}

-(void)test{
    static int a = 0;
    a+= 90;
    [self setAngle:a];
}

@end



@interface ZHLCircleView2 ()
@property (nonatomic,strong) CAShapeLayer  *rotateLayer;
@end
@implementation ZHLCircleView2

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CAShapeLayer *shapeLayerlayer = [CAShapeLayer layer];
        shapeLayerlayer.frame = self.bounds;
        shapeLayerlayer.path = [UIBezierPath bezierPathWithOvalInRect:self.bounds].CGPath;
        shapeLayerlayer.strokeColor = [UIColor yellowColor].CGColor;
        shapeLayerlayer.lineWidth = 10;
        shapeLayerlayer.fillColor = [UIColor clearColor].CGColor;
        [self.layer addSublayer:shapeLayerlayer];
        
        
        CALayer * layer = [CALayer layer];
        layer.frame = CGRectMake(-5, -5, self.width+10, self.height + 10);
        layer.backgroundColor = [[UIColor cyanColor] colorWithAlphaComponent:0.35].CGColor;
        [self.layer addSublayer:layer];
        
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.frame = layer.bounds;
        gradientLayer.colors = @[
                                 (id)[[UIColor redColor]colorWithAlphaComponent:0.5].CGColor,
                                 (id)[[UIColor cyanColor]colorWithAlphaComponent:0.5].CGColor,
                                 ];
        
        [layer addSublayer:gradientLayer];
        
        
        
        CAShapeLayer *rotateLayer = [CAShapeLayer layer];
        rotateLayer.frame = self.bounds;
        rotateLayer.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(5, 5, self.width, self.height)].CGPath;
        rotateLayer.strokeColor = [UIColor cyanColor].CGColor;
        rotateLayer.lineWidth = 10;
        rotateLayer.lineCap = @"round";
        rotateLayer.fillColor = [UIColor clearColor].CGColor;
        rotateLayer.strokeStart = 0;
        rotateLayer.strokeEnd = 1;
        //        [self.layer addSublayer:rotateLayer];
        _rotateLayer = rotateLayer;

        layer.mask = rotateLayer;
        
    }
    return self;
}


-(void)setAngle:(CGFloat )angle{

    angle = ((int )angle) % 361;
    _rotateLayer.strokeEnd = angle/360.0;
    _rotateLayer.strokeColor = [UIColor cyanColor].CGColor;
}

@end




