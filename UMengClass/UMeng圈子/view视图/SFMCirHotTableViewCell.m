//
//  SFMCircleTableViewCell.m
//  SFMX
//
//  Created by qianfeng on 15/4/10.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//
#import "SFMCirHotTableViewCell.h"

@interface SFMCirHotTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titlelabel;
@property (weak, nonatomic) IBOutlet UILabel *desLabel;

@property (weak, nonatomic) IBOutlet UIButton *seeButton;
- (IBAction)seeAction:(id)sender;


@end
@implementation SFMCirHotTableViewCell
{
    BOOL isSelected;
}

+(SFMCirHotTableViewCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID  =@"MCircleCell2";
    SFMCirHotTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID]
;
    if(cell==nil){
        cell = [[[NSBundle mainBundle]loadNibNamed:@"SFMCirHotTableViewCell" owner:nil options:nil]lastObject];
    }

    return cell;
}

-(void)setImage:(NSString *)imaegName withTitle:(NSString *)title withDes:(NSString *)des
{
    self.iconView.image = [UIImage imageNamed:imaegName];
    self.iconView.layer.cornerRadius = 24;
    self.iconView.layer.masksToBounds = YES;
    
    self.titlelabel.text = title;
    self.desLabel.text = des;
}

- (IBAction)seeAction:(id)sender {
    
    isSelected = !isSelected;
    self.seeButton.selected =isSelected;
    NSLog(@"%@",NSStringFromCGRect(self.seeButton.frame));
}
@end
