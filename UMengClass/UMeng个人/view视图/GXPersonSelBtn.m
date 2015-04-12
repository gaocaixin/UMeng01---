//
//  GXPersonSelBtn.m
//  UMengSetting
//
//  Created by gaocaixin on 15-4-10.
//  Copyright (c) 2015年 GCX. All rights reserved.
//

#import "GXPersonSelBtn.h"

@implementation GXPersonSelBtn

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted
{}

- (CGRect)backgroundRectForBounds:(CGRect)bounds
{
    return CGRectMake(0, CGRectGetHeight(bounds) - 2, CGRectGetWidth(bounds), 2);
}


@end
