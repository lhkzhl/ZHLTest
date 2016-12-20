//
//  Animator.m
//  TestDemo
//
//  Created by ClearWB on 16/12/16.
//  Copyright © 2016年 zhl. All rights reserved.
//

#import "Animator.h"

@implementation Animator

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.25;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    UIView *containerView =  transitionContext.containerView;
//    containerView.backgroundColor = [UIColor whiteColor];
    UIViewController *fromVc =  [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    BOOL isPush =fromVc.navigationController.topViewController == toVc;
    if (isPush) {
        [fromVc.view removeFromSuperview];
        [containerView addSubview:toVc.view];
        
        
        toVc.view.height = 0;
        
        [UIView animateWithDuration:0.5 animations:^{
            toVc.view.height = [UIScreen mainScreen].bounds.size.height;
        }];
    }else{
        [toVc.view removeFromSuperview];
        [containerView addSubview:fromVc.view];

        fromVc.view.height = 0;
        
        [UIView animateWithDuration:0.5 animations:^{
            fromVc.view.height = [UIScreen mainScreen].bounds.size.height;
        }];
    }
    
    // This must be called whenever a transition completes (or is cancelled.)
    [transitionContext completeTransition:YES];
    
}


@end
