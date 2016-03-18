//
//  AppDelegate.h
//  JuShiHui
//
//  Created by 于浏洋 on 16/3/17.
//  Copyright © 2016年 JuShiHui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSHTabBarViewController.h"

#define APP_DELEGATE (AppDelegate *)[[UIApplication sharedApplication] delegate]

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic , strong) JSHTabBarViewController *JSHTabBar;

@property (nonatomic, strong) UINavigationController *navigationController; //用于保存当前导航控制器

@end

