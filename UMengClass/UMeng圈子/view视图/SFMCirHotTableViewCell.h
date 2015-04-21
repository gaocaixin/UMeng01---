//
//  SFMCircleTableViewCell.h
//  SFMX
//
//  Created by qianfeng on 15/4/10.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFMCirHotTableViewCell : UITableViewCell

-(void)setImage:(NSString *)imaegName withTitle:(NSString *)title withDes:(NSString *)des;


+(SFMCirHotTableViewCell *)cellWithTableView:(UITableView *)tableView;
@end
