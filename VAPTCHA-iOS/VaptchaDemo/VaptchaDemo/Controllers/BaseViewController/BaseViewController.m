//
//  BaseViewController.m
//  VaptchaSDKDevelop
//
//  Created by guoshikeji_a on 2018/10/29.
//  Copyright © 2018年 guoshikeji. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (UIButton *)resetButton {
    if (!_resetButton) {
        _resetButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 44)];
        [_resetButton setTitle:@"重置验证" forState:UIControlStateNormal];
        _resetButton.titleLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightRegular];
        [_resetButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        _resetButton.layer.cornerRadius = 2;
        _resetButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _resetButton.layer.borderWidth = 0.5;
        [_resetButton addTarget:self action:@selector(resetButtonDidClickedAction) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.resetButton];
    }
    return _resetButton;
}

- (UIScrollView *)contentView {
    if (!_contentView) {
        _contentView = [UIScrollView new];
        [self.view addSubview:_contentView];
        [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(self.view);
            make.width.height.mas_equalTo(self.view);
        }];
    }
    return _contentView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.resetButton];
    
    //
    [self setupSubviews];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientChange:) name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (void)orientChange:(NSNotification *)noti {}

- (void)resetButtonDidClickedAction {}

- (void)setupSubviews {}

- (CGSize)viewDefaultSize {
    CGRect screenFrame = [UIScreen mainScreen].bounds;
    CGFloat min = MIN(screenFrame.size.width, screenFrame.size.height);
    min = MIN(min, 414.0);
    return CGSizeMake(min-VPCustomLeftPadding*2, 40.0);
}


- (void)setContentViewOffsetWithMaxHeight:(CGFloat)maxHeight {
    self.contentView.contentSize = CGSizeMake(0, maxHeight);
}

- (void)showToken:(NSString *)token {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"验证凭证" message:token preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:true completion:nil];
}



- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
