//
//  CollectionViewCell.m
//  TestDemo
//
//  Created by ClearWB on 16/12/2.
//  Copyright © 2016年 zhl. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        CGRect rect = frame;
        self.layer.borderWidth   = 0.5f;
        self.layer.borderColor   = [UIColor blackColor].CGColor;
        self.layer.masksToBounds = YES;
        
        /*
         *     --------------     *
         *-50->|-view-width-|<-50-*
         *     --------------     *
         */
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(-50, 0, rect.size.width + 50 * 2, rect.size.height)];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:_imageView];
        
        
    }
    
    return self;
}

@end
