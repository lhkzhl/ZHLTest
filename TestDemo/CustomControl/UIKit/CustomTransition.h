//
//  CustomTransition.h
//  PuBuLiu
//
//  Created by 王艳清 on 16/7/1.
//  Copyright © 2016年 王艳清. All rights reserved.
//

#import <UIKit/UIKit.h>


//# toVC  nav.delegate
//pragma mark - 导航控制器的代理
//- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
//    return [[CustomTransition alloc] initWithTransitionType:operation == UINavigationControllerOperationPush? push :pop];
//}

typedef NS_ENUM(NSInteger, TransitionType) {
    push,
    pop
};

@interface CustomTransition : NSObject <UIViewControllerAnimatedTransitioning>

- (instancetype)initWithTransitionType:(TransitionType)type;

@end
