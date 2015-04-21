//
//  CXSettingCell.m
//  CXWeibo
//
//  Created by gaocaixin on 15-3-31.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CXSettingCell.h"
#import "CXSettingItem.h"
#import "CXSettingArrowItem.h"
#import "CXSettingLabelItem.h"
#import "CXSettingSwitchItem.h"
#import "CXBadgeButten.h"

@interface CXSettingCell ()

@property (nonatomic ,strong) UISwitch *switchView;

@property (nonatomic ,strong) UIImageView *arrowView;

@property (nonatomic ,strong) CXBadgeButten *badgeButten;

@property (nonatomic ,weak) UITableView *tableView;


@property (nonatomic ,weak) UIImageView *backgroundImageView;
@property (nonatomic ,weak) UIImageView *selectedBackgroundImageView;
@end

@implementation CXSettingCell

- (CXBadgeButten *)badgeButten
{
    if (_badgeButten == nil) {
        _badgeButten = [[CXBadgeButten alloc] init];
    }
    return _badgeButten;
}

- (UIImageView *)arrowView
{
    if (_arrowView == nil) {
        _arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"set_ic_arrow"]];
    }
    return _arrowView;
}

- (UISwitch *)switchView
{
    if (_switchView == nil) {
        _switchView = [[UISwitch alloc] init];
        _switchView.onTintColor = [UIColor colorWithRed:234/255.0 green:90/255.0 blue:137/255.0 alpha:1];
    }
    return _switchView;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        // 创建背景
//        UIImageView *backgroundImageView = [[UIImageView alloc] init];
//        self.backgroundView = backgroundImageView;
//        self.backgroundImageView = backgroundImageView;
//        
//        UIImageView *selectedBackgroundImageView = [[UIImageView alloc] init];
//        self.selectedBackgroundView = selectedBackgroundImageView;
//        self.selectedBackgroundImageView = selectedBackgroundImageView;
        
        self.textLabel.backgroundColor = [UIColor clearColor];
        self.textLabel.textColor = [UIColor colorWithWhite:49/255.0 alpha:1];
        self.textLabel.highlightedTextColor = [UIColor colorWithWhite:49/255.0 alpha:1];
        self.textLabel.font = [UIFont systemFontOfSize:14];
        
    }
    return self;
}

 // 重写frame的方法
- (void)setFrame:(CGRect)frame
{
    frame.origin.x += 1;
    frame.size.width -= frame.origin.x*2;
    [super setFrame:frame];
}

+ (CXSettingCell *)settingCell:(UITableView *)tableView
{
    // 创建cell
    static NSString *ID = @"CXSettingCell";
    CXSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[CXSettingCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
        cell.tableView = tableView;
    }
    return cell;
}

- (void)setItem:(CXSettingItem *)item
{
    _item = item;
    
    [self setUpData];
    
    [self setUpRigthView];
}

- (void)setIndexPath:(NSIndexPath *)indexPath
{

    // 设置分割线
    UIView *cuttingLineTop = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), 1)];
    cuttingLineTop.backgroundColor = [UIColor colorWithWhite:206/255.0 alpha:0.6];
    
    UIView *cuttingLineBottom = [[UIView alloc] init];
    cuttingLineBottom.frame = CGRectMake(0, CGRectGetHeight(self.frame) - 1, CGRectGetWidth(self.frame), 1);
    cuttingLineBottom.backgroundColor = cuttingLineTop.backgroundColor;
    

    UIView *cuttingLineMid = [[UIView alloc] initWithFrame:CGRectMake(10, CGRectGetHeight(self.frame) - 1, CGRectGetWidth(self.frame) - 2 * 10, 1)];
    cuttingLineMid.backgroundColor = cuttingLineTop.backgroundColor;
    
    long totalRows = [self.tableView numberOfRowsInSection:indexPath.section];

    if (indexPath.row == 0) {
        [self addSubview:cuttingLineTop];
    }
    if (indexPath.row == totalRows - 1) {
        [self addSubview:cuttingLineBottom];
    }
    if (indexPath.row < totalRows - 1) {
        [self addSubview:cuttingLineMid];
    }
}

- (void)setUpData
{
    if (self.item.icon) {
        self.imageView.image = [UIImage imageNamed:self.item.icon];
    }
    self.textLabel.text = self.item.title;
}

- (void)setUpRigthView
{
    if (self.item.badgeValue) {
        self.badgeButten.badgeValue = self.item.badgeValue;
        self.accessoryView = self.badgeButten;
    } else if ([self.item isKindOfClass:[CXSettingLabelItem class]]) {
        self.accessoryView = nil;
        
    } else if ([self.item isKindOfClass:[CXSettingSwitchItem class]]) {
        self.accessoryView = self.switchView;
    } else if ([self.item isKindOfClass:[CXSettingArrowItem class]]) {
        self.accessoryView = self.arrowView;
    } else {
       self.accessoryView = nil;
    }
}

@end
