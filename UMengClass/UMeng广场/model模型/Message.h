//
//  Message.h
//  MengXiu
//
//  Created by ChangLuyang on 15/4/9.
//  Copyright (c) 2015年 chang. All rights reserved.
//

#import <Foundation/Foundation.h>


/**一条信息的模型*/

@interface Message : NSObject
//头像的URL
@property (nonatomic, copy) NSString *iconURL;
//昵称
@property (nonatomic, copy) NSString *nickName;
//时间
@property (nonatomic, copy) NSString *timeBefore;
//是否被关注
@property (nonatomic, assign, getter=isAttracted) BOOL attracted;
/***********************************************************/
//图像的URL
@property (nonatomic, copy) NSString *imageURL;
//信息的正文
@property (nonatomic, copy) NSString *contentString;
//是否设置游戏互动标签
@property (nonatomic, assign, getter=isActive) BOOL active;
/***********************************************************/
//点赞的人数
@property (nonatomic, assign) NSInteger numberOfPraise;
//参与互动的人数
@property (nonatomic, copy) NSString *numberOfInteraction;
//评论的条数
@property (nonatomic, copy) NSString *numberOfComments;

//装评论的数组
@property (nonatomic, strong) NSMutableArray *userArray;


@end
