//
//  CXSettingBtnController.m
//  CXWeibo
//
//  Created by gaocaixin on 15-3-31.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CXSettingBtnController.h"
#import "CXSettingArrowItem.h"
#import "CXSettingItem.h"
#import "CXSettingGroupItem.h"
#import "CXSettingSwitchItem.h"
#import "GXSettingEditController.h"
#import "GXSettingYijianController.h"

@interface CXSettingBtnController ()

@end

@implementation CXSettingBtnController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"设置";
    
    [self setupGroup0];
    [self setupGroup1];
    [self setupGroup2];
    [self setupGroup3];
    [self setupGroup4];
    [self setupGroup5];
    [self setupGroup6];
    
    [self setupFooter];
}

- (void)setupFooter
{
    // 按钮
    UIButton *logoutButton = [[UIButton alloc] init];
    
    CGFloat logoutW = 250;
    CGFloat logoutX = (CGRectGetWidth(self.view.frame) - logoutW)/2;
    CGFloat logoutY = 10;
    CGFloat logoutH = 40;
    logoutButton.frame = CGRectMake(logoutX, logoutY, logoutW, logoutH);
    
    // 背景和文字
    [logoutButton setBackgroundImage:[UIImage resizedImageWithName:@"set_btnbg"] forState:UIControlStateNormal];
    [logoutButton setBackgroundImage:[UIImage resizedImageWithName:@"set_btnbg"] forState:UIControlStateHighlighted];
    [logoutButton setTitle:@"退出登录" forState:UIControlStateNormal];
    logoutButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [logoutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    // footer
    UIView *footer = [[UIView alloc] init];
    CGFloat footerH = logoutH + 20;
    footer.frame = CGRectMake(0, 0, 0, footerH);
    footer.backgroundColor = [UIColor colorWithWhite:247/255.0 alpha:1];
    // tableview的footerview和headerview 都是320
    self.tableView.tableFooterView = footer;
    [footer addSubview:logoutButton];
}

- (void)setupGroup0
{
    CXSettingGroupItem *group = [self addGroup];
    
    CXSettingArrowItem *set_ic_edit = [CXSettingArrowItem itemWithIcon:@"set_ic_edit" title:@"编辑个人资料" destVcClass:[GXSettingEditController class]];
    group.items = @[set_ic_edit];
}

- (void)setupGroup1
{
    CXSettingGroupItem *group = [self addGroup];
    
    CXSettingArrowItem *set_ic_caog = [CXSettingArrowItem itemWithIcon:@"set_ic_caog" title:@"草稿箱" destVcClass:nil];
    group.items = @[set_ic_caog];
}

- (void)setupGroup2
{
    CXSettingGroupItem *group = [self addGroup];
    
    CXSettingArrowItem *set_ic_message = [CXSettingArrowItem itemWithIcon:@"set_ic_message" title:@"消息推送" destVcClass:nil];
    group.items = @[set_ic_message];
}

- (void)setupGroup3
{
    CXSettingGroupItem *group = [self addGroup];
    
    CXSettingSwitchItem *set_ic_photo = [CXSettingSwitchItem itemWithIcon:@"set_ic_photo" title:@"图片自动保存到本地"];
    CXSettingSwitchItem *set_ic_camera = [CXSettingSwitchItem itemWithIcon:@"set_ic_camera" title:@"拍照自动保存原图"];
    group.items = @[set_ic_photo, set_ic_camera];
}

- (void)setupGroup4
{
    CXSettingGroupItem *group = [self addGroup];
    
    CXSettingArrowItem *set_ic_about = [CXSettingArrowItem itemWithIcon:@"set_ic_about" title:@"关于萌秀" destVcClass:nil];
    group.items = @[set_ic_about];
}

- (void)setupGroup5
{
    CXSettingGroupItem *group = [self addGroup];
    
    CXSettingArrowItem *set_ic_question = [CXSettingArrowItem itemWithIcon:@"set_ic_question" title:@"常见问题" destVcClass:nil];
    CXSettingArrowItem *set_ic_yijian = [CXSettingArrowItem itemWithIcon:@"set_ic_yijian" title:@"意见反馈" destVcClass:[GXSettingYijianController class]];
    group.items = @[set_ic_question, set_ic_yijian];
}

- (void)setupGroup6
{
    CXSettingGroupItem *group = [self addGroup];
    
    CXSettingArrowItem *set_ic_share = [CXSettingArrowItem itemWithIcon:@"set_ic_share" title:@"推荐给朋友" destVcClass:nil];
    group.items = @[set_ic_share];
}


@end
