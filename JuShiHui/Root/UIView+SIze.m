//
//  UIView+SIze.m
//  newle
//
//  Created by 陈蜜 on 15/6/19.
//  Copyright (c) 2015年 newle. All rights reserved.
//

#import "UIView+SIze.h"

@implementation UIView (SIze)


#pragma mark - set

//设置控件大小
- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

//设置控件位置
- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

//设置宽
- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

//设置高
- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

//设置X坐标
- (void)setX:(CGFloat)X
{
    CGRect frame = self.frame;
    frame.origin.x = X;
    self.frame = frame;
}

//设置Y坐标
- (void)setY:(CGFloat)Y
{
    CGRect frame = self.frame;
    frame.origin.y = Y;
    self.frame = frame;
}

//设置中心点X坐标
- (void)setCenterX:(CGFloat)centerX
{
    self.center = CGPointMake(centerX, self.centerY);
}

//设置中心点Y坐标
- (void)setCenterY:(CGFloat)centerY
{
    self.center = CGPointMake(self.centerX, centerY);
}


//设置X与Y坐标
- (void)setX:(CGFloat)X Y:(CGFloat)Y
{
    [self setX:X];
    [self setY:Y];
}


#pragma mark - get

//高
- (CGFloat)height
{
    return self.frame.size.height;
}

//宽
- (CGFloat)width
{
    return self.frame.size.width;
}

//X坐标
- (CGFloat)X
{
    return self.frame.origin.x;
}

//Y坐标
- (CGFloat)Y
{
    return self.frame.origin.y;
}

//中心点X坐标
- (CGFloat)centerX
{
    return self.center.x;
}

//中心点Y坐标
- (CGFloat)centerY
{
    return self.center.y;
}

//控件左上角坐标
- (CGPoint)origin
{
    return self.frame.origin;
}


//获取控件大小
- (CGSize)size
{
    return self.frame.size;
}

//设置底部位置
- (void)setBottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.size.height = bottom - self.Y;
    self.frame = frame;
}

//设置顶部位置
- (void)setTop:(CGFloat)top
{
    [self setY:top];
}

//设置左面位置
- (void)setLeft:(CGFloat)left
{
    [self setX:left];
}

//设置右面位置
- (void)setRight:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.size.width = right - self.X;
    self.frame = frame;
}


//获取底部坐标
- (CGFloat)bottom
{
    return self.Y + self.height;
}

//获取顶部坐标
- (CGFloat)top
{
    return self.Y;
}

//获取左面坐标
- (CGFloat)left
{
    return self.X;
}


//获取右面坐标
- (CGFloat)right
{
    return self.X + self.width;
}

/**
 *  添加边框：注给scrollView添加会出错
 *
 *  @param direct 方向
 *  @param color  颜色
 *  @param width  线宽
 */
-(void)addSingleBorder:(UIViewBorderDirect)direct color:(UIColor *)color width:(CGFloat)width{
    
    UIView *line=[[UIView alloc] init];
    
    //设置颜色
    line.backgroundColor=color;
    
    //添加
    [self addSubview:line];
    
    //禁用ar
    line.translatesAutoresizingMaskIntoConstraints=NO;
    
    NSDictionary *views=NSDictionaryOfVariableBindings(line);
    NSDictionary *metrics=@{@"w":@(width),@"y":@(self.height - width),@"x":@(self.width - width)};
    
    
    NSString *vfl_H=@"";
    NSString *vfl_W=@"";
    
    //上
    if(UIViewBorderDirectTop==direct){
        vfl_H=@"H:|-0-[line]-0-|";
        vfl_W=@"V:|-0-[line(==w)]";
    }
    
    //左
    if(UIViewBorderDirectLeft==direct){
        vfl_H=@"H:|-0-[line(==w)]";
        vfl_W=@"V:|-0-[line]-0-|";
    }
    
    //下
    if(UIViewBorderDirectBottom==direct){
        vfl_H=@"H:|-0-[line]-0-|";
        vfl_W=@"V:[line(==w)]-0-|";
    }
    
    //右
    if(UIViewBorderDirectRight==direct){
        vfl_H=@"H:[line(==w)]-0-|";
        vfl_W=@"V:|-0-[line]-0-|";
    }
    
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl_H options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl_W options:0 metrics:metrics views:views]];
}



/**
 *  自动从xib创建视图
 */
+(instancetype)viewFromXIB{
    
    NSString *name=NSStringFromClass(self);
    
    UIView *xibView=[[[NSBundle mainBundle] loadNibNamed:name owner:nil options:nil] firstObject];
    
    if(xibView==nil){
//        NSLog(@"CoreXibView：从xib创建视图失败，当前类是：%@",name);
    }
    
    return xibView;
}

#pragma mark  添加一组子view：
-(void)addSubviewsWithArray:(NSArray *)subViews{
    
    for (UIView *view in subViews) {
        
        [self addSubview:view];
        
    }
}



//#pragma mark  圆角处理
//-(void)setRadius:(CGFloat)r{
//    
//    if(r<=0) r=self.frame.size.width * .5f;
//    
//    //圆角半径
//    self.layer.cornerRadius=r;
//    
//    //强制
//    self.layer.masksToBounds=YES;
//}
//
//-(CGFloat)radius{
//    return 0;
//}

/**
 *  添加底部的边线
 */
-(void)setBottomBorderColor:(UIColor *)bottomBorderColor{
    
}




-(UIColor *)bottomBorderColor{
    return nil;
}

/**
 *  添加边框
 */
-(void)setBorder:(UIColor *)color width:(CGFloat)width{
    CALayer *layer=self.layer;
    layer.borderColor=color.CGColor;
    layer.borderWidth=width;
}




/**
 *  调试
 */
-(void)debug:(UIColor *)color width:(CGFloat)width{
    
    [self setBorder:color width:width];
}

/**
 *  批量移除视图
 *
 *  @param views 需要移除的视图数组
 */
+ (void)removeViews:(NSArray *)views{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        for (UIView *view in views) {
            [view removeFromSuperview];
        }
    });
}




/**
 *  view剪裁圆角
 *
 *  @param radius 圆角半径
 */
- (void)cornerRadius:(CGFloat)radius
{
    //圆角半径
    self.layer.cornerRadius=radius;
    
    //强制
    self.layer.masksToBounds=YES;
}

// 判断View是否显示在屏幕上
- (BOOL)isDisplayedInScreen
{
    if (self == nil) {
        return FALSE;
    }
    
    CGRect screenRect = [UIScreen mainScreen].bounds;
    
    // 转换view对应window的Rect
    CGRect rect = [self convertRect:self.frame fromView:nil];
    if (CGRectIsEmpty(rect) || CGRectIsNull(rect)) {
        return FALSE;
    }
    
    // 若view 隐藏
    if (self.hidden) {
        return FALSE;
    }
    
    // 若没有superview
    if (self.superview == nil) {
        return FALSE;
    }
    
    // 若size为CGrectZero
    if (CGSizeEqualToSize(rect.size, CGSizeZero)) {
        return  FALSE;
    }
    
    // 获取 该view与window 交叉的 Rect
    CGRect intersectionRect = CGRectIntersection(rect, screenRect);
    if (CGRectIsEmpty(intersectionRect) || CGRectIsNull(intersectionRect)) {
        return FALSE;
    }
    
    return TRUE;
}


- (UIViewController*)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}


@end
