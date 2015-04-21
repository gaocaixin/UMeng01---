//
//  SFMCircleTableViewCell.h
//  SFMX
//
//  Created by qianfeng on 15/4/10.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFMCircleTableViewCell : UITableViewCell

-(void)setImage:(NSString *)imaegName withTitle:(NSString *)title withDes:(NSString *)des withSeeNum:(NSString *)seeNum;


+(SFMCircleTableViewCell *)cellWithTableView:(UITableView *)tableView;
@end
