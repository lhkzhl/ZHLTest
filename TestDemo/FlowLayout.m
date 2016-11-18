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
-(CGSize)collectionViewContentSize

{
    
    UICollectionViewLayoutAttributes *attribute =   [_attributesArr lastObject];
    
    
    return CGSizeMake(ScreenWidth, CGRectGetMaxY(attribute.frame) +5);
}//返回contentsize的总大小

-(void)prepareLayout{
    [super prepareLayout];
    NSInteger itemNumber = [self.collectionView numberOfItemsInSection:0];
    _attributesArr = [NSMutableArray arrayWithCapacity:itemNumber];
    
    
    int column = 3;
    for (int i = 0; i < itemNumber; i ++) {
        
        CGFloat itemWidth  = (ScreenWidth -(column -1)*10)/3;
        CGFloat itemHeight = 60+arc4random()%61;
        CGFloat x = (i%column)*(itemWidth + 10);
//        CGFloat y = (i/column)*(itemHeight + 20);
        CGFloat y = 0;
        if (i>=3) {
          UICollectionViewLayoutAttributes *  attribute = _attributesArr[i-3];
            y = CGRectGetMaxY(attribute.frame)+5;
        }
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        
        CGRect frame = CGRectMake(x, y, itemWidth, itemHeight);
        UICollectionViewLayoutAttributes *attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        attribute.frame = frame;
//        CATransform3D trans = CATransform3DIdentity;
//        trans.m12 = 0.5;
//        attribute.transform3D = trans;
        
        [_attributesArr addObject:attribute];
    }
}

//-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
//
//{
//    
//    return YES;
//    
//}

-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect

{
    
    return  _attributesArr;
//    NSArray *array = [super layoutAttributesForElementsInRect:rect];
//    
//    NSMutableArray* attributes = [NSMutableArray array];
//    
//    for (NSInteger i=0 ; i < [array count]; i++) {
//        
//        NSIndexPath* indexPath = [NSIndexPath indexPathForItem:i inSection:0];
//        
//        [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
//        
//    }
//    
//    return attributes;
    
}//返回所有cell的布局属性
@end
