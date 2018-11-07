//
//  VPCustomClickButton.h
//  VaptchaSDKDevelop
//
//  Created by guoshikeji_a on 2018/11/7.
//  Copyright © 2018年 guoshikeji. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VPCustomClickButton : UIButton

/**
 *clickLabel
 */
@property (nonatomic, strong) UILabel *clickLabel;

/**
 *clickIV
 */
@property (nonatomic, strong) UIImageView *clickIV;

@end

NS_ASSUME_NONNULL_END
