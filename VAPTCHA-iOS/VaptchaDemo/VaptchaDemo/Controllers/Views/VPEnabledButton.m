//
//  VPLoginButton.m
//  VaptchaSDKDevelop
//
//  Created by guoshikeji_a on 2018/11/6.
//  Copyright © 2018年 guoshikeji. All rights reserved.
//

#import "VPEnabledButton.h"

@implementation VPInvisibleSubmitButton


- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    if (enabled) {
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.backgroundColor = [UIColor colorWithRed:40.0/255.0 green:193.0/255.0 blue:247.0/255.0 alpha:1];
    }else {
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.backgroundColor = [UIColor lightGrayColor];
    }
}

@end

@implementation VPEnabledButton

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    if (enabled) {
        [self setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        self.backgroundColor = [UIColor whiteColor];
    }else {
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.backgroundColor = [UIColor lightGrayColor];
    }
}


@end
