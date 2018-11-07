//
//  VPSDKManager.h
//  VaptchaSDK
//
//  Created by guoshikeji_a on 2018/10/31.
//  Copyright © 2018年 guoshikeji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface VPSDKManager : NSObject

/**
 * @brief  配置用户应用信息 在appdelegate 完成
 * @param vid 用户id。
 * @param scene 场景号 eg: 01
 */
+ (void)setVaptchaSDKVid:(NSString *)vid
                   scene:(NSString *)scene;

/**
 * @brief  设置SDK语言
 * @param preferredLanguage “en->英语; zh-Hans->简体中文; zh-Hant->繁体中文”
 */
+ (void)setPreferredLanguage:(NSString *)preferredLanguage;


/**
 * @brief  设置宕机服务器 最好设置 以免宕机时 无法正常验证
 * @param outageServer 宕机服务器地址
 */
+ (void)setOutageServer:(NSString *)outageServer;
/**
 * @brief 手动配置宕机模式开启与否
 * @param open 开启与否
 */
+ (void)setOutageOpen:(BOOL)open;

@end

