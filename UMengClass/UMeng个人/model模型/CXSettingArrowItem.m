//
//  CXSettingArrowItem.m
//  CXWeibo
//
//  Created by gaocaixin on 15-3-31.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CXSettingArrowItem.h"

@implementation CXSettingArrowItem
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass
{
    CXSettingArrowItem *item = [[CXSettingArrowItem alloc] init];
    item.title = title;
    item.icon  = icon;
    item.destVcClass = destVcClass;
    return item;
}

+ (instancetype)itemWithTitle:(NSString *)title destVcClass:(Class)destVcClass
{

    return [self itemWithIcon:nil title:title destVcClass:destVcClass];
}

@end
