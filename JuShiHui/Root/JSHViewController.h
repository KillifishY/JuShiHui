//
//  JSHViewController.h
//  JuShiHui
//
//  Created by 于浏洋 on 16/3/17.
//  Copyright © 2016年 JuShiHui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSHPublic.h"
#import "JSHView.h"

@interface JSHViewController : UIViewController
#pragma mark - 顶部左侧的按钮
- (UIButton *)makeLeftButton:(NSString *)buttonTitle withBackImageName:(NSString *)buttonBackImageName;

#pragma mark - 顶部中间的文字
- (UILabel *)makeTopTitleLabel:(NSString *)topTitleLabel;

#pragma mark - 顶部右侧的按钮
- (UIButton *)makeRightButton:(NSString *)buttonTitle withBackImageName:(NSString *)buttonBackImageName;

#pragma mark - 顶部右侧按钮进阶设置
- (UIButton *)makeRightButton:(NSString *)buttonTitle withBackImageName:(NSString *)buttonBackImageName target:(id)target action:(SEL)action;

@end
