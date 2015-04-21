//
//  LYTableViewCell.m
//  MengXiu
//
//  Created by ChangLuyang on 15/4/8.
//  Copyright (c) 2015年 chang. All rights reserved.
//

#import "LYTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "User.h"
#define ColorWithRGB(r,g,b) [UIColor colorWithRed:(CGFloat)r/255 green:(CGFloat)g/255 blue:(CGFloat)b/255 alpha:1]

@interface LYTableViewCell()
{
    UIView *_personalView;
    UIView *_mainContentView;
    UIView *_otherToolsView;
    UIView *_commentsView;
}
@end

@implementation LYTableViewCell
- (instancetype)initWithMessageFrame:(MessageFrame *)frame {
    if (self = [super init]) {
        _mFrame = frame;
        // 添加个人信息部分
        [self setupPersonalInfoViewWithFrame:(MessageFrame *)frame];
        //添加信息的主体
        [self setupMainContentWithFrame:(MessageFrame *)frame];
        //添加一些其他的功能
        [self setupOtherToolsWithFrame:(MessageFrame *)frame];
        //评论
        [self setupCommentsWithFrame:(MessageFrame *)frame];
        //选中后不变色
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

/**添加个人信息部分*/
- (void)setupPersonalInfoViewWithFrame:(MessageFrame *)frame {
    _personalView = [[UIView alloc] init];
    _personalView.frame = frame.personalView;
    [self.contentView addSubview:_personalView];
    //头像
    _uiv = [[UIImageView alloc] init];
    _uiv.frame = frame.icon;
    [_uiv sd_setImageWithURL:[NSURL URLWithString:frame.message.iconURL]];
    //设置圆角
    _uiv.layer.masksToBounds = YES;
    _uiv.layer.cornerRadius = frame.icon.size.width / 2;
    [_personalView addSubview:self.uiv];
    
    //昵称
    _nickName = [[UILabel alloc] init];
    _nickName.frame = frame.nickName;
    _nickName.text = frame.message.nickName;
    _nickName.textColor = ColorWithRGB(241, 114, 155);
    _nickName.textAlignment = NSTextAlignmentLeft;
    _nickName.font = [UIFont systemFontOfSize:NickNameFont];
    [_personalView addSubview:_nickName];
    
    //小钟表
    _timePiece = [[UIImageView alloc] init];
    _timePiece.frame = frame.timePiece;
    _timePiece.image = [UIImage imageNamed:@"ic_time"];
    [_personalView addSubview:_timePiece];
    
    //创建时间
    _time = [[UILabel alloc] init];
    _time.frame = frame.timeBefore;
    _time.text = frame.message.timeBefore;
    _time.textColor = ColorWithRGB(197, 197, 197);
    _time.font = [UIFont systemFontOfSize:TimeLabelFont];
    [_personalView addSubview:_time];
    
    //关注
    _eyesOn = [[UIButton alloc] init];
    _eyesOn.frame = frame.eyesOn;
    [_eyesOn setBackgroundImage:[UIImage imageNamed:@"btn_add_attention"] forState:UIControlStateNormal];
    [_personalView addSubview:_eyesOn];
    
}

/**添加信息主体*/
- (void)setupMainContentWithFrame:(MessageFrame *)frame {
    _mainContentView = [[UIView alloc] init];
    _mainContentView.frame = frame.mainContent;
    [self.contentView addSubview:_mainContentView];
    
    //图片
    _photo = [[UIImageView alloc] init];
    _photo.frame = frame.image;
    [_photo sd_setImageWithURL:[NSURL URLWithString:frame.message.imageURL]];
    [_mainContentView addSubview:_photo];
    
    //正文
    _content =[[UILabel alloc] init];
    _content.frame = frame.contentString;
    _content.text = frame.message.contentString;
    _content.textColor = ColorWithRGB(49, 49, 49);
    _content.font = [UIFont systemFontOfSize:NickNameFont];
    _content.numberOfLines = 0;
    [_mainContentView addSubview:_content];
    
    /*******下面这两项是加载在图片之上的****/
    
    //游戏互动标签
    _tap  =[[UIButton alloc] init];
    _tap.frame = frame.gameActive;
    [_tap setBackgroundImage:[UIImage imageNamed:@"ic_gamelable"] forState:UIControlStateNormal];
    [_photo addSubview:_tap];
    
    //下载
    _download = [[UIButton alloc] init];
    _download.frame = frame.download;
    [_download setBackgroundImage:[UIImage imageNamed:@"btn_download"] forState:UIControlStateNormal];
    [_photo addSubview:_download];
    
    //五个功能按钮
    NSArray *titles = @[@"已赞",
                        @"评论",
                        @"分享",
                        @"收藏",
                        @""];
    NSArray *images = @[@"index_btn_zansel",
                        @"index_btn_comments",
                        @"index_btn_share",
                        @"index_btn_like",
                        @"index_btn_more"];
    for (int i = 0; i < 5; i++) {
        UIButton *btn = [[UIButton alloc] init];
        btn.frame = [frame.btnRectArray[i] CGRectValue];
        [btn setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        [btn setTitleColor:ColorWithRGB(78, 78, 78) forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:TimeLabelFont];
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        
        //添加到画布上
        [_mainContentView addSubview:btn];
    }
}

/**添加其他功能*/
- (void)setupOtherToolsWithFrame:(MessageFrame *)frame {
    //画布
    _otherToolsView = [[UIView alloc] init];
    _otherToolsView.frame = frame.socialTools;
    [self.contentView addSubview:_otherToolsView];
    
    //小手
    UIButton *button = [[UIButton alloc] init];
    button.frame = frame.praise;
    [button setImage:[UIImage imageNamed:@"index_ic_zan"] forState:UIControlStateNormal];
    [_otherToolsView addSubview:button];
    
    for (int i = 0; i < 7; i++) {
        UIButton *btn = [[UIButton alloc] init];
        btn.frame = [frame.iconsCgrectArray[i] CGRectValue];
        [btn setImage:[UIImage imageNamed:@"index_small_headimg"] forState:UIControlStateNormal];
        [_otherToolsView addSubview:btn];
    }
    
    //人数标签
    UILabel *countLabel = [[UILabel alloc] init];
    countLabel.frame = frame.numberOfPraise;
    countLabel.text = @"12";
    countLabel.textColor = ColorWithRGB(78, 78, 78);
    [_otherToolsView addSubview:countLabel];
    
    UIButton *icTap = [[UIButton alloc] init];
    icTap.frame = frame.icTap;
    [icTap setImage:[UIImage imageNamed:@"index_ic_gamelable"] forState:UIControlStateNormal];
    [_otherToolsView addSubview:icTap];
    
    //参与互动游戏人数
    UILabel *active = [[UILabel alloc] init];
    active.frame = frame.takePartIn;
    active.text = frame.message.numberOfInteraction;
    active.textColor = ColorWithRGB(111, 111, 111);
    active.font = [UIFont systemFontOfSize:NickNameFont];
    [_otherToolsView addSubview:active];
    
    //分割线
    UILabel *line = [[UILabel alloc] init];
    line.frame = frame.spLine;
    line.backgroundColor = ColorWithRGB(214, 214, 214);
    [_otherToolsView addSubview:line];
    
}

- (void)setupCommentsWithFrame:(MessageFrame *)frame {
    //画布
    _commentsView = [[UIView alloc] init];
    _commentsView.frame = frame.commentsView;
    [self.contentView addSubview:_commentsView];
    
    //评论小图
    UIButton *btnComments = [[UIButton alloc] init];
    btnComments.frame = frame.icComments;
    [btnComments setImage:[UIImage imageNamed:@"index_ic_comments"] forState:UIControlStateNormal];
    [_commentsView addSubview:btnComments];
    
    //所有的评论人数
    UILabel *labelComments = [[UILabel alloc] init];
    labelComments.frame = frame.allComments;
    labelComments.text = frame.message.numberOfComments;
    labelComments.textColor = ColorWithRGB(111, 111, 111);
    labelComments.font = [UIFont systemFontOfSize:NickNameFont];
    [_commentsView addSubview:labelComments];
    
    //列举的两条评论
    
    //第一条
    UIView *view1 = [[UIView alloc] init];
    view1.frame = frame.cmtBackgroundView;
    [self.contentView addSubview:view1];
    
    //头像
    UIImageView *first = [[UIImageView alloc] init];
    first.image = [UIImage imageNamed:@"index_small_headimg"];
    first.frame = [frame.cmt1[0] CGRectValue];
    [view1 addSubview:first];
    
    //昵称
    UILabel *firstLabelName = [[UILabel alloc] init];
    NSString *name1 = [frame.message.userArray[0] titleName];
    firstLabelName.text = [name1 stringByAppendingString:@":"];
    firstLabelName.textColor = ColorWithRGB(241, 114, 155);
    firstLabelName.frame = [frame.cmt1[1] CGRectValue];
    firstLabelName.font = [UIFont systemFontOfSize:NickNameFont];
    [view1 addSubview:firstLabelName];
    
    //评论
    UILabel *firstComment = [[UILabel alloc] init];
    
    NSMutableString *tempString = [NSMutableString stringWithString:[frame.message.userArray[0] comment]];
    for (int i = 0; i < firstLabelName.text.length; i++) {
        [tempString insertString:@"　" atIndex:0];
    }
    firstComment.text = tempString;
    firstComment.textColor = ColorWithRGB(49, 49, 49);
    firstComment.frame = [frame.cmt1[2] CGRectValue];
    firstComment.font = [UIFont systemFontOfSize:NickNameFont];
    firstComment.numberOfLines = 0;
    [view1 addSubview:firstComment];
    
    
    //第二条
    //第一条
    UIView *view2 = [[UIView alloc] init];
    view2.frame = frame.cmtBackgroundView2;
    [self.contentView addSubview:view2];
    
    //头像
    UIImageView *second = [[UIImageView alloc] init];
    second.image = [UIImage imageNamed:@"index_small_headimg"];
    second.frame = [frame.cmt2[0] CGRectValue];
    [view2 addSubview:second];
    
    //昵称
    UILabel *secondLabelName = [[UILabel alloc] init];
    NSString *name2 = [frame.message.userArray[1] titleName];
    secondLabelName.text = [name2 stringByAppendingString:@":"];
    secondLabelName.textColor = ColorWithRGB(241, 114, 155);
    secondLabelName.frame = [frame.cmt2[1] CGRectValue];
    secondLabelName.font = [UIFont systemFontOfSize:NickNameFont];
    [view2 addSubview:secondLabelName];
    
    //评论
    UILabel *secondComment = [[UILabel alloc] init];
    
    NSMutableString *tempString2 = [NSMutableString stringWithString:[frame.message.userArray[1] comment]];
    for (int i = 0; i < secondLabelName.text.length; i++) {
        [tempString2 insertString:@"　" atIndex:0];
    }
    secondComment.text = tempString2;
    secondComment.textColor = ColorWithRGB(49, 49, 49);
    secondComment.frame = [frame.cmt2[2] CGRectValue];
    secondComment.font = [UIFont systemFontOfSize:NickNameFont];
    secondComment.numberOfLines = 0;
    [view2 addSubview:secondComment];
}

@end
