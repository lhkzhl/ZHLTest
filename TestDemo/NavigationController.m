//
//  NavigationController.m
//  TestDemo
//
//  Created by ClearWB on 16/12/20.
//  Copyright © 2016年 zhl. All rights reserved.
//

#import "NavigationController.h"
#import "Animator.h"
@interface NavigationController ()<UINavigationControllerDelegate>

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    self.delegate = self;
    [super pushViewController:viewController animated:animated];
}
-(UIViewController *)popViewControllerAnimated:(BOOL)animated{
   return  [super popViewControllerAnimated:animated];
}

-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    return [[Animator alloc] init];
}

@end
