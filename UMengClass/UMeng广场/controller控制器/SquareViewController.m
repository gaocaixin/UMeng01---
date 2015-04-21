//
//  SquareViewController.m
//  MengXiu
//
//  Created by ChangLuyang on 15/4/8.
//  Copyright (c) 2015年 chang. All rights reserved.
//

#import "SquareViewController.h"
#import "LYTableViewCell.h"
#import "Message.h"
#import "MessageFrame.h"
#import "User.h"
#import "CXMineTableViewController.h"

@interface SquareViewController ()<UITableViewDataSource, UITableViewDelegate, UITableViewCellDelegate>
{
    UITableView *_tableView;
    
    //假数据
    Message *message;
    MessageFrame *mf;
}
@end

@implementation SquareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置状态栏字体为白色
    // 需要在info.plist中添加View controller-based status bar appearance并且设置为NO
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    // UI定制
    [self customUI];
    [self createTableView];
    
    
    // 创建一条假数据测试
    /*************************/
    message = [[Message alloc] init];
    message.nickName = @"名字长了看起来才会很屌";
    message.iconURL = @"http://img1.funshion.com/attachment/fs/112/200/112200.jpg?1387939530";
    message.timeBefore = @"20分钟之前";
    message.imageURL = @"http://img.funshion.com/pictures/343/593/0/3435930_l.jpg";
    message.contentString = @"新京报讯昨日下午，中央层面的第三批首场公车拍卖，也即中央公车拍卖的第八场，在北京花乡旧车交易市场落槌。本场拍卖会共124辆公车待拍，成交的122辆公车总起拍价为382.8万元，总成交价为614.65万元，溢价率为60.57%。这是继第七场公车拍卖溢价率跌至51%之后，溢价率再次跌破70%。此前的六场公车拍卖会上，溢价率均超70%，其中有三场溢价率超100%。";
    message.active = YES;
    message.numberOfInteraction = @"参与互动游戏的人数20人";
    message.numberOfComments = @"查看所有6条评论";
    
    NSMutableArray *a = [[NSMutableArray alloc] init];
    
    User *user = [[User alloc] init];
    user.iconURL = nil;
    user.titleName = @"幸福的魔石";
    user.comment = @"看起来好专业哦";
    
    [a addObject:user];
    
    User *auser = [[User alloc] init];
    auser.iconURL = nil;
    auser.titleName = @"水筋先生";
    auser.comment = @"各种炫啊,,在下对你的景仰之情有如滔滔长江之水，连绵不绝……又如黄河泛滥，一发不可收拾……嘿嘿惊天地！泣鬼神！感人肺腑！感人落泪！i 服了 u！长江后浪退前浪，灌水英雄代代出";
    [a addObject:auser];
    
    message.userArray = a;
    /**********************************/
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)createTableView {
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    //隐藏分割线
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
}
- (void)customUI {
    // 导航条的颜色
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:(CGFloat)241/255 green:(CGFloat)114/255 blue:(CGFloat)155/255 alpha:1];
    
    // 我
    UIButton *uiv = [[UIButton alloc] init];
    [uiv setBackgroundImage:[UIImage imageNamed:@"title_btn_my"] forState:UIControlStateNormal];
    uiv.bounds = CGRectMake(0, 0, uiv.currentBackgroundImage.size.width, uiv.currentBackgroundImage.size.height);
    UIBarButtonItem *rb = [[UIBarButtonItem alloc] initWithCustomView:uiv];
    [uiv addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = rb;
    
    // 最热  关注
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 114, 27)];
    v.tag = 1000;
    v.userInteractionEnabled = YES;
    self.navigationItem.titleView = v;
    
    NSArray *nor = @[@"index_title_leftbtnnor",
                     @"index_title_rightbtnnor"];
    NSArray *sel = @[@"index_title_leftbtnsel",
                     @"index_title_rightbtnsel"];
    NSArray *title = @[@"最热",
                       @"关注"];
    for (int i = 0; i < 2 ; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i * 57, 0, 57, 27)];
        button.tag = 100 + i;
        [button setBackgroundImage:[UIImage imageNamed:nor[i]] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:sel[i]] forState:UIControlStateSelected];
        
        [button setTitle:title[i] forState:UIControlStateNormal];
        
        [button setTitleColor:[UIColor colorWithRed:(CGFloat)236/255 green:(CGFloat)75/255 blue:(CGFloat)127/255 alpha:1] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        
        // 添加事件
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchDown];
        if (i == 0) {
            button.selected = YES;
        } else {
            button.selected = NO;
        }
        
        [v addSubview:button];
    }
    
}
- (void)buttonClicked:(UIButton *)button {
    button.selected = !button.selected;
    UIButton *btn = (id)[self.navigationItem.titleView viewWithTag:!(button.tag - 100) + 100];
    btn.selected = !btn.selected;
    NSLog(@"选中了%d, 同时%d取消选中了", button.tag, !(button.tag - 100) + 100);
}
- (void)onClick:(UIBarButtonItem *)btnItem {
    CXMineTableViewController *mine = [[CXMineTableViewController alloc] init];
    [self.navigationController pushViewController:mine animated:YES];
}

#pragma mark - 代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    
     mf = [[MessageFrame alloc] initWithMessage:message];
    
    
    
    
    LYTableViewCell *cell = [[LYTableViewCell alloc] initWithMessageFrame:mf];
    tableView.tableFooterView = [[UIView alloc] init];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 1600;
    return mf.heightOfCell;
    
}

#pragma mark - cell代理方法
- (void)eyesOnClicked:(UIButton *)button {
    NSLog(@"点击了关注按钮");
}
- (void)downloadClicked:(UIButton *)button {
    NSLog(@"点击了下载按钮");
}
- (void)TapClicked:(UIButton *)button {
    NSLog(@"点击了Tap按钮");
}
- (void)smallButtonClicked:(UIButton *)button {
    NSLog(@"点击了%d号按钮", button.tag);
}


@end
