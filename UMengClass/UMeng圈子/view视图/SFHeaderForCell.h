//
//  SFHeaderForCell.h
//  SFMX
//
//  Created by qianfeng on 15/4/10.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFHeaderForCell : UIView
@property (copy,nonatomic)NSString * text;
@property (copy,nonatomic)NSString * name;

-(instancetype)initWithFrame:(CGRect)frame;
@end
