//
//  SFDetailCell1.m
//  SFMX
//
//  Created by qianfeng on 15/4/11.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SFDetailCell1.h"
@interface SFDetailCell1()
{
    UIImageView * iconView;
    UILabel * titleLabel;
    UILabel * nameLabel;
    UIButton * timeButton;
    UIButton *zanButton;
    UIView *view;
    
}

@property (nonatomic,assign)CGFloat cellHeight;

@end
@implementation SFDetailCell1

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}

-(void)createUI
{
    //创建头像
    iconView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 15, 30, 30)];
    iconView.layer.cornerRadius = 15;
    iconView.layer.masksToBounds = YES;
    [self.contentView addSubview:iconView];
    
    //创建title
    titleLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    titleLabel.font = [UIFont systemFontOfSize:17];
    titleLabel.textColor = [UIColor colorWithRed:49/255.0 green:49/255.0 blue:49/255.0 alpha:1];
    [self.contentView addSubview:titleLabel];
    
    // 创建view
     [self createView];
}

//创建赞列表的view
-(void)createView
{
    
    view = [[UIView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(iconView.frame)+10, [UIScreen mainScreen].bounds.size.width-20, 40)];
    
    CGFloat width = view.frame.size.width/3;
    CGFloat height = 30;
    
    nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, width, height)];
    nameLabel.font = [UIFont boldSystemFontOfSize:17];
    nameLabel.textColor = [UIColor colorWithRed:241/255.0 green:114/255.0 blue:155/255.0 alpha:1];
    [view addSubview:nameLabel];
    
    timeButton = [[UIButton alloc]initWithFrame:CGRectMake(width, 0, width, height)];
    timeButton.userInteractionEnabled = NO;
    [timeButton setTitleColor:[UIColor colorWithRed:152/255.0 green:152/255.0 blue:152/255.0 alpha:1] forState:UIControlStateNormal];
    timeButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [timeButton setImage:[UIImage imageNamed:@"ic_time"] forState:UIControlStateNormal];
    [timeButton setImageEdgeInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
    [view addSubview:timeButton];
    
    
    zanButton =[[UIButton alloc]initWithFrame:CGRectMake(width*2, 0, width, height)];
    [zanButton setTitleColor:[UIColor colorWithRed:152/255.0 green:152/255.0 blue:152/255.0 alpha:1] forState:UIControlStateNormal];
    zanButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [zanButton setImage:[UIImage imageNamed:@"huati_ic_zan"] forState:UIControlStateNormal];
    [zanButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [view addSubview:zanButton];
    
    [self.contentView addSubview:view];

}


-(void)setIconName:(NSString *)iconName titile:(NSString *)title withDic:(NSDictionary *)dic withArray:(NSArray *)array
{
    if ([iconName isEqualToString:@"热"]) {
        iconView.image = [UIImage imageNamed:@"huati_ic_re"];
    }else if([iconName isEqualToString:@"图"]){
        iconView.image = [UIImage imageNamed:@"huati_ic_pic"];
    }
    CGSize titleSize =[title boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 500) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil].size;
    
    titleLabel.frame = CGRectMake(CGRectGetMaxX(iconView.frame)+8, 22,titleSize.width+20, titleSize.height);
    titleLabel.text =title;
    
    nameLabel.text = dic[@"name"];
    [timeButton setTitle:[NSString stringWithFormat:@"%@分钟前",dic[@"time"]] forState:UIControlStateNormal];
    [zanButton setTitle:dic[@"zannum"] forState:UIControlStateNormal];
    
    
    _cellHeight = CGRectGetMaxY(zanButton.frame);
    
    
    CGFloat photoY =0;
    if (array.count>0) {
        photoY=CGRectGetMaxY(view.frame);
        
        for (int i=0; i<array.count; i++) {
            int indexX = i%5;
            int indexY = i/5;
            CGFloat photoW = 50;
            CGFloat photoH = 50;;
            
            CGFloat padding = ([UIScreen mainScreen].bounds.size.width-20 -5*50)/4;
            UIImageView * photoView = [[UIImageView alloc]initWithFrame:CGRectMake(10+indexX*(photoW+padding), photoY+10+indexY*(50+10), photoW, photoH)];
            photoView.image = [UIImage imageNamed:array[i]];
            
            
            [self.contentView addSubview:photoView];
            _cellHeight =CGRectGetMaxY(photoView.frame);
        }
    }

}


@end
