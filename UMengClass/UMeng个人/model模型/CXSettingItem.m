//
//  CXSettingItem.m
//  CXWeibo
//
//  Created by gaocaixin on 15-3-31.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CXSettingItem.h"

@implementation CXSettingItem

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title
{
    CXSettingItem *item = [CXSettingItem item];
    item.title = title;
    item.icon = icon;
    return item;
}
+ (instancetype)itemWithTitle:(NSString *)title
{
    return [self itemWithIcon:nil title:title];
}
+ (instancetype)item
{
    return [[self alloc] init];
}

@end
