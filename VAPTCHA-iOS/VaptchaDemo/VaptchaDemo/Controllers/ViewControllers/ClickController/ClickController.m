//
//  ClickController.m
//  VaptchaSDKDevelop
//
//  Created by guoshikeji_a on 2018/10/29.
//  Copyright © 2018年 guoshikeji. All rights reserved.
//

#import "ClickController.h"

#import <VaptchaSDK/VaptchaSDK.h>

#import "VPEnabledButton.h"
#import "VPCustomClickButton.h"

@interface ClickController () <VPClickManagerDelegate>

@property (nonatomic, strong) VPClickManager *clickManager;

#pragma mark - customView

/**
 *titleLabel
 */
@property (nonatomic, strong) UILabel *titleLabel;

/**
 *subTitleLabel
 */
@property (nonatomic, strong) UILabel *subTitleLabel;

/**
 *clickOne
 */
@property (nonatomic, strong) VPCustomClickButton *clickOne;
/**
 *clickTwo
 */
@property (nonatomic, strong) VPCustomClickButton *clickTwo;
/**
 *clickThree
 */
@property (nonatomic, strong) VPCustomClickButton *clickThree;
/**
 *clickFour
 */
@property (nonatomic, strong) VPCustomClickButton *clickFour;

/**
 *submitButton
 */
@property (nonatomic, strong) VPEnabledButton *submitButton;

@end

@implementation ClickController

- (VPClickManager *)clickManager {
    if (!_clickManager) {
        _clickManager = [VPClickManager new];
        _clickManager.delegate = self;
    }
    return _clickManager;
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
    self.titleLabel.text = @"示例：防刷票";
    //
    self.subTitleLabel = [UILabel new];
    self.subTitleLabel.numberOfLines = 0;
    self.subTitleLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightBold];
    [self.contentView addSubview:self.subTitleLabel];
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_centerX).offset(-defaultSize.width/2);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(padding);
        make.width.mas_lessThanOrEqualTo(defaultSize.width);
    }];
    self.subTitleLabel.text = @"你从哪里知道VAPTCHA的?";
    //
    CGSize clickSize = CGSizeMake(defaultSize.width, 36.0);
    self.clickOne = [VPCustomClickButton new];
    [self.contentView addSubview:self.clickOne];
    [self.clickOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.subTitleLabel.mas_bottom).offset(padding);
        make.centerX.mas_equalTo(self.contentView);
        make.size.mas_equalTo(clickSize);
    }];
    self.clickTwo = [VPCustomClickButton new];
    [self.contentView addSubview:self.clickTwo];
    [self.clickTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.clickOne.mas_bottom).offset(padding);
        make.centerX.mas_equalTo(self.contentView);
        make.size.mas_equalTo(clickSize);
    }];
    self.clickThree = [VPCustomClickButton new];
    [self.contentView addSubview:self.clickThree];
    [self.clickThree mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.clickTwo.mas_bottom).offset(padding);
        make.centerX.mas_equalTo(self.contentView);
        make.size.mas_equalTo(clickSize);
    }];
    self.clickFour = [VPCustomClickButton new];
    [self.contentView addSubview:self.clickFour];
    [self.clickFour mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.clickThree.mas_bottom).offset(padding);
        make.centerX.mas_equalTo(self.contentView);
        make.size.mas_equalTo(clickSize);
    }];
    //
    self.clickOne.clickLabel.text = @"搜索引擎";
    self.clickTwo.clickLabel.text = @"互联网广告";
    self.clickThree.clickLabel.text = @"网站使用案例";
    self.clickFour.clickLabel.text = @"朋友推荐";
    //
    [self.view addSubview:self.clickManager.clickButton];
    [self.clickManager.clickButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.clickFour.mas_bottom).offset(padding);
        make.centerX.mas_equalTo(self.contentView);
        make.size.mas_equalTo(defaultSize);
    }];
    //
    self.submitButton = [VPEnabledButton new];
    [self.submitButton setTitle:@"提交" forState:UIControlStateNormal];
    self.submitButton.layer.cornerRadius = 2;
    self.submitButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.submitButton.layer.borderWidth = 0.5;
    self.submitButton.titleLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightRegular];
    [self.contentView addSubview:self.submitButton];
    [self.submitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.clickManager.clickButton.mas_bottom).offset(padding);
        make.centerX.mas_equalTo(self.contentView);
        make.size.mas_equalTo(defaultSize);
    }];
    self.submitButton.enabled = false;
    [self.submitButton addTarget:self action:@selector(submitButtonDidClickedAction) forControlEvents:UIControlEventTouchUpInside];
    //
    [self.resetButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.submitButton.mas_bottom).offset(padding);
        make.centerX.mas_equalTo(self.contentView);
        make.size.mas_equalTo(defaultSize);
    }];
    //
    [self.view layoutIfNeeded];
    [self setContentViewOffsetWithMaxHeight:CGRectGetMaxY(self.resetButton.frame)+padding];
}

- (void)resetButtonDidClickedAction {
    self.submitButton.enabled = false;
    [self.clickManager reset];
}

#pragma mark - orientChange:
- (void)orientChange:(NSNotification *)noti {
    [self.view layoutIfNeeded];
    [self setContentViewOffsetWithMaxHeight:CGRectGetMaxY(self.resetButton.frame)+VPCustomViewPadding];
}

#pragma mark - VPClickManagerDelegate
- (void)clickManagerVerifyPassedWithToken:(NSString *)token {
    [self showToken:token];
    self.submitButton.enabled = true;
}


#pragma mark - submitButtonDidClickedAction
- (void)submitButtonDidClickedAction {
    [self resetButtonDidClickedAction];
}

@end
