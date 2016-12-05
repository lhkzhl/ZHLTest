//
//  FlowLayout.m
//  TestDemo
//
//  Created by ClearWB on 16/9/28.
//  Copyright © 2016年 zhl. All rights reserved.
//

#import "FlowLayout.h"

@interface FlowLayout()
@property (nonatomic,strong) NSMutableArray  *attributesArr;
@end

@implementation FlowLayout

-(void)prepareLayout{
    [super prepareLayout];
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;


}

//-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
//    UICollectionViewLayoutAttributes *att = [super layoutAttributesForItemAtIndexPath:indexPath];
//    
//    NSLog(@"++++++%@",att);
//    return att;
//}
//
//-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
//   NSArray *array =  [super layoutAttributesForElementsInRect:rect];
//    
//    for (UICollectionViewLayoutAttributes *att in array) {
//        CGRect frame = att.frame;
//        att.frame = CGRectMake(0, frame.origin.y, ScreenWidth, ScreenHeight);
//    }
//    return array;
//}



@end
