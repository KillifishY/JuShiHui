//
//  JSHViewController.m
//  JuShiHui
//
//  Created by 于浏洋 on 16/3/17.
//  Copyright © 2016年 JuShiHui. All rights reserved.
//

#import "JSHViewController.h"

@interface JSHViewController ()

@end

@implementation JSHViewController

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if(IsIos7){
        
        self.automaticallyAdjustsScrollViewInsets =NO;
    }
    
    self.view.backgroundColor = MyWhiteColor;//MyBackgroundColor;//默认为白色背景
    
    self.navigationController.navigationBarHidden = NO;//默认显示系统的导航栏
    
    //    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBack.png"] forBarMetrics:UIBarMetricsDefault];//默认的导航栏背景图
}

#pragma mark - 顶部左侧的按钮
- (UIButton *)makeLeftButton:(NSString *)buttonTitle withBackImageName:(NSString *)buttonBackImageName{
    
    UIButton * button = [JSHView makeButtonFrame:CGRectMake(0, TopHeight, 44, 44) withButtonTitle:buttonTitle withButtonTitleFont:SmallerFont];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    //    [button setImage:[UIImage imageNamed:buttonBackImageName] forState:UIControlStateNormal];
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(6, 6, 22, 27)];
    image.image = [UIImage imageNamed:buttonBackImageName];
    [button addSubview:image];
    
    [button addTarget:self action:@selector(rootBackButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * left = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    self.navigationItem.leftBarButtonItem = left;
    return button;
}

#pragma mark - 顶部中间的文字
- (UILabel *)makeTopTitleLabel:(NSString *)topTitleLabel{
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 40)];
    label.text = topTitleLabel;
    label.textColor = MyBlackColor;
    label.textAlignment = NSTextAlignmentCenter;
    
    self.navigationItem.titleView = label;
    
    return label;
}

#pragma mark - 顶部右侧的按钮
- (UIButton *)makeRightButton:(NSString *)buttonTitle withBackImageName:(NSString *)buttonBackImageName{
    
    return [self makeRightButton:buttonTitle withBackImageName:buttonBackImageName target:nil action:nil];
}

#pragma mark - 顶部右侧按钮进阶设置
- (UIButton *)makeRightButton:(NSString *)buttonTitle withBackImageName:(NSString *)buttonBackImageName target:(id)target action:(SEL)action
{
    
    UIButton * button = [JSHView makeButtonFrame:CGRectMake(ScreenWidth-44, TopHeight, 44, 44) withButtonTitle:buttonTitle withButtonTitleFont:SmallerFont];
    
    [button setTitleColor:MyWhiteColor forState:UIControlStateNormal];
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    [button setBackgroundImage:[UIImage imageNamed:buttonBackImageName]forState:UIControlStateNormal];
    
    //    [button setImage:[UIImage imageNamed:buttonBackImageName] forState:UIControlStateNormal];
    
    button.contentMode = UIViewContentModeScaleAspectFit;
    
    UIBarButtonItem * right = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    self.navigationItem.rightBarButtonItem = right;
    
    return button;
}

#pragma mark - 返回
- (void)rootBackButtonClick:(UIButton *)sender{
    [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"activityNickName"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    //先将未到时间执行前的任务取消。
    [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(todoRootBackButtonClick:) object:sender];
    
    [self performSelector:@selector(todoRootBackButtonClick:) withObject:sender afterDelay:0.2f];
    
}

- (void)todoRootBackButtonClick:(UIButton *)sender
{
    
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];//即使没有显示在window上，也不会自动的将self.view释放。
    // Add code to clean up any of your own resources that are no longer necessary.
    
    // 此处做兼容处理需要加上ios6.0的宏开关，保证是在6.0下使用的,6.0以前屏蔽以下代码，否则会在下面使用self.view时自动加载viewDidLoad
    if ([self.view window] == nil)// 是否是正在使用的视图
    {
        // Add code to preserve data stored in the views that might be
        // needed later.
        
        // Add code to clean up other strong references to the view in
        // the view hierarchy.
        self.view = nil;// 目的是再次进入时能够重新加载调用viewDidLoad函数。
    }
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
