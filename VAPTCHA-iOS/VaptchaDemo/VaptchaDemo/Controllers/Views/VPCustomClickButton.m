//
//  VPCustomClickButton.m
//  VaptchaSDKDevelop
//
//  Created by guoshikeji_a on 2018/11/7.
//  Copyright © 2018年 guoshikeji. All rights reserved.
//

#import "VPCustomClickButton.h"

#import "Masonry.h"

@implementation VPCustomClickButton

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.layer.cornerRadius = 2;
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
        [self setupSubviews];
        //
        self.selected = false;
        //
        [self addTarget:self action:@selector(clickButtonDidClickedAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
- (void)setupSubviews {
    self.clickIV = [UIImageView new];
    [self addSubview:self.clickIV];
    [self.clickIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.left.mas_equalTo(10.0);
        make.width.height.mas_equalTo(15.0);
    }];
    //
    self.clickLabel = [UILabel new];
    self.clickLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightRegular];
    self.clickLabel.textColor = [UIColor darkGrayColor];
    [self addSubview:self.clickLabel];
    [self.clickLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.clickIV.mas_right).offset(10.0);
        make.centerY.mas_equalTo(self);
        make.right.mas_equalTo(self).offset(-10.0);
    }];
}


- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    //
    if (selected) {
        self.clickIV.image = [UIImage imageNamed:@"check_select"];
    }else {
        self.clickIV.image = [UIImage imageNamed:@"check"];
    }
}


- (void)clickButtonDidClickedAction {
    self.selected = !self.selected;
}

@end
