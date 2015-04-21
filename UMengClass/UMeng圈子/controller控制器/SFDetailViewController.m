//
//  SFDetailViewController.m
//  SFMX
//
//  Created by qianfeng on 15/4/11.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SFDetailViewController.h"
#import "SFDetailCell1.h"
#import "SFMCircleDetailHeader.h"
#import "SFCreateTopicViewController.h"
@interface SFDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView * _tableView;
}

@property (nonatomic,strong) NSArray * dataArray;
@property (nonatomic,strong) NSArray * cellDataArray;

@end

@implementation SFDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTableView];
    [self loadData];
    [self createTableViewHeader];
    //创建话题按钮
    [self createTopicButton];
   
}

-(void)createTopicButton
{
    UIButton * topicButton = [[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-20-50, [UIScreen mainScreen].bounds.size.height-20-50-69, 50, 50)];
    [topicButton setBackgroundImage:[UIImage imageNamed:@"huati_btn_write"] forState:UIControlStateNormal];
    [topicButton addTarget:self action:@selector(createTopic) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:topicButton];
    
}

-(void)createTopic
{
    SFCreateTopicViewController * vc = [[SFCreateTopicViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}


//headr
-(void)createTableViewHeader
{
    SFMCircleDetailHeader * header = [SFMCircleDetailHeader headerView];
     [header setIconName:_dataArray[0] titile:_dataArray[1] des:_dataArray[2] array:_dataArray[3]];
    _tableView.tableHeaderView =header;
}

-(void)createTableView
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

-(void)loadData
{
    _dataArray = @[@"1.jpg",@"光明BRIGH",@"情是一种风景，风景是一种情",@[@"1.jpg",@"1.jpg",@"1.jpg",@"1.jpg"]];
    
    
    NSArray * array1 =@[@"热",
                        @"我与云顶温泉之不得不说的事",
                        @{@"name":@"光影万里",@"time":@"20",@"zannum":@"2345"},
                        @[]];
    NSArray * array2 =@[@"图",
                        @"美到心碎的圣地亚哥，大爱！！",
                        @{@"name":@"BY SAMBB52",@"time":@"20",@"zannum":@"2345"},
                        @[@"2.jpg",@"2.jpg",@"2.jpg",@"2.jpg",@"2.jpg",@"2.jpg"]];
    _cellDataArray = @[array1,array2];
    [_tableView reloadData];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cellDataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        SFDetailCell1 * cell = [tableView dequeueReusableCellWithIdentifier:@"detailCell1"];
        if (!cell) {
            cell = [[SFDetailCell1 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"detailCell1"];
        }
        NSArray * array = _cellDataArray[indexPath.row];
        [cell setIconName:array[0] titile:array[1] withDic:array[2] withArray:array[3]];
        
        return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}

@end
