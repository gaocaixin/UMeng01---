//
//  SFMCircleTableViewCell.m
//  SFMX
//
//  Created by qianfeng on 15/4/10.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SFMCircleTableViewCell.h"
@interface SFMCircleTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titlelabel;
@property (weak, nonatomic) IBOutlet UILabel *desLabel;

@property (weak, nonatomic) IBOutlet UILabel *seeLabel;

@end
@implementation SFMCircleTableViewCell

+(SFMCircleTableViewCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID  =@"MCircleCell1";
    SFMCircleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID]
;
    if(cell==nil){
        cell = [[[NSBundle mainBundle]loadNibNamed:@"SFMCircleTableViewCell" owner:nil options:nil]lastObject];
    }
    return cell;
}

-(void)setImage:(NSString *)imaegName withTitle:(NSString *)title withDes:(NSString *)des withSeeNum:(NSString *)seeNum
{
    self.iconView.image = [UIImage imageNamed:imaegName];
    self.iconView.layer.cornerRadius = 24;
    self.iconView.layer.masksToBounds = YES;
    
    self.titlelabel.text = title;
    self.desLabel.text = des;
    self.seeLabel.text = [NSString stringWithFormat:@"%@人关注",seeNum];
    
}

-(void)layoutSubviews
{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0,self.frame.size.height-1 , self.frame.size.width, 1)];
    view.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1];
    [self addSubview:view];
}

@end
