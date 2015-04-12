//
//  CXSettingViewController.h
//  CXWeibo
//
//  Created by gaocaixin on 15-3-31.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CXSettingGroupItem;

@interface CXSettingViewController : UITableViewController

@property (nonatomic ,strong) NSMutableArray *groups;

- (CXSettingGroupItem *)addGroup;

@end
