//
//  MainTabBarControllerAnimatedTransition.m
//  VaptchaSDKDevelop
//
//  Created by guoshikeji_a on 2018/11/7.
//  Copyright © 2018年 guoshikeji. All rights reserved.
//

#import "MainTabBarControllerAnimatedTransition.h"

@implementation MainTabBarControllerAnimatedTransition


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return .2;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    //
    UIView *containerView = transitionContext.containerView;
    //
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    //
    [containerView addSubview:fromView];
    [containerView addSubview:toView];
    
    
    CABasicAnimation *fromAnimationX = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    fromAnimationX.fromValue = @(0);
    if (self.transitionTo==MainTabBarControllerAnimatedTransitionToViewFromLeft) {
        fromAnimationX.toValue = @(fromView.frame.size.width);
    }else {
        fromAnimationX.toValue = @(-fromView.frame.size.width);
    }
    fromAnimationX.duration = duration;
    fromAnimationX.removedOnCompletion = true;
//    fromAnimationX.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [fromView.layer addAnimation:fromAnimationX forKey:@""];
    
    //
    CABasicAnimation *transformTranslationX = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    if (self.transitionTo==MainTabBarControllerAnimatedTransitionToViewFromLeft) {
        transformTranslationX.fromValue = @(-toView.frame.size.width);
    }else {
        transformTranslationX.fromValue = @(toView.frame.size.width);
    }
    transformTranslationX.toValue = @(0);
    transformTranslationX.duration = duration;
    transformTranslationX.removedOnCompletion = true;
//    transformTranslationX.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [toView.layer addAnimation:transformTranslationX forKey:@""];
    //
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [transitionContext completeTransition:true];
    });
}

@end
