//
//  UIViewController+Animation.m
//  TestDemo
//
//  Created by ClearWB on 16/9/23.
//  Copyright © 2016年 zhl. All rights reserved.
//

#import "UIViewController+Animation.h"

#define Angle(x) (M_PI*(x)/180.0)
static UIView *aTestView = nil;
static UILabel *aTestLabel = nil;
@implementation UIViewController (Animation)

/**
 transform.scale = 比例轉換
 transform.scale.x = 闊的比例轉換
 transform.scale.y = 高的比例轉換
 transform.rotation.z = 平面圖的旋轉
 opacity = 透明度
 margin = 布局
 zPosition = 翻转
 backgroundColor = 背景颜色
 cornerRadius = 圆角
 borderWidth = 边框宽
 bounds = 大小
 contents = 内容
 contentsRect = 内容大小
 cornerRadius = 圆角
 frame = 大小位置
 hidden = 显示隐藏
 mask
 masksToBounds
 opacity
 position
 shadowColor
 shadowOffset
 shadowOpacity
 shadowRadius
 */
-(void)basicAnimation{
    CALayer  * shapeLayerlayer = [self getshapeLayerlayer];
    [self.view.layer addSublayer:shapeLayerlayer];

    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    basicAnimation.fromValue = @(0);
    basicAnimation.toValue = @(1);
    basicAnimation.duration = 1;
    basicAnimation.removedOnCompletion = NO;
    [shapeLayerlayer addAnimation:basicAnimation forKey:@"basicAnimation"];
}

-(void)keyframeAnimation{
    CALayer  * shapeLayerlayer = [self getshapeLayerlayer];
    [self.view.layer addSublayer:shapeLayerlayer];
    
    CALayer  * layer = [CALayer layer];
    layer.frame = CGRectMake(0, 0, 20, 20);
    layer.backgroundColor = [UIColor cyanColor].CGColor;
    [self.view.layer addSublayer:layer];
    
    CAShapeLayer *layer2 = [CAShapeLayer layer];
    layer2.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 100, 100)].CGPath;
    layer2.strokeColor = Color_Random.CGColor;
    layer2.fillColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer2];
    
    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyframeAnimation.path = layer2.path;
//    keyframeAnimation.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(0, 0) radius:50 startAngle:M_PI endAngle:M_PI_2 clockwise:YES].CGPath;
    
    keyframeAnimation.duration = 2;
    keyframeAnimation.repeatCount = INFINITY;
    
    keyframeAnimation.delegate = self;
    /**
     *  一起才有作用
     */
    keyframeAnimation.fillMode = kCAFillModeForwards;
    keyframeAnimation.removedOnCompletion = NO;
    
    keyframeAnimation.calculationMode = kCAAnimationPaced;
    keyframeAnimation.rotationMode = kCAAnimationRotateAutoReverse;
    [layer addAnimation:keyframeAnimation forKey:@"keyframeAnimation"];
    
    
    
    
}

-(void)transform3d{
    //    self.view.layer.anchorPoint = CGPointMake(0, 1);
    [UIView animateWithDuration:.7 animations:^{
        CATransform3D t1 = CATransform3DIdentity;
        //         t1.m34 = 1.0/-900;
        //        //带点缩小的效果
        //        t1 = CATransform3DScale(t1, 0.95, 0.95, 1);
        //        //绕x轴旋转
        //        t1 = CATransform3DRotate(t1, 15.0 * M_PI/180.0, 1, 0, 0);
        //        [self.view.layer setTransform:t1];
        
        CATransform3D transform = CATransform3DIdentity;
        transform.m34 = 1.0/-900; // 透视效果
        transform = CATransform3DScale(transform, 0.95, 0.95, 1);
        transform = CATransform3DRotate(transform,(15.0 * M_PI/180.0), 1, 0, 0);
        [self.view.layer setTransform:transform];
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:.7 animations:^{
            CATransform3D transform = CATransform3DIdentity;
            transform.m34 = 0.0005; // 透视效果
            
            //        transform = CATransform3DRotate(transform,(M_PI/180*40), -1, 0, 0);
            transform = CATransform3DScale(transform, 0.9, 0.9, 1);
            
            [self.view.layer setTransform:transform];
            
        } completion:^(BOOL finished) {
            
        }];
        
    }];

}

-(void)transitionAnimation{
    
    // 一般配有点击事件
    aTestView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    aTestView.backgroundColor = [UIColor cyanColor];
    aTestView.layer.cornerRadius = 50;
    UILabel *label = [[UILabel alloc] initWithFrame:aTestView.bounds];
    label.text = @"abc";
    label.textAlignment = NSTextAlignmentCenter;

    [aTestView addSubview:label];
    
    aTestLabel = label;
    [self.view addSubview:aTestView];
    
}




-(CALayer *)getshapeLayerlayer{
    CAShapeLayer *shapeLayerlayer = [CAShapeLayer layer];
    /**
     *  frame 是很重要的，path 是根据frame 算出来的
    */
    shapeLayerlayer.frame = CGRectMake(100, 100, 100, 100);
    shapeLayerlayer.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)].CGPath;
    shapeLayerlayer.strokeColor = Color_Random.CGColor;
    shapeLayerlayer.fillColor = [UIColor blackColor].CGColor;
    return shapeLayerlayer;
}
-(CALayer *)getLayer{
    CALayer  * layer = [CALayer layer];
    layer.frame = CGRectMake(0, 0, 100, 100);
    layer.backgroundColor = [UIColor redColor].CGColor;
    return layer;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{


    CATransition *transition = [CATransition animation];
    /**
     @"cube";//像立方体那样翻转
     @"suckEffect";//吸入，渐渐缩小，与删除照片的动画一样
     @"oglFlip";//上下旋转，当subType为fromleft或者fromRight时，与UIViewAnimationTransitionFlipFromLeft;和
     UIViewAnimationTransitionFlipFromRight一样
     @"rippleEffect";//水波效果
     @"pageCurl";//卷曲与UIViewAnimationTransitionCurlUp一样
     @"pageUnCurl";//卷曲与UIViewAnimationTransitionCurlDown一样
     @"cameraIrisHollowOpen";//摄像头开
     @"cameraIrisHollowClose";//摄像头关
     */
    //    transition.type = kCATransitionPush;
    transition.type = @"oglFlip";
    transition.subtype = kCATransitionFromRight;
    transition.duration = 0.3;
    transition.repeatCount = 1;
//    self.view.backgroundColor = Color_Random;
    [aTestView.layer addAnimation:transition forKey:@"transition"];

}

#pragma mark --CAAnimationDelegate
-(void)animationDidStart:(CAAnimation *)anim{
    
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
}

@end
