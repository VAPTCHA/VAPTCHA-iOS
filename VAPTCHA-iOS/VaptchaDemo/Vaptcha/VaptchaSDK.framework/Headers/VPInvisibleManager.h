//
//  VPInvisibleManager.h
//  VaptchaSDK
//
//  Created by guoshikeji_a on 2018/11/5.
//  Copyright © 2018年 guoshikeji. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@protocol VPInvisibleDelegate <NSObject>
/**
 * @brief 隐藏式验证成功代理回调
 * @param token 验证成功凭证
 */
- (void)invisibleVerifyPassedWithToken:(NSString *)token;

/**
 * @brief 隐藏式验证管理对象
 * @param error 验证错误原因 可提示用error.domain
 */
- (void)invisibleVerifyFailedWithError:(NSError *)error;

@end

/**
 * @brief 隐藏式验证管理对象
 */
@interface VPInvisibleManager : NSObject

/**
 * VPInvisibleDelegate 代理
 */
@property (nonatomic, weak) id <VPInvisibleDelegate> delegate;

/**
 * animation 是否带加载动画 默认为 YES
 */
@property (nonatomic, assign) BOOL animation;


/**
 * @brief 重置隐藏式验证
 */
- (void)reset;

/**
 * @brief 开始验证
 */
- (void)startInsivible;

@end


