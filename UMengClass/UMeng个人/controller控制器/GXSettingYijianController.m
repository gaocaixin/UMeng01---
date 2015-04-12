//
//  GXSettingYijianController.m
//  UMengSetting
//
//  Created by gaocaixin on 15-4-8.
//  Copyright (c) 2015年 GCX. All rights reserved.
//

#import "GXSettingYijianController.h"
#import "CXTextView.h"

@interface GXSettingYijianController () <UITextViewDelegate>

@property (nonatomic ,strong) CXTextView *textView;

@property (nonatomic ,strong) UIButton *submitBtn;

@end

@implementation GXSettingYijianController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self createTextView];
    
    [self setupSubmitButton];
}

- (void)createTextView
{
    
    // 添加
    CXTextView *textView = [[CXTextView alloc] initWithFrame:CGRectMake(0, 10, CGRectGetWidth(self.view.frame), 250)];
    textView.delegate = self;
    textView.placeholder = @"请在此输入您的意见~";
    [self.view addSubview:textView];
    self.textView = textView;
    self.textView.alwaysBounceVertical = NO;
    // 通知监听文字改变
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewTextDidChangeNotification) name:UITextViewTextDidChangeNotification object:self.textView];
    
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.textView.frame), CGRectGetWidth(self.view.frame), 2)];
    view.backgroundColor = [UIColor colorWithWhite:239/255.0 alpha:1];
    [self.view addSubview:view];
    
}

// 监听文字改变
- (void)textViewTextDidChangeNotification
{
    BOOL hasWord = self.textView.text.length != 0;
    self.navigationItem.rightBarButtonItem.enabled = hasWord;
    self.textView.placeholder = hasWord ? @"" : @"请在此输入您的意见~";
}


- (void)setupSubmitButton
{
    // 按钮
    UIButton *submitButton = [[UIButton alloc] init];
    
    CGFloat logoutW = 250;
    CGFloat logoutX = (CGRectGetWidth(self.view.frame) - logoutW)/2;
    CGFloat logoutY = CGRectGetMaxY(self.textView.frame) + 20;
    CGFloat logoutH = 40;
    submitButton.frame = CGRectMake(logoutX, logoutY, logoutW, logoutH);
    
    // 背景和文字
    [submitButton setBackgroundImage:[UIImage resizedImageWithName:@"set_btnbg"] forState:UIControlStateNormal];
    [submitButton setBackgroundImage:[UIImage resizedImageWithName:@"set_btnbg"] forState:UIControlStateHighlighted];
    [submitButton setTitle:@"提交意见" forState:UIControlStateNormal];
    submitButton.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    [submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self.view addSubview:submitButton];
    self.submitBtn = submitButton;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
