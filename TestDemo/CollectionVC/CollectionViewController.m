//
//  CollectionViewController.m
//  TestDemo
//
//  Created by ClearWB on 16/9/28.
//  Copyright © 2016年 zhl. All rights reserved.
//

#import "CollectionViewController.h"


#import "CollectionViewCell.h"

#import "ScaleFlowLayout.h"

@interface CollectionViewController ()

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
 
    ScaleFlowLayout *flowLayout = [[ScaleFlowLayout alloc] init];

    flowLayout.itemSize=CGSizeMake(150, 150);

    self.collectionView.collectionViewLayout = flowLayout;
    self.collectionView.pagingEnabled = YES;
    self.view.backgroundColor = [UIColor whiteColor];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor = Color_Random;
    // Configure the cell
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%zd",indexPath.item + 1]];
    cell.imageView.alpha = 0.3;
    return cell;
}

#pragma mark <UICollectionViewDelegate>


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat X = scrollView.contentOffset.x;
    NSArray *visibleCells = self.collectionView.visibleCells;
    for (int i = 0; i < visibleCells.count; i++) {
        
        CollectionViewCell *cell = visibleCells[i];
        NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
        
        //X scrollView偏移量
        //indexPath.item * self.collectionView.width  当前cell  x
        //(X - indexPath.item * self.collectionView.width)  当前cell 相对屏幕的偏移,正中心的很小，右边为
        //
        
        //数学计算还是很麻烦的
        
        //父子视图视差
        cell.contentView.left   = 0.6 * (X - indexPath.item * cell.width) ;
        cell.contentView.top   = 0.6 * (X - indexPath.item * cell.width) ;
        NSLog(@"%@",cell.imageView);
    }
        NSLog(@"\n\n");
}
@end
