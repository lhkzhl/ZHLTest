//
//  UIStackViewDemoVC.m
//  TestDemo
//
//  Created by  xueguoxue on 2018/1/15.
//  Copyright © 2018年 zhl. All rights reserved.
//

#import "UIStackViewDemoVC.h"

@interface UIStackViewDemoVC ()

//@property (nonatomic, strong) UIStackView *containerView;

@property (nonatomic, strong) UIScrollView *view;

@end

@implementation UIStackViewDemoVC
{
    UIStackView *containerView;
}
@dynamic view;




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    containerView = [[UIStackView alloc] initWithFrame:CGRectMake(0, 100, ScreenWidth, 200)];
    containerView.axis = UILayoutConstraintAxisVertical;
    containerView.distribution = UIStackViewDistributionFillEqually;
    containerView.spacing = 10;
    containerView.alignment = UIStackViewAlignmentFill;
    for (int i =  0; i < random()%5+3; i++) {
        UIStackView *stackView = [[UIStackView alloc] init];
        stackView.axis = UILayoutConstraintAxisHorizontal;
        stackView.distribution = UIStackViewDistributionFillEqually;
        stackView.spacing = 10;
        stackView.alignment = UIStackViewAlignmentFill;
        
        for (NSInteger j = 0; j < random()%7 +1; j++) {
            UILabel *label = [[UILabel alloc] init];
            label.backgroundColor = [UIColor colorWithRed:random()%256/255.0 green:random()%256/255.0 blue:random()%256/255.0 alpha:1];
            label.textAlignment = NSTextAlignmentCenter;
            label.text = [NSString stringWithFormat:@"%zd -%zd",i,j];
            [stackView addArrangedSubview:label];
        }
        [containerView addArrangedSubview:stackView];
    }
    
    [self.view addSubview:containerView];
    

    
//    self.extendedLayoutIncludesOpaqueBars = YES;
//    self.edgesForExtendedLayout = UIRectEdgeTop|UIRectEdgeBottom;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
