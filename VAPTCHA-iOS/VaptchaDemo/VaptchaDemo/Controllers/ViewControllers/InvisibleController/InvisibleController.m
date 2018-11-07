//
//  InvisibleController.m
//  VaptchaSDKDevelop
//
//  Created by guoshikeji_a on 2018/10/29.
//  Copyright © 2018年 guoshikeji. All rights reserved.
//

#import "InvisibleController.h"

#import <VaptchaSDK/VaptchaSDK.h>

#import "VPEnabledButton.h"

@interface InvisibleController () <VPInvisibleDelegate>

/**
 *VPInvisibleManager
 */
@property (nonatomic, strong) VPInvisibleManager *manager;

#pragma mark - customView

/**
 *titleLabel
 */
@property (nonatomic, strong) UILabel *titleLabel;

/**
 *textView
 */
@property (nonatomic, strong) UITextView *textView;

@property (nonatomic, strong) VPInvisibleSubmitButton *invisibleButton;


@end

@implementation InvisibleController

- (VPInvisibleManager *)manager {
    if (!_manager) {
        _manager = [[VPInvisibleManager alloc] init];
        _manager.delegate = self;
    }
    return _manager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setupSubviews {
    CGFloat padding = VPCustomViewPadding;
    CGSize defaultSize = [self viewDefaultSize];
    //
    self.titleLabel = [UILabel new];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.font = [UIFont systemFontOfSize:17 weight:UIFontWeightBold];
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(padding);
        make.centerX.mas_equalTo(self.contentView);
        make.width.mas_lessThanOrEqualTo(defaultSize.width);
    }];
    self.titleLabel.text = @"示例：防灌水";
    //
    NSString *text = @"隐藏模式下，人机验证过程将合并到正常的业务流程中，本示例中点击提交按钮的同时进行人机验证。点击式和隐藏式均支持智能检测，一键通过，通过高级设置可以隐藏检测动画，安全等级评估较高的客户端甚至感觉不到VAPTCHA的存在...";
    self.textView = [UITextView new];
    self.textView.layer.cornerRadius = 2.0;
    self.textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.textView.layer.borderWidth = 0.5;
    self.textView.textColor = [UIColor darkGrayColor];
    self.textView.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    self.textView.text = text;
    [self.contentView addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(padding);
        make.centerX.mas_equalTo(self.contentView);
        make.width.mas_equalTo(defaultSize.width);
        make.height.mas_equalTo(130.0);
    }];
    
    //
    padding += 10.0;
    self.invisibleButton = [VPInvisibleSubmitButton new];
    [self.invisibleButton setTitle:@"提交" forState:UIControlStateNormal];
    [self.invisibleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.invisibleButton.layer.cornerRadius = 2.0;
    self.invisibleButton.titleLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightRegular];
    self.invisibleButton.backgroundColor = [UIColor colorWithRed:40.0/255.0 green:193.0/255.0 blue:247.0/255.0 alpha:1];
    [self.view addSubview:self.invisibleButton];
    [self.invisibleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.textView.mas_bottom).offset(padding);
        make.right.mas_equalTo(self.textView);
        make.width.mas_equalTo(100.0);
        make.height.mas_equalTo(defaultSize.height);
    }];
    [self.invisibleButton addTarget:self action:@selector(invisibleButtonDidClickedAction) forControlEvents:UIControlEventTouchUpInside];
    //
    UILabel *captionLabel = [UILabel new];
    captionLabel.font = [UIFont systemFontOfSize:13 weight:UIFontWeightRegular];
    captionLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:captionLabel];
    [captionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.textView);
        make.centerY.mas_equalTo(self.invisibleButton);
    }];
    //
    captionLabel.text = @"还可以输入 45字";
    
    //
    [self.resetButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.invisibleButton.mas_bottom).offset(padding);
        make.centerX.mas_equalTo(self.contentView);
        make.size.mas_equalTo(defaultSize);
    }];
}



- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //
    [self.manager reset];
}

- (void)resetButtonDidClickedAction {
    [self.view endEditing:true];
    self.invisibleButton.enabled = true;
    [self.manager reset];
}

#pragma mark - invisibleButtonDidClickedAction
- (void)invisibleButtonDidClickedAction {
    [self.view endEditing:true];
    [self.manager startInsivible];
}


#pragma mark - VPInvisibleDelegate
- (void)invisibleVerifyPassedWithToken:(NSString *)token {
    self.invisibleButton.enabled = false;
    [self showToken:token];
}
- (void)invisibleVerifyFailedWithError:(NSError *)error {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:error.domain preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:true completion:nil];
}


@end
