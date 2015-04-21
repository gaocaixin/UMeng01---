//
//  MessageFrame.m
//  MengXiu
//
//  Created by ChangLuyang on 15/4/10.
//  Copyright (c) 2015年 chang. All rights reserved.
//

#import "MessageFrame.h"
#import "UIImageView+WebCache.h"
#import "User.h"


@implementation MessageFrame
- (instancetype)initWithMessage:(Message *)message {
    if (self = [super init]) {
        _message = message;
        
        /*******************第一部分个人信息****************/
        //头像
        CGFloat iconX = 10;
        CGFloat iconY = 10;
        CGFloat iconW = 49;
        CGFloat iconH = 49;
        _icon = CGRectMake(iconX, iconY, iconW, iconH);
        
        //昵称
        UIFont *fnt = [UIFont systemFontOfSize:NickNameFont];
        CGFloat nickNameX = [self maxOfRightBound:_icon] + 10;
        CGSize nickNameSize = [message.nickName sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:fnt, NSFontAttributeName,nil]];
        //昵称的Y值计算
        CGFloat nickNameY = iconY + _icon.size.height / 2 - nickNameSize.height;
//        NSLog(@"%@", NSStringFromCGSize(nickNameSize));
//        NSLog(@"%f", nickNameY);
        _nickName = (CGRect){{ nickNameX, nickNameY}, nickNameSize};
        
        //小钟表
        CGFloat timePieceX = nickNameX;
        CGFloat timePieceY = [self maxOfBottomnBound:_nickName] + 5;
        CGFloat timePieceW = 12;
        CGFloat timePieceH = 12;
        _timePiece = CGRectMake(timePieceX, timePieceY, timePieceW, timePieceH);
        NSLog(@"%@", NSStringFromCGRect(_timePiece));
        
        //创建时间
        CGFloat timeBeforeX = [self maxOfRightBound:_timePiece] + 4;
        CGFloat timeBeforeY = [self maxOfBottomnBound:_nickName] + 5;
        CGSize timeBeforeSize = [message.timeBefore sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:TimeLabelFont], NSFontAttributeName, nil]];
        _timeBefore = (CGRect){ {timeBeforeX, timeBeforeY}, timeBeforeSize};
//        NSLog(@"%f时间标签Y值", timeBeforeY);
        
        //关注按钮,按钮的Y值设为和昵称一样
        CGFloat eyesOnW = 54;
        CGFloat eyesOnH = 23;
        CGFloat eyesOnX = kScreenWidth - 10 - eyesOnW;
        CGFloat eyesOnY = nickNameY;
        _eyesOn = CGRectMake(eyesOnX, eyesOnY, eyesOnW, eyesOnH);
        
        _personalView = CGRectMake(0, 0, kScreenWidth, 73);
        
        
        /*******************第二部分图片正文****************/
        
        //图片
        CGFloat imageX = 0;
        CGFloat imageY = 0;
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:message.imageURL]];
        UIImage *tempImage = [UIImage imageWithData:data scale:1];
        CGFloat imageW = tempImage.size.width;
        CGFloat imageH = tempImage.size.height;
        _image = CGRectMake(imageX, imageY, imageW, imageH);
        
        //正文
        CGFloat contentStringX = 10;
        CGFloat contentStringY = [self maxOfBottomnBound:_image] + 10;
        //宽度需要改变
       CGSize tempSize = [message.contentString boundingRectWithSize:CGSizeMake(kScreenWidth - 20, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:NickNameFont] forKey:NSFontAttributeName] context:nil].size;
    
        _contentString = (CGRect){ {contentStringX, contentStringY}, {kScreenWidth - 20, tempSize.height}};
        
        //游戏互动标签
        if (message.isActive) {
            CGFloat gameActiveX = kScreenWidth - 10 - 28;
            CGFloat gameActiveY = 10;
            _gameActive = CGRectMake(gameActiveX, gameActiveY, 28, 28);
        } else {
            //什么也不做或者下面这个
            _gameActive = CGRectZero;
        }
        
        //下载按钮
        CGFloat downloadX = kScreenWidth - 10 - 33;
        CGFloat downloadY = imageH - 20 - 33;
        _download = CGRectMake(downloadX, downloadY, 33, 33);
        
        
        //5个按钮
        _btnRectArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < 5; i++) {
            NSValue *value = [NSValue valueWithCGRect:CGRectMake(10 + 60 * i, imageH + 30 + _contentString.size.height, 60, 30)];
            [_btnRectArray addObject:value];
        }
        
        
        _mainContent = CGRectMake(0, 83, kScreenWidth, imageH + _contentString.size.height + 10 + 20 + 20);
        /*******************第三部分评论社交工具****************/
        //点赞小手
        CGFloat praiseX = 5;
        CGFloat praiseY = 10;
        _praise = CGRectMake(praiseX, praiseY, 15, 15);
        
        //七个头像
        _iconsCgrectArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < 7; i++) {
            NSValue *value = [NSValue valueWithCGRect:CGRectMake([self maxOfRightBound:_praise] + 8 + i * 35, 2, 28, 28)];
            [_iconsCgrectArray addObject:value];
        }
        //赞数量
        CGFloat numberOfPraiseX = kScreenWidth - 10 - 40;
        CGFloat numberOfPraiseY = 5;
        _numberOfPraise = CGRectMake(numberOfPraiseX, numberOfPraiseY, 40, 20);
        
        //点击小手
        CGFloat icTapX = praiseX;
        CGFloat icTapY = [self maxOfRightBound:_praise] + 20;
        CGFloat icTapW = 14;
        CGFloat icTapH = 18;
        _icTap = CGRectMake(icTapX, icTapY, icTapW, icTapH);
        
        //参与互动的人数
        CGFloat takePartInX = [self maxOfRightBound:_icTap] + 8;
        CGFloat takePartInY = icTapY;
        CGSize tpiSize = [message.numberOfInteraction sizeWithAttributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:NickNameFont] forKey:NSFontAttributeName]];
        
        _takePartIn = (CGRect){ {takePartInX, takePartInY}, tpiSize};
        //分割线
        CGFloat spLineX = 0;
        CGFloat spLineY = [self maxOfBottomnBound:_takePartIn] + 10;
        _spLine = CGRectMake(spLineX, spLineY, kScreenWidth, 0.5);
        
        
        _socialTools = CGRectMake(0, _personalView.size.height + _mainContent.size.height + 20, kScreenWidth, [self maxOfBottomnBound:_spLine]);
        
        /*******************评论****************/
        CGFloat btnCX = icTapX;
        CGFloat btnCY = 10;
        _icComments = CGRectMake(btnCX, btnCY, 13, 14);
        
        CGFloat allCommentsX = [self maxOfRightBound:_icComments] + 8;
        CGFloat allCommentsY = 10;
        CGSize allCommentsSize = [message.numberOfComments sizeWithAttributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:NickNameFont] forKey:NSFontAttributeName]];
        _allComments = (CGRect){{ allCommentsX, allCommentsY}, allCommentsSize};
        _commentsView = CGRectMake(0, _personalView.size.height + _mainContent.size.height + _socialTools.size.height + 20, kScreenWidth, [self maxOfBottomnBound:_allComments]);
        
        
        //两条评论
        
        //头像
        _cmt1 = [[NSMutableArray alloc] init];
        
        CGRect rectIcon1 = CGRectMake(btnCX, 20, 28, 28);
        [_cmt1 addObject:[NSValue valueWithCGRect:rectIcon1]];
        
        //昵称
        NSString *str = [NSMutableString stringWithString:[message.userArray[0] titleName]];
        str = [str stringByAppendingString:@":"];
        NSLog(@"%@", str);
        CGSize nameSize = [str sizeWithAttributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:NickNameFont] forKey:NSFontAttributeName]];
        CGRect rectName1 = (CGRect){{[self maxOfRightBound:rectIcon1] + 8, 20}, nameSize};
        [_cmt1 addObject:[NSValue valueWithCGRect:rectName1]];
        
        //评论
        NSMutableString *tempString = [NSMutableString stringWithString:[message.userArray[0] comment]];
        for (int i = 0; i < str.length; i++) {
            [tempString insertString:@"　" atIndex:0];
        }
        //计算Size
        CGSize commentSize1 = [tempString boundingRectWithSize:CGSizeMake(274, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObject:fnt forKey:NSFontAttributeName] context:nil].size;
        CGRect rectComments1 = (CGRect){{[self maxOfRightBound:rectIcon1] + 8, 20}, commentSize1};
        [_cmt1 addObject:[NSValue valueWithCGRect:rectComments1]];
        NSLog(@"%@", NSStringFromCGRect(rectComments1));
        
        //第一条评论的画布
        _cmtBackgroundView = CGRectMake(0, _personalView.size.height + _mainContent.size.height + _socialTools.size.height + _allComments.size.height + 20, kScreenWidth, rectComments1.size.height);
        
        //第二条评论
        //头像
        _cmt2 = [[NSMutableArray alloc] init];
        
        CGRect rectIcon2 = CGRectMake(btnCX, 20, 28, 28);
        [_cmt2 addObject:[NSValue valueWithCGRect:rectIcon2]];
        
        //昵称
        NSString *str2 = [NSMutableString stringWithString:[message.userArray[1] titleName]];
        str2 = [str2 stringByAppendingString:@":"];
        NSLog(@"%@", str2);
        CGSize nameSize2 = [str2 sizeWithAttributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:NickNameFont] forKey:NSFontAttributeName]];
        CGRect rectName2 = (CGRect){{[self maxOfRightBound:rectIcon2] + 8, 20}, nameSize2};
        [_cmt2 addObject:[NSValue valueWithCGRect:rectName2]];
        
        //评论
        NSMutableString *tempString2 = [NSMutableString stringWithString:[message.userArray[1] comment]];
        for (int i = 0; i < str.length; i++) {
            [tempString2 insertString:@"　" atIndex:0];
        }
        //计算Size
        CGSize commentSize2 = [tempString2 boundingRectWithSize:CGSizeMake(274, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObject:fnt forKey:NSFontAttributeName] context:nil].size;
        CGRect rectComments2 = (CGRect){{[self maxOfRightBound:rectIcon2] + 8, 20}, commentSize2};
        [_cmt2 addObject:[NSValue valueWithCGRect:rectComments2]];
        NSLog(@"%@", NSStringFromCGRect(rectComments2));
        
        //第二条评论的画布
        _cmtBackgroundView2 = CGRectMake(0, _personalView.size.height + _mainContent.size.height + _socialTools.size.height + _allComments.size.height + _cmtBackgroundView.size.height + 20 + 20, kScreenWidth, rectComments2.size.height);
        
        
        //整个cell的高度
        _heightOfCell = _personalView.size.height + _mainContent.size.height + _socialTools.size.height + _cmtBackgroundView.size.height + _cmtBackgroundView2.size.height + 80;
        
    }
    return self;
}

/**
 *  一个控件最右边的X值
 *
 *  @param rect 传入一个控件的frame
 *
 *  @return 返回这个控件最右边的X值
 */
- (CGFloat)maxOfRightBound:(CGRect)rect {
    return rect.origin.x + rect.size.width;
}
/**
 *  一个控件最下边的值
 *
 *  @param rect 传入一个控件的frame
 *
 *  @return 返回这个控件最下边的Y值
 */
- (CGFloat)maxOfBottomnBound:(CGRect)rect {
    return rect.origin.y + rect.size.height;
}
@end
