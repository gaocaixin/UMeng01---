//
//  SFMCircleDetailHeader.h
//  SFMX
//
//  Created by qianfeng on 15/4/12.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFMCircleDetailHeader : UIView
+(SFMCircleDetailHeader *)headerView;
-(void)setIconName:(NSString *)iconName titile:(NSString *)title des:(NSString *)des array:(NSArray *)array;
@end
