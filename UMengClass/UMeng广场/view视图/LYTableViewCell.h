//
//  LYTableViewCell.h
//  MengXiu
//
//  Created by ChangLuyang on 15/4/8.
//  Copyright (c) 2015年 chang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageFrame.h"

@protocol UITableViewCellDelegate <NSObject>

- (void)eyesOnClicked:(UIButton *)button;
- (void)downloadClicked:(UIButton *)button;
- (void)TapClicked:(UIButton *)button;
- (void)smallButtonClicked:(UIButton *)button;

@end

@interface LYTableViewCell : UITableViewCell
- (instancetype)initWithMessageFrame:(MessageFrame *)frame;
/**
 *  一个cell应该包含一个Frame数据模型,然后根据数据计算各个空间的大小和cell的高度
 */

@property (nonatomic, strong) MessageFrame *mFrame;

@property (nonatomic, strong) UIImageView *uiv;
@property (nonatomic, strong) UILabel *nickName;
@property (nonatomic, strong) UIImageView *timePiece;
@property (nonatomic, strong) UILabel *time;
@property (nonatomic, strong) UIButton *eyesOn;
@property (nonatomic, strong) UIImageView *photo;
@property (nonatomic, strong) UILabel *content;
@property (nonatomic, strong) UIButton *tap;
@property (nonatomic, strong) UIButton *download;


@property id<UITableViewCellDelegate> delegate;
@end
