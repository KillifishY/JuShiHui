//
//  JSHPublic.h
//  JuShiHui
//
//  Created by 于浏洋 on 16/3/17.
//  Copyright © 2016年 JuShiHui. All rights reserved.
//
#pragma mark - 颜色
#define MyLabelColor UIColorFromRGB(0X373737)


#define MyBackgroundColor UIColorFromRGB(0XF6F6EE)

#define MyNewBackGroudColor UIColorFromRGB(0xf6f6f6)

#define MyColorArray @[@"0xe60012", @"0x00a0e9", @"0x6ab400",@"0xf39800",@"0xFFD700",@"0xAB82FF"]

#define MyOrangeColor UIColorFromRGB(0XFF7C54)

#define MyWhiteColor [UIColor whiteColor]//白色

#define MyGrayColor [UIColor grayColor]

#define MyBlackColor [UIColor blackColor]//黑色

#define MyClearColor [UIColor clearColor]//透明

#define MyBlueColor [UIColor blueColor]//蓝色

#define MyReaColor UIColorFromRGB(0xd65d4c)//红色

#define MyLightGreen UIColorFromRGB(0x2d9f7c)//浅绿色

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1]

#pragma mark - 系统
#define IsIos7 (([[[UIDevice currentDevice] systemVersion] floatValue] >=7.0)?YES:NO)

#define IS_IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7)
#define IS_IOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8)

//1.系统状态栏
//APP_STATUSBAR_HEIGHT=[UIApplication sharedApplication].statusBarFrame.size.height，包含热点栏（如有）高度，标准高度为20pt，当有个人热点连接时，高度为40pt。
// iOS系统版本
#define SYSTEM_VERSION    [[[UIDevice currentDevice] systemVersion] doubleValue]
// 标准系统状态栏高度
#define SYS_STATUSBAR_HEIGHT                20
// 热点栏高度
#define HOTSPOT_STATUSBAR_HEIGHT            20
// 导航栏（UINavigationController.UINavigationBar）高度
#define NAVIGATIONBAR_HEIGHT                44
// 工具栏（UINavigationController.UIToolbar）高度
#define TOOLBAR_HEIGHT                      44
// 标签栏（UITabBarController.UITabBar）高度
#define TABBAR_HEIGHT                       44

// APP_STATUSBAR_HEIGHT=SYS_STATUSBAR_HEIGHT+[HOTSPOT_STATUSBAR_HEIGHT]
#define APP_STATUSBAR_HEIGHT                (CGRectGetHeight([UIApplication sharedApplication].statusBarFrame))

// 根据APP_STATUSBAR_HEIGHT判断是否存在热点栏
#define IS_HOTSPOT_CONNECTED                (APP_STATUSBAR_HEIGHT==(SYS_STATUSBAR_HEIGHT+HOTSPOT_STATUSBAR_HEIGHT)?YES:NO)
// 无热点栏时，标准系统状态栏高度+导航栏高度
#define NORMAL_STATUS_AND_NAV_BAR_HEIGHT    (SYS_STATUSBAR_HEIGHT+NAVIGATIONBAR_HEIGHT)
// 实时系统状态栏高度+导航栏高度，如有热点栏，其高度包含在APP_STATUSBAR_HEIGHT中。
#define STATUS_AND_NAV_BAR_HEIGHT           (APP_STATUSBAR_HEIGHT+NAVIGATIONBAR_HEIGHT)



#pragma mark - 调整状态栏，主要使用这两个
//顶部状态栏加导航栏高度
#define Top_STATUS_AND_NAV_HEIGHT (APP_STATUSBAR_HEIGHT==(SYS_STATUSBAR_HEIGHT+HOTSPOT_STATUSBAR_HEIGHT)?STATUS_AND_NAV_BAR_HEIGHT:NORMAL_STATUS_AND_NAV_BAR_HEIGHT)

//顶部状态栏高度
#define Top_STATUS_HEIGHT (APP_STATUSBAR_HEIGHT==(SYS_STATUSBAR_HEIGHT+HOTSPOT_STATUSBAR_HEIGHT)?APP_STATUSBAR_HEIGHT:SYS_STATUSBAR_HEIGHT)




#pragma mark - 字体尺寸

#define TitleSize(slce) [UIFont systemFontOfSize:slce]
#define TitleBoldSize(slce) [UIFont boldSystemFontOfSize:slce]

#define MaximumFont [UIFont systemFontOfSize:22]

#define LargerFont [UIFont systemFontOfSize:20]

#define BigerFont [UIFont systemFontOfSize:18]

#define BigFont [UIFont systemFontOfSize:17]

#define SmallFont [UIFont systemFontOfSize:16]

#define Size15 [UIFont systemFontOfSize:15]

#define SmallerFont [UIFont systemFontOfSize:14]

#define MinimumFont [UIFont systemFontOfSize:12]

#define MinimumerFont [UIFont systemFontOfSize:11]

#pragma mark - 系统相关尺寸
#define TopHeight (IsIos7?20:0)

#define ScreenWidth [UIScreen mainScreen].bounds.size.width

#define ScreenHeight [UIScreen mainScreen].bounds.size.height

#define Is4 (ScreenHeight==960?YES:NO)//640*960

#define Is5 (ScreenHeight==1136?YES:NO)//640*1136

#define Is6 (ScreenHeight==1134?YES:NO)//750*1134

#define Is6P (ScreenHeight==1920?YES:NO)//1080*1920

#pragma mark - 缩放比例

#define WidthScale ScreenWidth/375

#define HeightScale ScreenHeight/667


#pragma mark - 无网状态提示
#define NoNetWorkStatus @"数据获取失败，请稍后重试"

#pragma mark - 数据下载失败提示
#define NoInfo @"网络连接失败，请稍候重试"


#pragma mark - 环信SDK

#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define KNOTIFICATION_LOGINCHANGE @"loginStateChange"       //登录状态

#define CHATVIEWBACKGROUNDCOLOR [UIColor colorWithRed:0.936 green:0.932 blue:0.907 alpha:1]


#define IPhone_4    @"iPhone4"
#define IPhone_5    @"iPhone5"
#define IPhone_6    @"iPhone6"
#define IPhone_6P   @"iPhone6P"

#import <Foundation/Foundation.h>
#import "UIView+SIze.h"
#import "UIImageView+WebCache.h"

@interface JSHPublic : NSObject

@end
