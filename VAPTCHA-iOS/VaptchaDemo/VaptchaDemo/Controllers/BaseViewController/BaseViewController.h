//
//  BaseViewController.h
//  VaptchaSDKDevelop
//
//  Created by guoshikeji_a on 2018/10/29.
//  Copyright © 2018年 guoshikeji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "Masonry.h"

#define VPCustomLeftPadding 25

#define VPCustomViewPadding 20.0

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

/**
 *contentView 转屏幕时为了能滑动
 */
@property (nonatomic, strong) UIScrollView *contentView;

@property (nonatomic, strong) UIButton *resetButton;

- (void)resetButtonDidClickedAction;


- (void)showToken:(NSString *)token;


- (void)setupSubviews;


- (CGSize)viewDefaultSize;


- (void)setContentViewOffsetWithMaxHeight:(CGFloat)maxHeight;

//屏幕发生旋转
- (void)orientChange:(NSNotification *)noti;

@end

NS_ASSUME_NONNULL_END
