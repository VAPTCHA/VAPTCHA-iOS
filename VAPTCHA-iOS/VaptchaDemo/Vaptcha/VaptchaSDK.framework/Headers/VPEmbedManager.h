//
//  VPEmbedManager.h
//  VaptchaSDK
//
//  Created by guoshikeji_a on 2018/10/31.
//  Copyright © 2018年 guoshikeji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@protocol VPEmbedManagerDelegate <NSObject>

/**
 * @brief 嵌入式验证成功代理回调
 * @param token 验证成功凭证
 */
- (void)embedManagerVerifyPassedWithToken:(NSString *)token;

@end

/**
 嵌入式手势验证管理对象
 */
@interface VPEmbedManager : NSObject

/**
 * 嵌入式验证视图
 */
@property (nonatomic, weak, readonly) UIView *embedView;

/**
 * VPEmbedManagerDelegate
 */
@property (nonatomic, weak) id <VPEmbedManagerDelegate> delegate;


/**
 * @brief 重置嵌入式验证
 */
- (void)reset;


/**
 * @brief embedView 嵌入时 最佳宽高比例值 建议使用该比例对embedView的frame进行约束
 */
+ (CGFloat)embedViewWidthHeightPercentage;

@end

