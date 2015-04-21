//
//  LYTabBarController.m
//  MengXiu
//
//  Created by ChangLuyang on 15/4/8.
//  Copyright (c) 2015年 chang. All rights reserved.
//

#import "LYTabBarController.h"
#import "LYTabBarButton.h"
#import "SFMCircleTableViewController.h"
#import "SquareViewController.h"
#import "PhotoSelectController.h"

@interface LYTabBarController ()
@end

@implementation LYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createVC];
    [self createBtnView];
    [self createButtons];
}

- (void)createVC
{
    SquareViewController *svc = [[SquareViewController alloc] init];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:svc];
    
    SFMCircleTableViewController *cvc = [[SFMCircleTableViewController alloc] init];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:cvc];
    
   
    self.viewControllers = @[nav1, nav2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark
- (void)createBtnView {
//    self.tabBar.hidden = YES;
    self.tabBar.backgroundColor = [UIColor clearColor];
    self.tabBar.backgroundImage = [[UIImage alloc] init];
    
    _btnView = [[UIImageView alloc] initWithFrame:self.tabBar.bounds];
    //添加拉伸的背景图
    _btnView.image = [[UIImage imageNamed:@"tabbarbg"] stretchableImageWithLeftCapWidth:1 topCapHeight:0];
    //用户接口打开
    _btnView.userInteractionEnabled = YES;
    [self.tabBar addSubview:self.btnView];
}
- (void)createButtons {
    // 中间相机按钮
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(105, 2.5, 110, 44);
    [button setImage:[UIImage imageNamed:@"tabbar_btn_camera"] forState:UIControlStateNormal];
    button.tag = 100;
    [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchDown];
    [self.btnView addSubview:button];
    
    // 萌广场
    LYTabBarButton *square = [[LYTabBarButton alloc] initWithTitle:@"萌广场" image:@"tabbar_btn_gcnor" selectedImage:@"tabbar_btn_gcsel"];
    square.frame = CGRectMake(0, 2.5, 105, 44);
    square.selected = YES;
    square.tag = 1;
    [square addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchDown];
    [self.btnView addSubview:square];
    
    // 萌圈子
    LYTabBarButton *circle = [[LYTabBarButton alloc] initWithTitle:@"萌圈子" image:@"tabbar_btn_qznor" selectedImage:@"tabbar_btn_qzsel"];
    circle.frame = CGRectMake(215, 2.5, 105, 44);
    circle.tag = 2;
    [circle addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchDown];
    [self.btnView addSubview:circle];
    
}
- (void)onClick:(UIButton *)button {
    if (button.tag == 100) {
        [self camera];
    } else {
        button.selected = YES;
        UIButton *btn = (UIButton *)[self.btnView viewWithTag:!(button.tag - 1) + 1];
        btn.selected = NO;
        self.selectedIndex = !(btn.tag - 1);
        NSLog(@"选择了导航控制器%d", self.selectedIndex);
    }
    
}
/**
 *  点击相机按钮发生的事件
 */
- (void)camera {
    NSLog(@"点击了相机按钮");
    PhotoSelectController *selVc = [[PhotoSelectController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:selVc];
    [self presentViewController:nav animated:YES completion:nil];
}
@end
