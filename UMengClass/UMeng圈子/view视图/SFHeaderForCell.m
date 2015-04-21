//
//  SFHeaderForCell.m
//  SFMX
//
//  Created by qianfeng on 15/4/10.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SFHeaderForCell.h"

@implementation SFHeaderForCell
{
    UIImageView * _imageView;
    UILabel * _label;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 0, 20, 30)];
        _label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_imageView.frame)+8, 0, 200, 30)];
        _imageView.center = CGPointMake(25, 25);
        _label.center=CGPointMake(140, 25);
        _label.font = [UIFont systemFontOfSize:17];
        _label.textColor = [UIColor colorWithRed:109/255.0 green:109/255.0 blue:109/255.0 alpha:1];
        self.backgroundColor = [UIColor whiteColor];
        UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-1, [UIScreen mainScreen].bounds.size.width, 1)];
        view.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1];
        [self addSubview:_imageView];
        [self addSubview:_label];
        [self addSubview:view];
    }
    return self;
}

-(void)setName:(NSString *)name
{
    _name = name;
    _imageView.image =[UIImage imageNamed:name];
}

-(void)setText:(NSString *)text
{
    _text = text;
    _label.text = text;
}
@end
