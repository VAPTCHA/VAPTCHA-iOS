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
}
//
- (void)resetButtonDidClickedAction {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"VPOutageChanged" object:@(true)];
}

- (void)setOutage:(BOOL)outage {
    _outage = outage;
}

- (void)setupSubviews {
    CGFloat padding = VPCustomViewPadding;
    CGSize defaultSize = [self viewDefaultSize];
    
    UIButton *changeButton = [UIButton new];
    [changeButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    if (self.outage) {
        [changeButton setTitle:NSLocalizedString(@"outageToNormal", nil) forState:UIControlStateNormal];
    }else {
        [changeButton setTitle:NSLocalizedString(@"normalToOutage", nil) forState:UIControlStateNormal];
    }
    changeButton.titleLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightRegular];
    changeButton.layer.cornerRadius = 2;
    changeButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    changeButton.layer.borderWidth = 0.5;
    [self.view addSubview:changeButton];
    [changeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view.mas_centerY);
        make.size.mas_equalTo(defaultSize);
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
        tf.placeholder = NSLocalizedString(@"outageServer", nil);
        [self.view addSubview:tf];
        [tf mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.view);
            make.bottom.mas_equalTo(self.view.mas_centerY).offset(-padding);
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
