//
//  JSHView.m
//  JuShiHui
//
//  Created by 于浏洋 on 16/3/17.
//  Copyright © 2016年 JuShiHui. All rights reserved.
//

#import "JSHView.h"

@implementation JSHView

#pragma mark - 初始化UIButton
+ (UIButton *)makeButtonFrame:(CGRect)buttonFrame withButtonTitle:(NSString *)buttonTitle withButtonTitleFont:(UIFont *)buttonTitleFont{
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame      = buttonFrame;
    [button setBackgroundColor:[UIColor clearColor]];
    [button setTitle:buttonTitle forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button.titleLabel setFont:buttonTitleFont];
    
    return button;
}

#pragma mark - 初始化UIImageView
+ (UIImageView *)makeImageViewFrame:(CGRect)imageViewFrame withImageName:(NSString *)imageName{
    
    UIImageView * imageView   = [[UIImageView alloc]initWithFrame:imageViewFrame];
    imageView.image           = [UIImage imageNamed:imageName];
    imageView.backgroundColor = [UIColor clearColor];
    
    return imageView;
    
}
#pragma mark - 设置阴影
+ (void)setLayerWithView:(UIView *)view
                  offset:(CGSize)size
                  radius:(CGFloat)radius
                 opacity:(CGFloat)opacity
                   color:(UIColor *)color
{
    CALayer *layer = [view layer];
    [layer setShadowOffset:size]; //为阴影偏移量,默认为(左右,上下)
    [layer setShadowRadius:radius]; //为阴影四角圆角半径,默认值为
    [layer setShadowOpacity:opacity]; //为阴影透明度(取值为[0,1])
    [layer setShadowColor:color.CGColor]; //为阴影颜色
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
