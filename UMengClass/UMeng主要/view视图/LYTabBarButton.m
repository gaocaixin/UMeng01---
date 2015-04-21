//
//  LYTabBarButton.m
//  MengXiu
//
//  Created by ChangLuyang on 15/4/8.
//  Copyright (c) 2015年 chang. All rights reserved.
//

#import "LYTabBarButton.h"

@implementation LYTabBarButton

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    return CGRectMake(40, 2.5, 30, 30);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    return CGRectMake(40, 32.5, 50, 10);
}

- (LYTabBarButton *)initWithTitle:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    if (self = [super init]) {
        //button标题
        [self setTitle:title forState:UIControlStateNormal];
        //button标题颜色
        [self setTitleColor:[UIColor colorWithRed:(CGFloat)134/255 green:(CGFloat)134/255 blue:(CGFloat)134/255 alpha:1]  forState:UIControlStateNormal];
        [self setTitleColor:[UIColor colorWithRed:(CGFloat)241/255 green:(CGFloat)114/255 blue:(CGFloat)155/255 alpha:1] forState:UIControlStateSelected];
        //选中状态和非选中状态图片
        [self setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
        //字号大小
        self.titleLabel.font = [UIFont systemFontOfSize:10];
    }
    return self;
}
@end
