//
//  CXBadgeButten.m
//  CXWeibo
//
//  Created by gaocaixin on 15-3-26.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CXBadgeButten.h"

@implementation CXBadgeButten

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.hidden = YES;
        self.userInteractionEnabled = NO;
        [self setBackgroundImage:[UIImage imageWithName:@"main_badge"] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:11];
//        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (void)setBadgeValue:(NSString *)badgeValue
{
    _badgeValue = [badgeValue copy];
    
    if (badgeValue.length != 0 && [badgeValue intValue] != 0) {
        self.hidden = NO;
        
        [self setTitle:badgeValue forState:UIControlStateNormal];
        
        CGRect frame = self.frame;
        CGSize imageSize = self.currentBackgroundImage.size;
        if (badgeValue.length > 1) {
            CGSize badgeSize = [badgeValue sizeWithFont:self.titleLabel.font];
            imageSize.width = badgeSize.width + 10;
        }
        frame.size.width = imageSize.width;
        frame.size.height = imageSize.height;
        self.frame = frame;
    } else {
        self.hidden = YES;
    }
}

@end
