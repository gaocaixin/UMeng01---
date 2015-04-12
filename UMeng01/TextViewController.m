//
//  TextViewController.m
//  UMeng01
//
//  Created by gaocaixin on 15/4/12.
//  Copyright (c) 2015年 GCX. All rights reserved.
//

#import "TextViewController.h"
#import "CXMineTableViewController.h"

@interface TextViewController ()

@end

@implementation TextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createBtn];
}

- (void)createBtn
{
    CGFloat W = 100;
    CGFloat H = 100;
    CGFloat X = 20;
    CGFloat Y = 40;
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(X, Y, W, H)];
    btn.backgroundColor = [UIColor grayColor];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnClick:(UIButton *)btn
{
    [self.navigationController pushViewController:[[CXMineTableViewController alloc] init] animated:YES];
}

@end
