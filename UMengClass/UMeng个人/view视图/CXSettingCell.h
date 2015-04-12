//
//  CXSettingCell.h
//  CXWeibo
//
//  Created by gaocaixin on 15-3-31.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CXSettingItem;

@interface CXSettingCell : UITableViewCell

@property (nonatomic ,strong) CXSettingItem *item;
@property (nonatomic ,strong) NSIndexPath *indexPath;

+ (CXSettingCell *)settingCell:(UITableView *)tableView;

@end
