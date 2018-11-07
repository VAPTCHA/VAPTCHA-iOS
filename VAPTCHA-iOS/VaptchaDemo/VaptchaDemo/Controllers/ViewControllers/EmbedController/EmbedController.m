//
//  EmbedController.m
//  VaptchaSDKDevelop
//
//  Created by guoshikeji_a on 2018/10/29.
//  Copyright © 2018年 guoshikeji. All rights reserved.
//

#import "EmbedController.h"

#import "VPInputView.h"
#import "VPEnabledButton.h"

#import <VaptchaSDK/VaptchaSDK.h>

@interface EmbedController () <VPEmbedManagerDelegate>

@property (nonatomic, strong) VPEmbedManager *embedManager;

#pragma mark - customView

/**
 *titleLabel
 */
@property (nonatomic, strong) UILabel *titleLabel;

/**
 *accountView
 */
@property (nonatomic, strong) VPInputView *accountView;

/**
 *passwordView
 */
@property (nonatomic, strong) VPInputView *passwordView;

/**
 *loginButton
 */
@property (nonatomic, strong) VPEnabledButton *loginButton;

@end

@implementation EmbedController

- (VPEmbedManager *)embedManager {
    if (!_embedManager) {
        _embedManager = [VPEmbedManager new];
        _embedManager.delegate = self;
    }
    return _embedManager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //
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
    self.titleLabel.text = @"示例：防注册机、防暴力破解";
    //
    self.accountView = [VPInputView new];
    self.accountView.imageV.image = [UIImage imageNamed:@"用户"];
    self.accountView.inputTF.text = @"vaptcha@wlinno.com";
    self.accountView.inputTF.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    [self.contentView addSubview:self.accountView];
    [self.accountView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(padding);
        make.centerX.mas_equalTo(self.contentView);
        make.size.mas_equalTo(defaultSize);
    }];
    //
    self.passwordView = [VPInputView new];
    self.passwordView.imageV.image = [UIImage imageNamed:@"钥匙"];
    self.passwordView.inputTF.secureTextEntry = true;
    self.passwordView.inputTF.text = @"12345678";
    self.passwordView.inputTF.font = [UIFont systemFontOfSize:20 weight:UIFontWeightBold];
    [self.contentView addSubview:self.passwordView];
    [self.passwordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.accountView.mas_bottom).offset(padding);
        make.centerX.mas_equalTo(self.contentView);
        make.size.mas_equalTo(defaultSize);
    }];
    //
    [self.contentView addSubview:self.embedManager.embedView];
    CGFloat width = defaultSize.width;
    CGFloat percentage = [VPEmbedManager embedViewWidthHeightPercentage];
    [self.embedManager.embedView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passwordView.mas_bottom).offset(padding);
        make.centerX.mas_equalTo(self.contentView);
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(self.embedManager.embedView.mas_width).multipliedBy(1/percentage);
    }];
    //
    self.loginButton = [VPEnabledButton new];
    [self.loginButton setTitle:@"登 录" forState:UIControlStateNormal];
    self.loginButton.layer.cornerRadius = 2;
    self.loginButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.loginButton.layer.borderWidth = 0.5;
    self.loginButton.titleLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightRegular];
    [self.contentView addSubview:self.loginButton];
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.embedManager.embedView.mas_bottom).offset(padding);
        make.centerX.mas_equalTo(self.contentView);
        make.size.mas_equalTo(defaultSize);
    }];
    self.loginButton.enabled = false;
    [self.loginButton addTarget:self action:@selector(loginButtonDidClickedAction) forControlEvents:UIControlEventTouchUpInside];
    //
    [self.resetButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.loginButton.mas_bottom).offset(padding);
        make.centerX.mas_equalTo(self.contentView);
        make.size.mas_equalTo(defaultSize);
    }];
    //
    [self.view layoutIfNeeded];
    [self setContentViewOffsetWithMaxHeight:CGRectGetMaxY(self.resetButton.frame)+padding];
}


#pragma mark - orientChange:
- (void)orientChange:(NSNotification *)noti {
    [self.view layoutIfNeeded];
    [self setContentViewOffsetWithMaxHeight:CGRectGetMaxY(self.resetButton.frame)+VPCustomViewPadding];
}

- (void)resetButtonDidClickedAction {
    self.loginButton.enabled = false;
    [self.embedManager reset];
}

#pragma mark - VPEmbedManagerDelegate
- (void)embedManagerVerifyPassedWithToken:(NSString *)token {
    [self showToken:token];
    //
    self.loginButton.enabled = true;
}



#pragma mark - loginButtonDidClickedAction
- (void)loginButtonDidClickedAction {
    [self resetButtonDidClickedAction];
}

@end
