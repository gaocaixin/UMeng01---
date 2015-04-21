//
//  PhotoDisposalController.m
//  UMeng01
//
//  Created by gaocaixin on 15/4/12.
//  Copyright (c) 2015年 GCX. All rights reserved.
//

#import "PhotoDisposalController.h"
#import "NLImageCropperView.h"
#import "PhotoFilterController.h"

#define IMAGEVIEW_INTERVAL 10

@interface PhotoDisposalController ()

@property (nonatomic ,weak) UIImageView *photoView;

@property (nonatomic ,weak) NLImageCropperView *editorView;

@end

@implementation PhotoDisposalController

- (instancetype)init
{
    if (self = [super init]) {

        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    [self createPhotoView];
    
    [self loadPhoto];
    
    [self createItem];
}

- (void)createItem
{
    UIButton *sure = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    [sure setTitle:@"确定" forState:UIControlStateNormal];
    [sure addTarget:self action:@selector(sureClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:sure];
}

- (void)sureClick
{
    PhotoFilterController *filter = [[PhotoFilterController alloc] init];
    [self.navigationController pushViewController:filter animated:YES];
}

- (void)loadPhoto
{
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    
    [library enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
            if (result && index == self.selectIndex) {
                self.asset = result;
                *stop = YES;
                
                ALAssetRepresentation *represent = [self.asset defaultRepresentation];
                CGImageRef imageRef = [represent fullResolutionImage];
                UIImage *image = [UIImage imageWithCGImage:imageRef];
                [self.editorView setImage:image];
            }
        }];
    } failureBlock:^(NSError *error) {
        
    }];
    
//    CGImageRef imageRef = [self.asset thumbnail];
//    UIImage *image = [UIImage imageWithCGImage:imageRef];
//    [self.editorView setImage:image];
    
}

- (void)createPhotoView
{
    NLImageCropperView *imageView = [[NLImageCropperView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:imageView];
    self.editorView = imageView;
    self.editorView.backgroundColor = [UIColor redColor];
    [self.editorView setCropRegionRect:CGRectMake(0, 0, 300, 300)];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
