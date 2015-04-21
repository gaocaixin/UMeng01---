//
//  MessageFrame.h
//  MengXiu
//
//  Created by ChangLuyang on 15/4/10.
//  Copyright (c) 2015年 chang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "Message.h"

/**一条信息模型所对应的frame*/
@interface MessageFrame : NSObject
- (instancetype)initWithMessage:(Message *)message;
/***********************************************************/
//cell的高度
@property (nonatomic, assign) CGFloat heightOfCell;
/**
 *  每个MessageFrame模型拥有一条信息,然后让Cell拥有MessageFrame
 */
@property (nonatomic, strong) Message *message;
/***********************************************************/
//个人信息
@property (nonatomic, assign) CGRect personalView;
//头像
@property (nonatomic, assign) CGRect icon;
//昵称
@property (nonatomic, assign) CGRect nickName;
//小钟表
@property (nonatomic, assign) CGRect timePiece;
//时间
@property (nonatomic, assign) CGRect timeBefore;
//关注按钮
@property (nonatomic, assign) CGRect eyesOn;
/***********************************************************/
@property (nonatomic, assign) CGRect mainContent;
//图像
@property (nonatomic, assign) CGRect image;
//正文
@property (nonatomic, assign) CGRect contentString;
//游戏互动标签
@property (nonatomic, assign) CGRect gameActive;
//下载
@property (nonatomic, assign) CGRect download;
//装有五个CGRect的数组
@property (nonatomic, strong) NSMutableArray *btnRectArray;
/***********************************************************/
@property (nonatomic, assign) CGRect socialTools;
//点赞的小手
@property (nonatomic, assign) CGRect praise;
//点击的小手
@property (nonatomic, assign) CGRect icTap;
//头像的数组
@property (nonatomic, strong) NSMutableArray *iconsCgrectArray;
//赞的人数
@property (nonatomic, assign) CGRect numberOfPraise;
//参与互动的人数
@property (nonatomic, assign) CGRect  takePartIn;
//华丽的分割线
@property (nonatomic, assign) CGRect  spLine;
/***********************************************************/
@property (nonatomic, assign) CGRect commentsView;
//评论图标
@property (nonatomic, assign) CGRect  icComments;
@property (nonatomic, assign) CGRect  allComments;

//列举两条评论
@property (nonatomic, assign) CGRect cmtBackgroundView;
@property (nonatomic, assign) CGRect cmtBackgroundView2;
@property (nonatomic, strong) NSMutableArray *cmt1;
@property (nonatomic, strong) NSMutableArray *cmt2;
@end
