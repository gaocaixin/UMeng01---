//
//  CXSettingSwitchItem.m
//  CXWeibo
//
//  Created by gaocaixin on 15-3-31.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CXSettingSwitchItem.h"

@implementation CXSettingSwitchItem

+ (instancetype)itemWithTitle:(NSString *)title
{
    return [self itemWithIcon:nil title:title];
}

+ (instancetype)item
{
    return [[self alloc] init];
}

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title
{
    CXSettingSwitchItem *item = [CXSettingSwitchItem item];
    item.title = title;
    item.icon = icon;
    return item;
}

@end
