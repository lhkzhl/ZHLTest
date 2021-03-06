//
//  TableViewController.m
//  TestDemo
//
//  Created by ClearWB on 16/9/10.
//  Copyright © 2016年 zhl. All rights reserved.
//

#import "TableViewController.h"
#import "UIColor+ZHL.h"


#import "UIStackViewDemoVC.h"
@interface TableViewController ()
@property (nonatomic,strong) NSMutableArray  *dataSource;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingBlock:^{
//        currentPage = 1;
//        [weakSelf requestVideoListDataWithRequestModel:weakSelf.requestModel];
        
    }];
    
    NSMutableArray *imgList = [NSMutableArray array];
    for (int i =1 ; i < 60; i++) {
        UIImage *img  = [UIImage imageNamed:[NSString stringWithFormat:@"t012758e4fd7b32d269_%d",i]];
        
        [imgList addObject:img];
    }
    [header setImages:imgList forState:MJRefreshStatePulling];
    self.tableView.mj_header = header;

    
    
    
    
    
    self.dataSource = [@[@"UIStackView"]mutableCopy];

    
    

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataSource.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:@"reuseIdentifier"];
        
        [self configLayerCell:cell WithIndexPath:indexPath];
    }

    cell.textLabel.text = self.dataSource[indexPath.row];
    
    

    return cell;
}

-(void)configLayerCell:(UITableViewCell *)cell WithIndexPath:(NSIndexPath *)indexPath{
    
    cell.textLabel.backgroundColor  = [UIColor clearColor];
    
    
    CAGradientLayer *layer = [[CAGradientLayer alloc] init];
    layer.frame = CGRectMake(0, 0, ScreenWidth, cell.height);
    
    NSArray *colors1 = [RGBA(239, 202, 190, 0.1) getRGBA];
    NSArray *colors2 = [RGBA(193, 147, 158, 1) getRGBA];
    
    
    NSInteger count = self.dataSource.count;
    CGFloat *current1Colors = (CGFloat *) malloc(sizeof(CGFloat)*4) ;
    CGFloat *current2Colors = (CGFloat *) malloc(sizeof(CGFloat)*4) ;
    for (int i = 0 ; i < 4; i ++) {
        CGFloat first =   [colors1[i] floatValue];
        CGFloat last =   [colors2[i] floatValue];
        
        CGFloat space =(first-last)/count;
        
        CGFloat current1 = first - indexPath.row *space;
        
        CGFloat current2 = current1 - space;
        
        current1Colors[i] = current1;
        current2Colors[i] = current2;
    }
    
    UIColor * first =   [UIColor colorWithRed:current1Colors[0] green:current1Colors[1] blue:current1Colors[2] alpha:current1Colors[3]];
    UIColor * last =   [UIColor colorWithRed:current2Colors[0] green:current2Colors[1] blue:current2Colors[2] alpha:current2Colors[3]];
    
    free(current1Colors);
    free(current2Colors);
    
    layer.colors = @[
                     (id)first.CGColor,
                     (id)last.CGColor
                     ];
    
    UIView *bgView = [UIView new];
    [bgView.layer addSublayer:layer];
    cell.backgroundView = bgView;
    
    UIView *selectedBgView = [UIView new];
    selectedBgView.backgroundColor = [UIColor cyanColor];
    cell.selectedBackgroundView = selectedBgView;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString  *selString = [NSString stringWithFormat:@"go%@Action",self.dataSource[indexPath.row]];
    [self performSelector:NSSelectorFromString(selString) withObject:nil];
}

#pragma mark - action
- (void)goUIStackViewAction{
    
    UIStackViewDemoVC *vc = [[UIStackViewDemoVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
