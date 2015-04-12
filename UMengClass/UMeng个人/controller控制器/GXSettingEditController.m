//
//  GXSettingEditController.m
//  UMengSetting
//
//  Created by gaocaixin on 15-4-8.
//  Copyright (c) 2015年 GCX. All rights reserved.
//

#import "GXSettingEditController.h"
#import "CXSettingArrowItem.h"
#import "CXSettingGroupItem.h"

@interface GXSettingEditController ()

@end

@implementation GXSettingEditController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"编辑个人资料";
    
    [self setupGroup0];
    
    [self BarButtonItem];
    
}

- (void)BarButtonItem
{
    UIButton *rightBtn = [[UIButton alloc] init];
    rightBtn.frame = CGRectMake(0, 0, 40, 30);
    rightBtn.backgroundColor = [UIColor clearColor];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    [rightBtn setTitle:@"保存" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
}

- (void)rightBarButtonItemClicked
{
    
}

- (void)setupGroup0
{
    CXSettingGroupItem *group = [self addGroup];
    
    CXSettingArrowItem *icon = [CXSettingArrowItem itemWithIcon:@"set_ic_edit" title:@"修改头像" destVcClass:nil];
    CXSettingArrowItem *name = [CXSettingArrowItem itemWithIcon:nil title:@"昵称" destVcClass:nil];
    
    CXSettingArrowItem *sex = [CXSettingArrowItem itemWithIcon:nil title:@"性别" destVcClass:nil];
    
    CXSettingArrowItem *location = [CXSettingArrowItem itemWithIcon:nil title:@"所在地" destVcClass:nil];
    
    CXSettingArrowItem *person = [CXSettingArrowItem itemWithIcon:nil title:@"个人签名" destVcClass:nil];
    
    group.items = @[icon, name, sex, location, person];
    
}


@end
