//
//  PhotoDisposalController.h
//  UMeng01
//
//  Created by gaocaixin on 15/4/12.
//  Copyright (c) 2015年 GCX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface PhotoDisposalController : UIViewController

@property (nonatomic ,assign)  ALAsset *asset;

@property (nonatomic, assign) NSUInteger selectIndex;

@end
