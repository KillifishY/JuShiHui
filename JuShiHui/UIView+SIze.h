//
//  UIView+SIze.h
//  newle
//
//  Created by 陈蜜 on 15/6/19.
//  Copyright (c) 2015年 newle. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    
    //上
    UIViewBorderDirectTop=0,
    
    //左
    UIViewBorderDirectLeft,
    
    //下
    UIViewBorderDirectBottom,
    
    //右
    UIViewBorderDirectRight,
    
    
}UIViewBorderDirect;

@interface UIView (SIze)

@property (nonatomic, assign) CGFloat width;    //宽
@property (nonatomic, assign) CGFloat height;   //高
@property (nonatomic, assign) CGFloat X;        //X坐标
@property (nonatomic, assign) CGFloat Y;        //Y坐标
@property (nonatomic, assign) CGFloat centerX;  //中心点X坐标
@property (nonatomic, assign) CGFloat centerY;  //中心点Y坐标
@property (nonatomic, assign) CGPoint origin;   //控件左上角位置
@property (nonatomic, assign) CGSize size;      //控件大小

@property (nonatomic, assign) CGFloat bottom;   //底部
@property (nonatomic, assign) CGFloat top;      //顶部

@property (nonatomic, assign) CGFloat right;    //右边
@property (nonatomic, assign) CGFloat left;     //左边


- (void)setX:(CGFloat)X Y:(CGFloat)Y;


/**
 *  添加边框：注给scrollView添加会出错
 *
 *  @param direct 方向
 *  @param color  颜色
 *  @param width  线宽
 */
-(void)addSingleBorder:(UIViewBorderDirect)direct color:(UIColor *)color width:(CGFloat)width;


/**
 *  自动从xib创建视图
 */
+(instancetype)viewFromXIB;


/**
 *  添加一组子view：
 */
-(void)addSubviewsWithArray:(NSArray *)subViews;


/**
 *  添加边框:四边
 */
-(void)setBorder:(UIColor *)color width:(CGFloat)width;



/**
 *  调试
 */
-(void)debug:(UIColor *)color width:(CGFloat)width;



/**
 *  批量移除视图
 *
 *  @param views 需要移除的视图数组
 */
+(void)removeViews:(NSArray *)views;

/**
 *  view剪裁圆角
 *
 *  @param radius 圆角半径
 */
- (void)cornerRadius:(CGFloat)radius;

// 判断View是否显示在屏幕上
- (BOOL)isDisplayedInScreen;


//** 获取View所在的视图控制器 */
- (UIViewController *)viewController;


@end
