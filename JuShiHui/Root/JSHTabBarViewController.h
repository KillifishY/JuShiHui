//
//  JSHTabBarViewController.h
//  JuShiHui
//
//  Created by 于浏洋 on 16/3/17.
//  Copyright © 2016年 JuShiHui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSHTabBarViewController : UITabBarController

- (void)homeBtnUserInteractionEnabledYES;

- (void)homeBtnUserInteractionEnabledNO;

// 切换底部工具栏（外部调用）
- (void)changeViewControllerIndex:(int)index;

#pragma mark - 切换底部工具栏（外部调用）
- (void)changeViewControllerIndex:(int)index isPush:(BOOL)isPush;

// 隐藏底部工具栏
- (void)hiddenTabBar;

// 隐藏底部工具栏（动画）
- (void)hiddenTabBarWithAnimition;

// 显示底部工具栏
- (void)showTabBar;


// 显示底部工具栏(动画)
- (void)showTabBarWithAnimition;

#pragma mark - 状态栏改变时，更改工具栏位置
- (void)tabBarWithAnimitionChange:(BOOL)hotspotConnected;

@end
