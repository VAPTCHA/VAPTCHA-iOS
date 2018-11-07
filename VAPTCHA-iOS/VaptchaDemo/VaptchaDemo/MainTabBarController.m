//
//  MainTabBarController.m
//  VaptchaSDKDevelop
//
//  Created by guoshikeji_a on 2018/10/29.
//  Copyright © 2018年 guoshikeji. All rights reserved.
//

#import "MainTabBarController.h"
//
#import "VPNavigationController.h"
#import "EmbedController.h"
#import "ClickController.h"
#import "InvisibleController.h"
#import "OutageController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setOutage:(BOOL)outage {
    _outage = outage;
    //
    [self setViewControllers];
}
- (void)setViewControllers {
    //dbdbbd
//    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:219.0/255 green:219.0/255 blue:219.0/255 alpha:1]} forState:UIControlStateNormal];
//    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:65.0/255.0 green:141.0/255.0 blue:251.0/255.0 alpha:1]} forState:UIControlStateSelected];
    //
    NSMutableArray *controllers = [NSMutableArray array];
    //嵌入式
    EmbedController *embedVC = [EmbedController new];
    embedVC.navigationItem.title = NSLocalizedString(@"embedTypeString", nil);
    VPNavigationController *embedNav = [[VPNavigationController alloc] initWithRootViewController:embedVC];
    [controllers addObject:embedNav];
    embedNav.tabBarItem.title = embedVC.navigationItem.title;
    embedNav.tabBarItem.image = [UIImage imageNamed:@"嵌入"];
//    embedNav.tabBarItem.selectedImage = [UIImage imageNamed:@"嵌入"];
    //点击式
    ClickController *clickVC = [ClickController new];
    clickVC.navigationItem.title = NSLocalizedString(@"clickTypeString", nil);;
    VPNavigationController *clickNav = [[VPNavigationController alloc] initWithRootViewController:clickVC];
    clickNav.tabBarItem.title = clickVC.navigationItem.title;
    [controllers addObject:clickNav];
    clickNav.tabBarItem.image = [UIImage imageNamed:@"点击"];
    //隐藏式
    InvisibleController *invisibleVC = [InvisibleController new];
    invisibleVC.navigationItem.title = NSLocalizedString(@"invisibleTypeString", nil);
    VPNavigationController *invisibleNav = [[VPNavigationController alloc] initWithRootViewController:invisibleVC];
    invisibleNav.tabBarItem.title = invisibleVC.navigationItem.title;
    [controllers addObject:invisibleNav];
    invisibleNav.tabBarItem.image = [UIImage imageNamed:@"隐藏"];
    //切换宕机模式
    OutageController *outageVC = [OutageController new];
    outageVC.navigationItem.title = self.outage?NSLocalizedString(@"normalTypeString", nil):NSLocalizedString(@"outageTypeString", nil);
    outageVC.outage = self.outage;
    VPNavigationController *outageNav = [[VPNavigationController alloc] initWithRootViewController:outageVC];
    outageNav.tabBarItem.title = outageVC.navigationItem.title;
    [controllers addObject:outageNav];
    outageNav.tabBarItem.image = self.outage?[UIImage imageNamed:@"正常"]:[UIImage imageNamed:@"宕机"];
    //
    self.viewControllers = controllers;
}

@end
