//
//  SFMCircleDetailHeader.m
//  SFMX
//
//  Created by qianfeng on 15/4/12.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SFMCircleDetailHeader.h"
@interface SFMCircleDetailHeader()
{
    UIImageView * iconView;
    UILabel * titleLabel;
    UILabel * desLabel;
    UIButton * seeButton;
    UIView * view;
    UILabel * numLabel;
}
@end
@implementation SFMCircleDetailHeader

+(SFMCircleDetailHeader *)headerView{
    return [[self alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 120)];
}


-(instancetype)initWithFrame:(CGRect)frame
{
    if(self=[super initWithFrame:frame]){
        [self createUI];
    }
    return self;
}

-(void)createUI
{
    //创建头像
    iconView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 60, 60)];
    iconView.layer.cornerRadius = 30;
    iconView.layer.masksToBounds = YES;
    [self addSubview:iconView];
    
    //创建title
    titleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    titleLabel.font = [UIFont systemFontOfSize:17];
    titleLabel.textColor = [UIColor colorWithRed:241/255.0 green:114/255.0 blue:155/255.0 alpha:1];
    [self addSubview:titleLabel];
    
    //创建des
    desLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    desLabel.font = [UIFont systemFontOfSize:17];
    desLabel.textColor = [UIColor colorWithRed:109/255.0 green:109/255.0 blue:109/255.0 alpha:1];
    [self addSubview:desLabel];
    
    //创建seebtn
    seeButton = [[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-10-60, 15, 50, 30)];
    [seeButton setBackgroundImage:[UIImage imageNamed:@"btn_cancel_attention"] forState:UIControlStateNormal];
    [self addSubview:seeButton];
    
    //创建view
    [self createView];
    self.backgroundColor = [UIColor whiteColor];
    
    
}

//创建赞列表的view
-(void)createView
{
    view = [[UIView alloc]initWithFrame:CGRectMake(8, CGRectGetMaxY(iconView.frame)+10, [UIScreen mainScreen].bounds.size.width-16, 40)];
    view.layer.cornerRadius = 20;
    view.layer.masksToBounds = YES;
    view.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
    [self addSubview:view];
    
    //创建view里面的数据
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(6, 10, 20, 20)];
    imageView.image = [UIImage imageNamed:@"qz_ic_tj"];
    [view addSubview:imageView];
    
    //创建numview
    numLabel = [[UILabel alloc]initWithFrame:CGRectMake(view.frame.size.width-5-40, 7, 40, 22)];
    numLabel.font = [UIFont systemFontOfSize:15];
    numLabel.textAlignment = NSTextAlignmentCenter;
    numLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"index_zan_numbbg.png"]];
    [view addSubview:numLabel];
    
    CGFloat x = CGRectGetMaxX(imageView.frame);
    CGFloat Y = 5;
    CGFloat w = 30;
    CGFloat h = 30;
    CGFloat padding =(CGRectGetMinX(numLabel.frame)-x-7*30)/8;
    for (int i=0; i<7; i++) {
        UIImageView * zanImageView = [[UIImageView alloc]initWithFrame:CGRectMake(x+i*(w+padding), Y, w, h)];
        zanImageView.layer.cornerRadius = 15;
        zanImageView.layer.masksToBounds = YES;
        zanImageView.image = [UIImage imageNamed:@"index_small_headimg.png"];
        zanImageView.tag = 100+i;
        [view addSubview:zanImageView];
    }
}


-(void)setIconName:(NSString *)iconName titile:(NSString *)title des:(NSString *)des array:(NSArray *)array
{
    iconView.image = [UIImage imageNamed:iconName];
    CGSize titleSize =[title boundingRectWithSize:CGSizeMake(200, 500) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    
    titleLabel.frame = CGRectMake(CGRectGetMaxY(iconView.frame)+8, 15,titleSize.width+20, titleSize.height);
    titleLabel.text =title;
    
    CGSize desSize =[des boundingRectWithSize:CGSizeMake(200, 500) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil].size;
    
    desLabel.frame = CGRectMake( titleLabel.frame.origin.x, CGRectGetMaxY(titleLabel.frame)+10, desSize.width, desSize.height);
    desLabel.text = des;
    numLabel.text =[NSString stringWithFormat:@"%d",array.count];
    
    int count =array.count>7?7:array.count;
    for(int i=0;i<count;i++){
        UIImageView * imageView=(UIImageView * )[view viewWithTag:i+100];
        imageView.image = [UIImage imageNamed:array[i]];
        
    }
    
}



@end
