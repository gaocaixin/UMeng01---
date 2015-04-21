//
//  SFMCircleTableViewController.m
//  SFMX
//
//  Created by qianfeng on 15/4/10.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SFMCircleTableViewController.h"
#import "SFMCircleTableViewCell.h"
#import "SFHeaderForCell.h"
#import "SFMCirHotTableViewCell.h"
#import "SFDetailViewController.h"
#define Height_Header 52
@interface SFMCircleTableViewController ()
{
    NSArray * dataArray1;
     NSArray * dataArray2;
}
@end

@implementation SFMCircleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createNav];
//    [self createTabBar];
    [self loadData];
}

//创建导航栏
-(void)createNav
{
    self.navigationItem.title = @"萌圈子";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"title_btn_my"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(myClick)];
}

#pragma mark -设置tabbar
-(void)createTabBar
{
//    self.tabBarItem =[[UITabBarItem alloc]initWithTitle:@"萌圈子" image:[[UIImage imageNamed:@"tabbar_btn_qznor"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage: [[UIImage imageNamed:@"tabbar_btn_qzsel"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    self.tabBarController.tabBar.tintColor = [UIColor colorWithRed:236/255.0 green:86/255.0 blue:138/255.0 alpha:1];
}

-(void)loadData
{
    dataArray1 = @[@[@"1.jpg",@"我的旅游风情",@"清是一种风景，风景是一种轻",@"15371"], @[@"1.jpg",@"诗词歌赋桃花源",@"清是一种风景，风景是一种轻",@"15371"],@[@"1.jpg",@"生活圈子",@"清是一种风景，风景是一种轻",@"15371"]
                         ];
    
    dataArray2 = @[@[@"1.jpg",@"草堂诗情话圈",@"清是一种风景，风景是一种轻"], @[@"1.jpg",@"草堂诗情话圈",@"清是一种风景，风景是一种轻"]];
    
    [self.tableView reloadData];
    
}
#pragma mark 导航栏事件
-(void)myClick
{
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        return dataArray1.count;
    }else if(section==1){
        return  dataArray2.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        SFMCircleTableViewCell * cell= [SFMCircleTableViewCell cellWithTableView:tableView];
         NSArray * array = dataArray1[indexPath.row];
        [cell setImage:array[0] withTitle:array[1] withDes:array[2] withSeeNum:array[3]];
        return cell;
        
    }else if (indexPath.section==1){
        SFMCirHotTableViewCell * cell= [SFMCirHotTableViewCell cellWithTableView:tableView];
        NSArray * array = dataArray2[indexPath.row];
        [cell setImage:array[0] withTitle:array[1] withDes:array[2]];
        return cell;
    }
    return nil;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        SFHeaderForCell * view = [[SFHeaderForCell alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, Height_Header)];
        view.text = @"我关注的";
        view.name = @"qz_ic_cup.png";
        return view;
    }else if (section==1){
        SFHeaderForCell * view = [[SFHeaderForCell alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, Height_Header)];
        view.text = @"推荐最热";
        view.name = @"qz_ic_zuire.png";
        return view;
    }
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0||indexPath.section==1) {
        return 75;
    }
    return 44;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return Height_Header;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SFDetailViewController * vc = [[SFDetailViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}


@end
