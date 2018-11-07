//
//  OutageController.m
//  VaptchaSDKDevelop
//
//  Created by guoshikeji_a on 2018/11/6.
//  Copyright © 2018年 guoshikeji. All rights reserved.
//

#import "OutageController.h"

#import <VaptchaSDK/VaptchaSDK.h>

@interface OutageController ()

@property (nonatomic, strong) UITextField *serverTF;

@end

@implementation OutageController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    self.navigationItem.rightBarButtonItem = nil;
    [self setupSubviews];
}
//
- (void)resetButtonDidClickedAction {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"VPOutageChanged" object:@(true)];
}

- (void)setOutage:(BOOL)outage {
    _outage = outage;
}

- (void)setupSubviews {
    UIButton *changeButton = [UIButton new];
    [changeButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    if (self.outage) {
        [changeButton setTitle:@"切换到正常模式" forState:UIControlStateNormal];
    }else {
        [changeButton setTitle:@"切换到宕机模式" forState:UIControlStateNormal];
    }
    [self.view addSubview:changeButton];
    [changeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view.mas_centerY);
        make.width.mas_equalTo(self.view).multipliedBy(0.8);
        make.height.mas_equalTo(40.0);
    }];
    [changeButton addTarget:self action:@selector(changeButtonDidClickedAction) forControlEvents:UIControlEventTouchUpInside];
    
    //
    if (!self.outage) {
        UITextField *tf = [UITextField new];
        tf.textAlignment = NSTextAlignmentCenter;
        tf.autocorrectionType = UITextAutocorrectionTypeNo;
        tf.autocapitalizationType = UITextAutocapitalizationTypeNone;
        tf.keyboardType = UIKeyboardTypeWebSearch;
        tf.layer.cornerRadius = 3;
        tf.layer.borderColor = [UIColor lightGrayColor].CGColor;
        tf.layer.borderWidth = 0.5;
        tf.placeholder = @"请输入宕机服务器地址";
        [self.view addSubview:tf];
        [tf mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.view);
            make.bottom.mas_equalTo(self.view.mas_centerY).offset(-20.0);
            make.width.mas_equalTo(changeButton);
            make.height.mas_equalTo(changeButton);
        }];
        //
        self.serverTF = tf;
    }
}

#pragma mark - changeButtonDidClickedAction
- (void)changeButtonDidClickedAction {
    if (!self.outage) {
        NSString *server = self.serverTF.text;
        if (!server.length) {
            return;
        }
        if (![server hasPrefix:@"http://"]&&![server hasPrefix:@"https://"]) {
            server = [NSString stringWithFormat:@"https://%@",server];
        }
        [VPSDKManager setOutageServer:server];
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:@"VPOutageChanged" object:@(!self.outage)];
}

@end
