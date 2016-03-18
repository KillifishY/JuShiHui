//
//  JSHTabBarViewController.m
//  JuShiHui
//
//  Created by 于浏洋 on 16/3/17.
//  Copyright © 2016年 JuShiHui. All rights reserved.
//

#import "JSHTabBarViewController.h"
#import "AppDelegate.h"
#import "HomeViewController.h"
#import "OrderViewController.h"
#import "OtherViewController.h"
#import "PersonalViewController.h"
#import "JSHNavigationViewController.h"

@interface JSHTabBarViewController ()

@end

@implementation JSHTabBarViewController{
    UIButton *_centerButton;               //tabbar中间按扭
    
    UIImageView * _tabBarBackImageView;    //自定义tabbar

    NSArray * _normalImageArray;    //没有点击时的图片
        
    NSArray * _lightImageArray;     //点击后的图片
    
    NSArray * _labelArray;          //tablebar下的文字

    /**
     *  首页
     */
    HomeViewController *_homeVC;
    /**
     *  订单
     */
    OrderViewController *_orderVC;
    /**
     *  其他
     */
    OtherViewController *_otherVC;
    /**
     *  我的
     */
    PersonalViewController *_personalVC;
    
    JSHNavigationViewController *_nav1;
    JSHNavigationViewController *_nav2;
    JSHNavigationViewController *_nav3;
    JSHNavigationViewController *_nav4;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.hidden = YES;
    
    [self makeTabBar];
    // Do any additional setup after loading the view.
}

- (void)makeTabBar{
    
    [self makeTabBarButton];
    //创建主页控制器
    _homeVC = [[HomeViewController alloc]init];
    _nav1 = [[JSHNavigationViewController alloc]initWithRootViewController:_homeVC];
    
    //创建订单控制器
    _orderVC = [[OrderViewController alloc]init];
    _nav2 = [[JSHNavigationViewController alloc]initWithRootViewController:_orderVC];
    
    //创建其他控制器
    _otherVC = [[OtherViewController alloc]init];
    _nav3 = [[JSHNavigationViewController alloc]initWithRootViewController:_otherVC];
    
    //创建我的控制器
    _personalVC = [[PersonalViewController alloc]init];
    _nav4 = [[JSHNavigationViewController alloc]initWithRootViewController:_personalVC];
    
    NSArray * viewControllers = [NSArray arrayWithObjects:_nav1,_nav2,_nav3,_nav4, nil];
    self.viewControllers = viewControllers;
    
    //用户登录状态处理
//    NSString * login = [[NSUserDefaults standardUserDefaults] objectForKey:@"LogIn"];
//    
//    if([login isEqualToString:@"YES"]){
//        self.selectedIndex = 0;
//
//        [APP_DELEGATE setNavigationController:self.viewControllers[0]];
//    }else{
//        self.selectedIndex = 4;
//        [APP_DELEGATE setNavigationController:self.viewControllers[4]];
//    }
    
}

- (void)makeTabBarButton{
    _tabBarBackImageView = [JSHView makeImageViewFrame:CGRectMake(0, ScreenHeight-56, ScreenWidth, 56) withImageName:nil];
    
    _tabBarBackImageView.backgroundColor = MyWhiteColor;
    
    _tabBarBackImageView.userInteractionEnabled = YES;
    
    [self.view addSubview:_tabBarBackImageView];
    
    [JSHView setLayerWithView:_tabBarBackImageView offset:CGSizeMake(0, -0.5) radius:1 opacity:0.5 color:MyGrayColor];
    _normalImageArray = [NSArray arrayWithObjects:@"首页－点击前",@"发现－点击前",@"消息－点击前",@"个人－点击前", nil];
    
    _lightImageArray = [NSArray arrayWithObjects:@"首页－点击后",@"发现－点击后",@"消息－点击后",@"个人－点击后", nil];
    
    _labelArray = [NSArray arrayWithObjects:@"首页",@"订单",@"其他",@"我的",nil];
    
    for (int i=0; i<[_normalImageArray count]; i++) {
        
        UIImageView * imageView = [[UIImageView alloc]init];
        [imageView setImage:[UIImage imageNamed:[_normalImageArray objectAtIndex:i]]];
        imageView.tag = 1000+i;
        
        UILabel * label = [[UILabel alloc]init];
        label.text = [_labelArray objectAtIndex:i];
        label.textColor = UIColorFromRGB(0x7e7e7e);
        label.font = TitleSize(10);
        label.tag = 2000+i;
        label.textAlignment = NSTextAlignmentCenter;
        
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = i;
        
        
        imageView.frame = CGRectMake((ScreenWidth - 100)/5 + ((ScreenWidth - 100)/5 + 25) *i, 10, 25, 25);
        button.frame = CGRectMake(0 + ScreenWidth/4 * i, 7, ScreenWidth/4, 49);
        
        label.frame = CGRectMake(imageView.frame.origin.x-10, imageView.bottom, 43, 20);
        
        if(0 == i){
            
            button.selected = YES;
            [label setTextColor:UIColorFromRGB(0xd55c4b)];
            [imageView setImage:[UIImage imageNamed:[_lightImageArray objectAtIndex:i]]];
            
        }
        [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        [_tabBarBackImageView addSubview:imageView];
        [_tabBarBackImageView addSubview:label];
        [_tabBarBackImageView addSubview:button];
    }


}
#pragma mark - 切换底部工具栏(内部调用)
- (void)buttonPressed:(id)sender
{
 
    NSInteger ind = self.selectedIndex;
    
    NSInteger index = (NSInteger)[(UIButton *)sender tag];
    self.selectedIndex = index;
    
    
    [APP_DELEGATE setNavigationController:self.viewControllers[index]];
    
    for (UIView * view in _tabBarBackImageView.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *button = (UIButton *)view;
            if (button.tag == self.selectedIndex) {
                
                button.selected = YES;
                
            }else{
                
                button.selected = NO;
                
            }
            
        }
        
        if ([view isKindOfClass:[UILabel class]]) {
            
            UILabel * label = (UILabel *)view;
            
            if(label.tag == self.selectedIndex+2000){
                
                [label setTextColor:UIColorFromRGB(0xd55c4b)];
                
            }else{
                
                [label setTextColor:UIColorFromRGB(0x7e7e7e)];
                
            }
            
        }
        
        if ([view isKindOfClass:[UIImageView class]]) {
            
            UIImageView * imageView = (UIImageView *)view;
            
            if(imageView.tag == self.selectedIndex+1000){
                
                [imageView setImage:[UIImage imageNamed:[_lightImageArray objectAtIndex:imageView.tag-1000]]];
                
            }else{
                
                [imageView setImage:[UIImage imageNamed:[_normalImageArray objectAtIndex:imageView.tag-1000]]];
                
            }
        }
    }
}

#pragma mark - 切换底部工具栏（外部调用）
- (void)changeViewControllerIndex:(int)index{
    
    [self changeViewControllerIndex:index isPush:NO];
}


#pragma mark - 切换底部工具栏（外部调用）
- (void)changeViewControllerIndex:(int)index isPush:(BOOL)isPush
{
    NSInteger ind = self.selectedIndex;
    
    self.selectedIndex = index;
    
    if (0 == index && ind == 0) {
        
        //        [_homePage reshTableView];
    }
    
    
    [APP_DELEGATE setNavigationController:self.viewControllers[index]];
    
    for (UIView * view in _tabBarBackImageView.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)view;
            if (btn.tag == index) {
                
                btn.selected=YES;
                
            }else{
                
                btn.selected=NO;
                
            }
        }
        if ([view isKindOfClass:[UILabel class]]) {
            
            UILabel * label = (UILabel *)view;
            
            if(label.tag == self.selectedIndex+2000){
                
                [label setTextColor:UIColorFromRGB(0xd55c4b)];
                
            }else{
                
                [label setTextColor:UIColorFromRGB(0x7e7e7e)];
                
            }
            
        }
        
        if ([view isKindOfClass:[UIImageView class]]) {
            
            UIImageView * imageView = (UIImageView *)view;
            
            if(imageView.tag == self.selectedIndex+1000){
                
                [imageView setImage:[UIImage imageNamed:[_lightImageArray objectAtIndex:imageView.tag-1000]]];
                
            }else{
                
                [imageView setImage:[UIImage imageNamed:[_normalImageArray objectAtIndex:imageView.tag-1000]]];
                
            }
        }
        
    }
}

#pragma mark - 隐藏底部工具栏
- (void)hiddenTabBar{
    
    _tabBarBackImageView.alpha = 0;
    
    _centerButton.alpha = 0;
}

#pragma mark - 隐藏底部工具栏（动画）
- (void)hiddenTabBarWithAnimition
{
    [UIView animateWithDuration:0.5 animations:^{
        CGRect tabBarFrame = _tabBarBackImageView.frame;
        tabBarFrame.origin.y = ScreenHeight+10;
        _tabBarBackImageView.frame = tabBarFrame;
        
        CGRect centerBtnFrame = _centerButton.frame;
        centerBtnFrame.origin.y = ScreenHeight;
        _centerButton.frame = centerBtnFrame;
        
    }];
}

#pragma mark - 状态栏改变时，更改工具栏位置
- (void)tabBarWithAnimitionChange:(BOOL)hotspotConnected
{
    if (_tabBarBackImageView.Y < ScreenHeight){
        [UIView animateWithDuration:0.1 animations:^{
            CGRect tabBarFrame = _tabBarBackImageView.frame;
            tabBarFrame.origin.y = ScreenHeight-(hotspotConnected?76:56);
            _tabBarBackImageView.frame = tabBarFrame;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.1 animations:^{
                CGPoint point = _tabBarBackImageView.center;
                _centerButton.center = point;
            }];
        }];
    }
}


#pragma mark - 显示底部工具栏
-(void)showTabBar{
    
    _tabBarBackImageView.alpha = 1;
    _centerButton.alpha = 1;
}

#pragma mark - 显示底部工具栏(动画)
- (void)showTabBarWithAnimition
{
    [UIView animateWithDuration:0.5 animations:^{
        CGRect tabBarFrame = _tabBarBackImageView.frame;
        tabBarFrame.origin.y = ScreenHeight-((CGRectGetHeight([UIApplication sharedApplication].statusBarFrame) == 40 ? YES : NO)?76:56);
        _tabBarBackImageView.frame = tabBarFrame;
        
        CGRect centerBtnFrame = _centerButton.frame;
        centerBtnFrame.origin.y = ScreenHeight-((CGRectGetHeight([UIApplication sharedApplication].statusBarFrame) == 40 ? YES : NO)?73.5:53.5);
        _centerButton.frame = centerBtnFrame;
        
    }];
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
