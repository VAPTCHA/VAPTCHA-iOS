//
//  VPInputView.m
//  VaptchaSDKDevelop
//
//  Created by guoshikeji_a on 2018/11/6.
//  Copyright © 2018年 guoshikeji. All rights reserved.
//

#import "VPInputView.h"

#import "Masonry.h"

@implementation VPInputView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.layer.cornerRadius = 2;
        self.layer.borderWidth = .5;
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    self.imageV = [UIImageView new];
    self.imageV.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.imageV];
    [self.imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.left.mas_equalTo(self).offset(10.0);
        make.width.height.mas_equalTo(15.0);
    }];
    //
    self.inputTF = [UITextField new];
    self.inputTF.autocorrectionType = UIViewAutoresizingNone;
    self.inputTF.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [self addSubview:self.inputTF];
    [self.inputTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.imageV.mas_right).offset(12.0);
        make.centerY.mas_equalTo(self);
        make.height.mas_equalTo(self);
        make.right.mas_equalTo(self).offset(-10.0);
    }];
}

@end
