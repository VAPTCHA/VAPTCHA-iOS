//
//  VPClickManager.h
//  VaptchaSDK
//
//  Created by guoshikeji_a on 2018/10/31.
//  Copyright © 2018年 guoshikeji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol VPClickManagerDelegate <NSObject>

/**
 * @brief 点击式验证成功代理回调
 * @param token 验证成功凭证
 */
- (void)clickManagerVerifyPassedWithToken:(NSString *)token;

@end

/**
 点击式手势验证管理对象
 */

@interface VPClickManager : NSObject

/**
 *
 */
@property (nonatomic, weak, readonly) UIButton *clickButton;

/**
 * @brief 重置点击式验证
 */
- (void)reset;

/**
 * VPClickManagerDelegate
 */
@property (nonatomic, weak) id <VPClickManagerDelegate> delegate;

@end

