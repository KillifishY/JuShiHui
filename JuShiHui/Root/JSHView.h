//
//  JSHView.h
//  JuShiHui
//
//  Created by 于浏洋 on 16/3/17.
//  Copyright © 2016年 JuShiHui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSHView : UIView

#pragma mark - 初始化UIButton
+ (UIButton *)makeButtonFrame:(CGRect)buttonFrame withButtonTitle:(NSString *)buttonTitle withButtonTitleFont:(UIFont *)buttonTitleFont;

#pragma mark - 初始化UIImageView
+ (UIImageView *)makeImageViewFrame:(CGRect)imageViewFrame withImageName:(NSString *)imageName;

/*
 *  设置阴影
 *
 *  view       要设置的视图
 *  size       阴影偏移量，默认为（左右，上下）
 *  radius     阴影四角圆角半径
 *  opacity    阴影透明度
 *  color      阴影颜色
 */
+ (void)setLayerWithView:(UIView *)view offset:(CGSize)size radius:(CGFloat)radius opacity:(CGFloat)opacity color:(UIColor *)color;
@end
