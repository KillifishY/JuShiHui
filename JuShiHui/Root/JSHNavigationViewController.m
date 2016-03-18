//
//  JSHNavigationViewController.m
//  JuShiHui
//
//  Created by 于浏洋 on 16/3/17.
//  Copyright © 2016年 JuShiHui. All rights reserved.
//

#import "JSHNavigationViewController.h"

@interface JSHNavigationViewController ()

@end

@implementation JSHNavigationViewController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    if (self = [super initWithRootViewController:rootViewController]) {
        
        [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBack.png"] forBarMetrics:UIBarMetricsDefault];
        // 设置navigationBar是否透明，不透明的话会使可用界面原点下移（0，0）点为导航栏左下角下方的那个点
        self.navigationBar.translucent = NO;
        // 设置navigationBar是不是使用系统默认返回，默认为YES
        self.interactivePopGestureRecognizer.enabled = YES;
        // 创建一个颜色，便于之后设置颜色使用
        UIColor * color = [UIColor whiteColor];
        // 设置navigationBar元素的背景颜色，不包括title
        self.navigationBar.tintColor = color;
        // 设置navigationController的title的字体颜色
        NSDictionary * dict=[NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
        self.navigationBar.titleTextAttributes = dict;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 为self创建弱引用对象
    __weak typeof (self) weakSelf = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
