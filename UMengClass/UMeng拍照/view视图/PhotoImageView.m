//
//  PhotoImageView.m
//  UMeng01
//
//  Created by gaocaixin on 15/4/12.
//  Copyright (c) 2015年 GCX. All rights reserved.
//

#import "PhotoImageView.h"

#define IMAGEVIEW_WIDTH 24
#define IMAGE_INTERVAL 10

@interface PhotoImageView ()

@property (nonatomic ,weak) UIImageView *imageView;

@end

@implementation PhotoImageView



- (instancetype)init
{
    if (self = [super init]) {
        self.userInteractionEnabled = YES;
        UIImageView *imageView = [[UIImageView alloc] init];
        self.imageView = imageView;
        [self addSubview:imageView];
        
        self.isSelect = NO;
    }
    return self;
}

- (void)setIsSelect:(BOOL)isSelect
{
    _isSelect = isSelect;
    if (isSelect) {
        self.imageView.image = [UIImage imageNamed:@"selimg_selcircle"];
    } else {
       self.imageView.image = [UIImage imageNamed:@"selimg_nocircle"];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.frame = CGRectMake(CGW(self.frame) - IMAGEVIEW_WIDTH - IMAGE_INTERVAL, IMAGE_INTERVAL, IMAGEVIEW_WIDTH, IMAGEVIEW_WIDTH);
    
}

@end
