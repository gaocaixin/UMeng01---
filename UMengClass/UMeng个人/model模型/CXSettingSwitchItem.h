//
//  CXSettingSwitchItem.h
//  CXWeibo
//
//  Created by gaocaixin on 15-3-31.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CXSettingItem.h"

@interface CXSettingSwitchItem : CXSettingItem

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title;
+ (instancetype)itemWithTitle:(NSString *)title;

@end
