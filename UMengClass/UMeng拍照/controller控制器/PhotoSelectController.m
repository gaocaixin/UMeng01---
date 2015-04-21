//
//  PhotoSelectController.m
//  UMeng01
//
//  Created by gaocaixin on 15/4/12.
//  Copyright (c) 2015年 GCX. All rights reserved.
//

#import "PhotoSelectController.h"
#import "PhotoDisposalController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "PhotoImageView.h"

#define IMAGEVIEW_COUNT 3
#define IMAGEVIEW_WIDTH 99
#define IMAGEVIEW_INTERVAL (CGW(self.view.frame) - IMAGEVIEW_COUNT * IMAGEVIEW_WIDTH)/(IMAGEVIEW_COUNT + 1)

@interface PhotoSelectController ()
@property (nonatomic ,strong) NSMutableArray *imagesGroup;
@property (nonatomic ,weak) UIScrollView *scrollView;
@property (nonatomic ,weak) PhotoImageView *tempPhoto;
@property (nonatomic, assign) NSUInteger currentSelect;
@property (nonatomic ,weak) UIView *photosView;
@end

@implementation PhotoSelectController

- (instancetype)init
{
    if (self = [super init]) {
        self.currentSelect = 0;
        self.tempPhoto = nil;
        self.photosView = nil;
        self.scrollView = nil;
    }
    return self;
}

- (NSMutableArray *)imagesGroup
{
    if (_imagesGroup == nil) {
        _imagesGroup = [[NSMutableArray alloc] init];
    }
    return _imagesGroup;
}

- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithWhite:234/255.0 alpha:1];
    
    [self setUpNav];
    
    [self createPhotosView];
    
    [self createImagesGroup];
    
    
}

- (void)createImagesGroup
{
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    
    [library enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        if (group != nil) {
            [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
                if (result) {
                    [self.imagesGroup addObject:result];
                    [self refreshViewWithIndex:index];
                }

                
            }];
        }
    } failureBlock:^(NSError *error) {
    
    }];
}

- (void)createPhotosView
{
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView = scroll;
    [self.view addSubview:scroll];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGW(self.view.frame), IMAGEVIEW_WIDTH + 2*IMAGEVIEW_INTERVAL)];
    view.backgroundColor = [UIColor whiteColor];
    [scroll addSubview:view];
    self.photosView = view;
    
    UIImageView *camera = [[UIImageView alloc] initWithFrame:CGRectMake(IMAGEVIEW_INTERVAL, IMAGEVIEW_INTERVAL, IMAGEVIEW_WIDTH, IMAGEVIEW_WIDTH)];
    camera.image = [UIImage imageNamed:@"selimg_btn_cambg"];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cameraTap:)];
    [camera addGestureRecognizer:tap];
    camera.userInteractionEnabled = YES;
    [self.photosView addSubview:camera];
}

- (void)cameraTap:(UITapGestureRecognizer *)tap
{
    NSLog(@"412");
}

- (void)refreshViewWithIndex:(NSUInteger)index
{
    
    PhotoImageView *imageView = [[PhotoImageView alloc] init];
    CGFloat imageX = (index+1)%3 * (IMAGEVIEW_WIDTH + IMAGEVIEW_INTERVAL) + IMAGEVIEW_INTERVAL;
    CGFloat imageY = (index+1)/3 * (IMAGEVIEW_WIDTH + IMAGEVIEW_INTERVAL) + IMAGEVIEW_INTERVAL;
    imageView.frame = CGRectMake(imageX, imageY, IMAGEVIEW_WIDTH, IMAGEVIEW_WIDTH);
    imageView.tag = index;
    if (self.imagesGroup[index]) {
        ALAsset *result = self.imagesGroup[index];
        CGImageRef imageRef = [result aspectRatioThumbnail];
        imageView.image = [UIImage imageWithCGImage:imageRef];
        
//        ALAssetRepresentation *represent = [result defaultRepresentation];
//        CGImageRef imageRtf = [represent fullScreenImage];
//        UIImage *image = [UIImage imageWithCGImage:imageRtf];
//        imageView.image = image;
    }
    [self.photosView addSubview:imageView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(photoImageViewClick:)];
    [imageView addGestureRecognizer:tap];
    
    [self refreshView];
}

- (void)photoImageViewClick:(UITapGestureRecognizer *)tap
{
    self.tempPhoto.isSelect = NO;
    PhotoImageView *photoView = (PhotoImageView *)tap.view;
    photoView.isSelect = YES;
    self.tempPhoto = photoView;
    
    self.currentSelect = photoView.tag;
    NSLog(@"%d", self.currentSelect);
    NSLog(@"%@", self.imagesGroup);
}

- (void)refreshView
{
    CGRect rect = self.photosView.frame;
    rect.size.height = ((self.imagesGroup.count)/3+1)*(IMAGEVIEW_INTERVAL+IMAGEVIEW_WIDTH) + IMAGEVIEW_INTERVAL;
    self.photosView.frame = rect;
    
    self.scrollView.contentSize = self.photosView.frame.size;
}

- (void)setUpNav
{
    self.navigationItem.title = @"相册";
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    btn.backgroundColor = [UIColor clearColor];
    [btn setTitle:@"下一步" forState:UIControlStateNormal];
#pragma mark TitleColor
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
}

- (void)btnClick:(UIButton *)btn
{
//    ALAsset *result = self.imagesGroup[self.currentSelect];
//    ALAssetRepresentation *represent = [result defaultRepresentation];
//    CGImageRef imageRtf = [represent fullScreenImage];
//    NSLog(@"%@", represent);
//    CGImageRef imageRtf = [result thumbnail];
    
    PhotoDisposalController *photoVC = [[PhotoDisposalController alloc] init];
//    photoVC.asset = result;
    photoVC.selectIndex = self.currentSelect;
    [self.navigationController pushViewController:photoVC animated:YES];
}



@end
