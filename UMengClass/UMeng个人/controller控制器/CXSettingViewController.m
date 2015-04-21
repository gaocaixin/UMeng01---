//
//  CXSettingViewController.m
//  CXWeibo
//
//  Created by gaocaixin on 15-3-31.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CXSettingViewController.h"
#import "CXSettingGroupItem.h"
#import "CXSettingArrowItem.h"
#import "CXSettingItem.h"
#import "CXSettingCell.h"

@interface CXSettingViewController ()

@end

@implementation CXSettingViewController


- (NSMutableArray *)groups
{
    if (_groups == nil) {
        _groups = [[NSMutableArray alloc] init];
    }
    return _groups;
}


- (CXSettingGroupItem *)addGroup
{
    CXSettingGroupItem *group = [CXSettingGroupItem group];
    [self.groups addObject:group];
    return group;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor colorWithWhite:255/255.0 alpha:1];
    self.tableView.sectionFooterHeight = 5;
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.contentInset = UIEdgeInsetsMake(-30, 0, 0, 0);
    self.tableView.rowHeight = 45;
    
    UIButton *back = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [back setImage:[UIImage imageNamed:@"title_btn_back"] forState:UIControlStateNormal];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:back];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    CXSettingGroupItem *group = self.groups[section];
    return [group.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CXSettingCell *cell = [CXSettingCell settingCell:tableView];
    CXSettingGroupItem *group = self.groups[indexPath.section];
    CXSettingItem *item = group.items[indexPath.row];
    cell.item = item;
    cell.indexPath = indexPath;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.groups[section] header];
}


- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return [self.groups[section] footer];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 取出模型
    CXSettingGroupItem *group = self.groups[indexPath.section];
    CXSettingItem *item = group.items[indexPath.row];
    
    // 操作
    if (item.operation) {
        item.operation();
    }
    // 跳转
    if ([item isKindOfClass:[CXSettingArrowItem class]]) {
        CXSettingArrowItem *arrowItem = (CXSettingArrowItem *)item;
        if (arrowItem.destVcClass) {
            UIViewController *destVc  = [[arrowItem.destVcClass alloc] init];
            destVc.title = item.title;
            [self.navigationController pushViewController:destVc animated:YES];
        }
    }
}


@end
