//
//  CXSettingGroupItem.h
//  CXWeibo
//
//  Created by gaocaixin on 15-3-31.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CXSettingItem.h"

@interface CXSettingGroupItem : CXSettingItem

@property (nonatomic, copy) NSString *header;
@property (nonatomic, copy) NSString *footer;
@property (nonatomic ,strong) NSArray *items;

+ (instancetype)group;
@end
