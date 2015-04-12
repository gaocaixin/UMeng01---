//
//  CXMineTableViewController.m
//  CXWeibo
//
//  Created by mac on 15-2-5.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CXMineTableViewController.h"
#import "CXSettingArrowItem.h"
#import "CXSettingGroupItem.h"
#import "CXSettingBtnController.h"
#import "GXPersonSelBtn.h"

#define M_PIANYI 8

#define WIDTH CGRectGetWidth(self.view.frame)

@interface CXMineTableViewController ()

@property (nonatomic ,weak) GXPersonSelBtn *tempBtn;

@end


@implementation CXMineTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setUpNav];
    
    [self createBgView];
    
    
}

- (void)createBgView
{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:[self createView]];
}

- (UIView *)createView
{
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 250+44)];
    [self.view addSubview:bgView];
    
    [bgView addSubview:[self createIconView]];
    
    [bgView addSubview:[self createSelectView]];
    return bgView;
}

- (UIView *)createSelectView
{
    UIView *btnView = [[UIView alloc] initWithFrame:CGRectMake(0, 500/2, WIDTH, 88/2)];
//    btnView.backgroundColor = [UIColor redColor];
    
    NSArray *arr = @[@"mine_btn_photo", @"mine_btn_files", @"mine_btn_lable", @"mine_btn_star"];
    
    CGFloat btnW = 73;
    CGFloat interval = (WIDTH - 2*60/2 - 4*73) / (arr.count-1);
    for (int i = 0; i < arr.count; i++) {
        CGFloat X = 60/2 + i * (btnW + interval);
        GXPersonSelBtn *btn = [[GXPersonSelBtn alloc] initWithFrame:CGRectMake(X, 0, btnW, CGRectGetHeight(btnView.frame))];
        
        // 设置图片
        [btn setImage:[UIImage imageNamed:arr[i]] forState:UIControlStateNormal];
        NSString *selImageName = [arr[i] stringByAppendingString:@"sel"];
        [btn setImage:[UIImage imageNamed:selImageName] forState:UIControlStateSelected];
        [btn setBackgroundImage:[UIImage imageNamed:@"mine_selbar"] forState:UIControlStateSelected];
        
        [btnView addSubview:btn];
        
        [btn addTarget:self action:@selector(selectViewBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return btnView;
}

- (void)selectViewBtnClick:(GXPersonSelBtn *)btn
{
    if (self.tempBtn != btn) {
        self.tempBtn.selected = NO;
        btn.selected = YES;
        self.tempBtn = btn;
    }

}

- (UIView *)createIconView
{
    UIView *IconView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 250)];
    IconView.backgroundColor = [UIColor colorWithRed:234/255.0 green:90/255.0 blue:137/255.0 alpha:1];
    
    CGFloat iconbgViewW = 160/2;
    CGFloat iconbgViewH = 160/2;
    CGFloat iconbgViewX = (CGRectGetWidth(self.view.frame)-iconbgViewW)/2;
    CGFloat iconbgViewY = (44+88)/2;
    UIView *iconbgView = [[UIView alloc] initWithFrame:CGRectMake(iconbgViewX, iconbgViewY, iconbgViewW, iconbgViewH)];
    iconbgView.backgroundColor = [UIColor whiteColor];
    iconbgView.layer.cornerRadius = iconbgViewW/2;
    [IconView addSubview:iconbgView];
    
    CGFloat iconImageViewW = 152/2;
    CGFloat iconImageViewH = 152/2;
    CGFloat iconImageViewX = (160-152)/2/2 + iconbgViewX;
    CGFloat iconImageViewY = (160-152)/2/2 + iconbgViewY;
    UIImageView *iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(iconImageViewX, iconImageViewY, iconImageViewW, iconImageViewH)];
    iconImageView.layer.cornerRadius = iconImageViewW/2;
    iconImageView.backgroundColor = [UIColor colorWithWhite:100/255.0 alpha:0.5];
    [IconView addSubview:iconImageView];
    
    
    CGFloat imageViewMW = 16;
    CGFloat imageViewMH = 16;
    CGFloat imageViewMX = iconImageViewX - M_PIANYI;
    CGFloat imageViewMY = CGRectGetMaxY(iconImageView.frame)+16/2;
    UIImageView *imageViewM = [[UIImageView alloc] initWithFrame:CGRectMake(imageViewMX, imageViewMY, imageViewMW, imageViewMH)];
    imageViewM.image = [UIImage imageNamed:@"mine_ic_mjf"];
    [IconView addSubview:imageViewM];
    
    
    CGFloat numLabelW = 50;
    CGFloat numLabelH = 16;
    CGFloat numLabelX = CGRectGetMaxX(imageViewM.frame) + 10/2;
    CGFloat numLabelY = imageViewMY;
    UILabel *numLabel = [[UILabel alloc] initWithFrame:CGRectMake(numLabelX, numLabelY, numLabelW, numLabelH)];
    numLabel.text = @"120";
    numLabel.textColor = [UIColor whiteColor];
    numLabel.font = [UIFont systemFontOfSize:11];
    [IconView addSubview:numLabel];
    
    CGFloat levelImageViewW = 34;
    CGFloat levelImageViewH = 16;
    CGFloat levelImageViewX = CGRectGetMaxX(iconImageView.frame)-levelImageViewW + M_PIANYI;
    CGFloat levelImageViewY = numLabelY;
    UIImageView * levelImageView = [[UIImageView alloc] initWithFrame:CGRectMake(levelImageViewX, levelImageViewY, levelImageViewW, levelImageViewH)];
    levelImageView.image = [UIImage imageNamed:@"mine_lvbg"];
    [IconView addSubview:levelImageView];
    
    UILabel *levelLabel = [[UILabel alloc] initWithFrame:levelImageView.bounds];
    levelLabel.textColor = [UIColor whiteColor];
    levelLabel.font = [UIFont systemFontOfSize:10];
    levelLabel.textAlignment = NSTextAlignmentCenter;
    levelLabel.text = @"lv1";
    [levelImageView addSubview:levelLabel];
    
    
    CGFloat divisionImageViewW = 1;
    CGFloat divisionImageViewH = 15;
    CGFloat divisionImageViewX = CGRectGetMidX(IconView.frame)-1;
    CGFloat divisionImageViewY = CGRectGetMaxY(imageViewM.frame)+22/2;
    UIImageView *divisionImageView = [[UIImageView alloc] initWithFrame:CGRectMake(divisionImageViewX, divisionImageViewY, divisionImageViewW, divisionImageViewH)];
    divisionImageView.image = [UIImage imageNamed:@"mine_vrbar"];
    [IconView addSubview:divisionImageView];
    
    
    CGFloat sexImageViewW = 14;
    CGFloat sexImageViewH = 14;
    CGFloat sexImageViewX = divisionImageViewX-50;
    CGFloat sexImageViewY = divisionImageViewY;
    UIImageView *sexImageView = [[UIImageView alloc] initWithFrame:CGRectMake(sexImageViewX, sexImageViewY, sexImageViewW, sexImageViewH)];
    sexImageView.image = [UIImage imageNamed:@"mine_ic_male"];
    [IconView addSubview:sexImageView];
    
    CGFloat sexLabelW = 40;
    CGFloat sexLabelH = sexImageViewH;
    CGFloat sexLabelX = CGRectGetMaxX(sexImageView.frame) + 10/2;
    CGFloat sexLabelY = divisionImageViewY;
    UILabel *sexLabel = [[UILabel alloc] initWithFrame:CGRectMake(sexLabelX, sexLabelY, sexLabelW, sexLabelH)];
    sexLabel.text = @"保密";
    sexLabel.textColor = [UIColor colorWithRed:252/255.0 green:227/255.0 blue:235/255.0 alpha:1];
    sexLabel.font = [UIFont systemFontOfSize:11];
    [IconView addSubview:sexLabel];
    
    
    CGFloat locationImageViewW = 14;
    CGFloat locationImageViewH = 14;
    CGFloat locationImageViewX = divisionImageViewX + 10;
    CGFloat locationImageViewY = divisionImageViewY;
    UIImageView *locationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(locationImageViewX, locationImageViewY, locationImageViewW, locationImageViewH)];
    locationImageView.image = [UIImage imageNamed:@"mine_ic_location"];
    [IconView addSubview:locationImageView];
    
    CGFloat locationLabelW = 40;
    CGFloat locationLabelH = sexImageViewH;
    CGFloat locationLabelX = CGRectGetMaxX(locationImageView.frame) + 10/2;
    CGFloat locationLabelY = divisionImageViewY;
    UILabel *locationLabel = [[UILabel alloc] initWithFrame:CGRectMake(locationLabelX, locationLabelY, locationLabelW, locationLabelH)];
    locationLabel.text = @"保密";
    locationLabel.textColor = [UIColor colorWithRed:252/255.0 green:227/255.0 blue:235/255.0 alpha:1];
    locationLabel.font = [UIFont systemFontOfSize:11];
    [IconView addSubview:locationLabel];
    
    
    [IconView addSubview:[self createIconViewBtnView]];
    
    return IconView;
}

- (UIView *)createIconViewBtnView
{
    UIView *btnView = [[UIView alloc] initWithFrame:CGRectMake(0, (500-80) / 2, CGRectGetWidth(self.view.frame), 80 / 2)];
    btnView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.1];
    
    NSArray *arr = @[@"照片", @"关注", @"粉丝", @"被赞"];
    
    CGSize size1 = [arr[0] sizeWithFont:[UIFont systemFontOfSize:10]];
    CGFloat interval = (WIDTH - 130/2*2 - size1.width * arr.count) / (arr.count - 1);
    
    for (int i = 0; i < arr.count; i++) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:10];
        label.textColor = [UIColor whiteColor];
        label.text = arr[i];
        
        CGSize size = [label.text sizeWithFont:label.font];
        CGFloat W = size.width;
        CGFloat H = CGRectGetHeight(btnView.frame) / 2;
        CGFloat X = 130/2 + i * (interval + W);
        CGFloat Y = CGRectGetHeight(btnView.frame) / 2;
        label.frame = CGRectMake(X, Y, W, H);
        
        [btnView addSubview:label];
        
        UILabel *dataLabel = [[UILabel alloc] init];
        dataLabel.font = [UIFont systemFontOfSize:12];
        dataLabel.textColor = [UIColor whiteColor];
        dataLabel.text = @"424242";
        dataLabel.textAlignment = NSTextAlignmentCenter;
        
        CGFloat dataLabelW = 60;
        CGFloat dataLabelH = CGRectGetHeight(btnView.frame) / 2;
        CGFloat dataLabelX = CGRectGetMidX(label.frame) - dataLabelW / 2;
        CGFloat dataLabelY = 0;
        dataLabel.frame = CGRectMake(dataLabelX, dataLabelY, dataLabelW, dataLabelH);
        
        [btnView addSubview:dataLabel];
    }
    
    return btnView;
}

- (void)setUpNav
{
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [btn setImage:[UIImage imageNamed:@"title_btn_setting"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(settingBarButtonItem:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    self.navigationItem.title = @"昵称";

}

- (void)settingBarButtonItem:(UIBarButtonItem *)item
{
    [self.navigationController pushViewController:[[CXSettingBtnController alloc] init] animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar.subviews[0] setHidden:YES];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController.navigationBar.subviews[0] setHidden:NO];
}

@end


