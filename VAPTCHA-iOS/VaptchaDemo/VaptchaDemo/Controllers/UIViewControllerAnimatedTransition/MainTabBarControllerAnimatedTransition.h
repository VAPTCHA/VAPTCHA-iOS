//
//  MainTabBarControllerAnimatedTransition.h
//  VaptchaSDKDevelop
//
//  Created by guoshikeji_a on 2018/11/7.
//  Copyright © 2018年 guoshikeji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//标明toView来自左边还是右边
typedef NS_ENUM(NSInteger, MainTabBarControllerAnimatedTransitionToViewFrom) {
    MainTabBarControllerAnimatedTransitionToViewFromLeft = 0,//左边
    MainTabBarControllerAnimatedTransitionToViewFromRight = 1,//右边
};

@interface MainTabBarControllerAnimatedTransition : NSObject <UIViewControllerAnimatedTransitioning>

/**
 *MainTabBarControllerAnimatedTransitionToViewFrom
 */
@property (nonatomic, assign) MainTabBarControllerAnimatedTransitionToViewFrom transitionTo;

@end

