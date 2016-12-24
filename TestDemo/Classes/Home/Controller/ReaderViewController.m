//
//  NextViewController.m
//  TestDemo
//
//  Created by ClearWB on 16/12/6.
//  Copyright © 2016年 zhl. All rights reserved.
//

#import "ReaderViewController.h"
#import "ReaderView.h"
#import "Animator.h"
@interface ReaderViewController ()

@end

@implementation ReaderViewController

-(void)loadView{
    self.view = [[ReaderView alloc] initWithFrame:[UIScreen mainScreen].bounds];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self.navigationController popViewControllerAnimated:YES];
}
-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    return [Animator new];
}



-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
