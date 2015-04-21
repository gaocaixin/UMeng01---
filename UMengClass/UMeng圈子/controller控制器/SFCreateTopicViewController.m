//
//  SFCreateTopicViewController.m
//  SFMX
//
//  Created by qianfeng on 15/4/11.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SFCreateTopicViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define TOPIC_TITLE_HEIGHT 49
#define TOPIC_DES_HEIGHT 100
#define PHOTO_WIDTH 64
#define PHOTO_HEIGHT 64
@interface SFCreateTopicViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextViewDelegate,CLLocationManagerDelegate>
{
    UITextField * topicTitle;
    UITextView * topicDes;
    UIScrollView * scrollView;
    UIView * photoView;
    UIButton * coverBtn;
    UIView * alertView;
    UIView * locationView;
    UILabel * placeLabel;
}

@property (nonatomic,strong)NSMutableArray * photoArray;
@property (nonatomic,strong) CLLocationManager * locationManager;
@end

@implementation SFCreateTopicViewController


-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_locationManager stopUpdatingLocation];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //创建srcollView
    [self createScrollView];
    
    [self createNav];
    
    
}
-(void)createNav
{
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]initWithTitle:@"发表" style:UIBarButtonItemStyleDone target:self action:@selector(publish)];
    self.navigationController.navigationBar.tintColor= [UIColor whiteColor];
    
}

-(void)publish
{
    
}

//创建srcollView
-(void)createScrollView{
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    scrollView.backgroundColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:246/255.0];
    [self.view addSubview:scrollView];
    //创建UI
    [self createUI];
}

-(void)createUI
{
    self.photoArray = [[NSMutableArray alloc]init];
    
    //创建标题
    topicTitle = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, TOPIC_TITLE_HEIGHT)];
    topicTitle.placeholder = @"  创建话题标题";
    topicTitle.backgroundColor = [UIColor whiteColor];
    //修改placeholder的字体颜色
    [topicTitle setValue:[UIColor colorWithRed:78/255.0 green:78/255.0 blue:78/255.0 alpha:1] forKeyPath:@"_placeholderLabel.textColor"];
    [scrollView addSubview:topicTitle];
    
    //创建简介
    CGFloat topicDesY = CGRectGetMaxY(topicTitle.frame)+10;
    topicDes =[[UITextView alloc]initWithFrame:CGRectMake(0, topicDesY, SCREEN_WIDTH, TOPIC_DES_HEIGHT)];
    topicDes.textColor = [UIColor blackColor];
    
    //给UITextView 添加placeholder 的效果
    placeLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH, 30)];
    placeLabel.text = @"主题介绍";
    placeLabel.textColor = [UIColor redColor];
    placeLabel.font = [UIFont systemFontOfSize:17];
    placeLabel.enabled = NO;
    //placeLabel.textColor=[UIColor colorWithRed:78/255.0 green:78/255.0 blue:78/255.0 alpha:1];
    [topicDes addSubview:placeLabel];
    topicDes.delegate =self;
    topicDes.backgroundColor = [UIColor whiteColor];
    [scrollView addSubview:topicDes];

    //分割线
    UIView * view1 = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(topicDes.frame)+1, SCREEN_WIDTH, 1)];
    view1.backgroundColor = [UIColor colorWithRed:214/255.0 green:214/255.0 blue:214/255.0 alpha:246/255.0];
    
    
    [scrollView addSubview:view1];
    
    //创建图片View
    [self createPhotoView];
    
    //分割线
    UIView * view2 = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(photoView.frame)+1, SCREEN_WIDTH, 1)];
    view2.backgroundColor = [UIColor colorWithRed:214/255.0 green:214/255.0 blue:214/255.0 alpha:246/255.0];
    [self.view addSubview:view2];
    
    //定位
    [self createLocation];
    
}

#pragma mark - textViewDelegate

-(void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length == 0) {
        placeLabel.text = @"主题介绍";
        placeLabel.hidden = NO;
    }else{
        placeLabel.text = @"";
         placeLabel.hidden = YES;
    }
}

-(void)createPhotoView
{
    photoView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(topicDes.frame)+2 , SCREEN_WIDTH, PHOTO_HEIGHT+20)];
    photoView.backgroundColor = [UIColor whiteColor];
    
    if (self.photoArray.count==0) {
        [self addPhotoButton];
    }
    [self createPhotoButton];
    
    [scrollView addSubview:photoView];
    
}

#pragma mark -给数组添加一个button
-(void)addPhotoButton{
    UIButton * imageButton = [[UIButton alloc]init];
    [imageButton setBackgroundImage:[UIImage imageNamed:@"write_btn_addimg"] forState:UIControlStateNormal];
    [_photoArray  addObject:imageButton];

}

#pragma mark -照片布局
-(void)createPhotoButton
{
    NSArray * array =photoView.subviews;
    for(int i=0;i<array.count;i++){
        [array[i] removeFromSuperview];
    }
    int num = 4;
    CGFloat padding = (SCREEN_WIDTH-20-PHOTO_WIDTH*num)/(num-1);
    
    for (int i=0; i<self.photoArray.count; i++) {
        UIButton * btn = self.photoArray[i];
        int x= i%4;
        int y=i/4;
        btn.frame = CGRectMake(10+(PHOTO_WIDTH+padding)*x, 10*(y+1)+(PHOTO_HEIGHT+padding)*y, PHOTO_WIDTH, PHOTO_HEIGHT);
        [photoView addSubview:btn];
        //删除照片按钮
        if (![[btn backgroundImageForState:UIControlStateNormal]isEqual:[UIImage imageNamed:@"write_btn_addimg"]]) {
            UIButton * deleteButton = [[UIButton alloc]initWithFrame:CGRectMake(-10, -10, 20, 20)];
            deleteButton.layer.cornerRadius = 10;
            deleteButton.layer.masksToBounds = YES;
            [deleteButton setBackgroundImage:[UIImage imageNamed:@"write_btn_close"] forState:UIControlStateNormal];
            deleteButton.tag = 200+i;
            [deleteButton addTarget:self action:@selector(deletePhotoClick:) forControlEvents:UIControlEventTouchUpInside];
            [btn addSubview:deleteButton];

        }
        
        CGRect frame =photoView.frame;
        frame.size.height=10*(y+1)+(PHOTO_HEIGHT+padding)*(y+1);
        photoView.frame =frame;
        //重置loacationView 的位置
        [UIView animateWithDuration:0.3 animations:^{
          //  CGFloat locationY = CGRectGetMaxY(photoView.frame);
            
            locationView.frame =CGRectMake(0, CGRectGetMaxY(photoView.frame)+2, SCREEN_WIDTH, 60);

        }];
        
        scrollView.contentSize = CGSizeMake(0, CGRectGetMaxY(locationView.frame)>SCREEN_HEIGHT?CGRectGetMaxY(locationView.frame):SCREEN_HEIGHT);
        
        [btn addTarget:self action:@selector(photoClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
}

#pragma mark -删除照片
-(void)deletePhotoClick:(UIButton *)button
{
    [self.photoArray removeObjectAtIndex:button.tag-200];
    [self createPhotoButton];
    
}

#pragma mark -创建定位功能
-(void)createLocation
{
    locationView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(photoView.frame)+2, SCREEN_WIDTH, 60)];
    locationView.backgroundColor = [UIColor whiteColor];
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 30, 30)];
    imageView.image=[UIImage imageNamed:@"write_ic_location"];
    [locationView addSubview:imageView];
    //开关
    UISwitch * switchs = [[UISwitch alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-10-50, 10, 50, 20)];
    switchs.onTintColor = [UIColor colorWithRed:241/255.0 green:114/255.0 blue:155/255.0 alpha:1];
    [locationView addSubview:switchs];
    [switchs addTarget:self action:@selector(locationClick) forControlEvents:UIControlEventValueChanged];
    
    [scrollView addSubview:locationView];
    
    scrollView.contentSize =CGSizeMake(SCREEN_WIDTH, CGRectGetMaxY(locationView.frame)>SCREEN_HEIGHT?CGRectGetMaxY(locationView.frame):SCREEN_HEIGHT);

}
#pragma mark -定位开关事件
-(void)locationClick
{
        if([CLLocationManager locationServicesEnabled]) {
        self.locationManager = [[CLLocationManager alloc ]init];
        _locationManager.delegate =self;
        _locationManager.desiredAccuracy  = kCLLocationAccuracyBest;
        _locationManager.distanceFilter = 100.0f;
        [_locationManager requestAlwaysAuthorization];
        [_locationManager requestWhenInUseAuthorization];
        //启动位置更新
        [_locationManager startUpdatingLocation];
    }else{
        UIAlertView *view = [[UIAlertView alloc]initWithTitle:@"提示" message:@"定位不成功 ,请确认开启定位" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [view show];
    }
}
#pragma mark -定位代理方法
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation * location =[locations lastObject];
    //location.coordinate
    //获取当前的城市名
    CLGeocoder * geocoder = [[CLGeocoder alloc]init];
    //逆编码
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        if (placemarks.count>0) {
            CLPlacemark * placeMaker =[placemarks objectAtIndex:0];
            NSLog(@"%@",[placeMaker addressDictionary]);
            NSLog(@"%@",placeMaker.name);
            NSLog(@"%@",placeMaker.locality);
            if (!placeMaker.locality) {
                NSLog(@"%@",placeMaker.administrativeArea);
            }
            
        }
    }];
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"%@",error);
}
#pragma mark -点击弹出这罩层
-(void)photoClick:(UIButton *)button
{
    alertView = [self alertView];
    coverBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    coverBtn.backgroundColor = [UIColor blackColor];
    coverBtn.alpha=0.4;
    [coverBtn addTarget:self action:@selector(coverBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:coverBtn];
    [scrollView addSubview:alertView];
}
#pragma mark - 这是遮盖层
-(void)coverBtnClick
{
    [alertView removeFromSuperview];
    [coverBtn removeFromSuperview];
}


#pragma mark - 弹出拍照功能
-(UIView *)alertView
{
    alertView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 280, 99)];
    UIButton * cameraBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 280, 44)];
    alertView.backgroundColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:246/255.0];
    alertView.center = self.view.center;
    [cameraBtn setTitle:@"拍照" forState:UIControlStateNormal];
    cameraBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    [cameraBtn setTitleColor:[UIColor colorWithRed:49/255.0 green:49/255.0 blue:49/255.0 alpha:1] forState:UIControlStateNormal];
    [cameraBtn addTarget:self action:@selector(cameraBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [alertView addSubview:cameraBtn];
    
    
    UIView * line = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(cameraBtn.frame)+1, 280, 1)];
    line.backgroundColor = [UIColor colorWithRed:214/255.0 green:214/255.0 blue:214/255.0 alpha:246/255.0];
    [alertView addSubview:line];
    
    UIButton * selectPhotoBtn =[[UIButton alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(line.frame)+1, 280, 44)];
    [selectPhotoBtn setTitle:@"从相册选取" forState:UIControlStateNormal];
    selectPhotoBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    [selectPhotoBtn setTitleColor:[UIColor colorWithRed:49/255.0 green:49/255.0 blue:49/255.0 alpha:1] forState:UIControlStateNormal];
    [selectPhotoBtn addTarget:self action:@selector(cameraBtnClick:) forControlEvents:UIControlEventTouchUpInside];

    [alertView addSubview:selectPhotoBtn];
    
    

    return alertView;
}
#pragma mark - 拍照功能
-(void)cameraBtnClick:(UIButton *)button
{
    UIImagePickerController * pickController = [[UIImagePickerController alloc]init];
    pickController.delegate = self;
    pickController.editing = YES;
    if ([button.titleLabel.text isEqualToString:@"拍照"]) {
        if ([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront]) {
            pickController.sourceType = UIImagePickerControllerSourceTypeCamera;
        }
    }else if ([button.titleLabel.text isEqualToString:@"从相册选取"]){
        if ([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront]) {
            pickController.sourceType =UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        }
        
    }
    
    
    [self presentViewController:pickController animated:YES completion:nil];
    
}


#pragma mark -UIImagePickerController代理方法

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //读取图片
    UIImage *  image = [info objectForKey:UIImagePickerControllerOriginalImage];
    UIButton * button =[self.photoArray lastObject];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    //移除这招层
    [self coverBtnClick];
    //想数组中添加一个phototbutton
    [self addPhotoButton];
    
    [self createPhotoButton];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
