//
//  CoreNewFeatureVC.m
//  CoreNewFeatureVC
//
//  Created by 冯成林 on 15/4/27.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#import "CoreNewFeatureVC.h"
#import "UIView+Masony.h"
#import "NewFeatureScrollView.h"
#import "NewFeatureImageV.h"
#import "UIApplication+Extend.h"
#import "CoreArchive.h"
#import "JSHDownload.h"
#import "JSHPublic.h"
#import "NLLink.h"


#import "RemoteImgListOperator.h"

NSString *const NewFeatureVersionKey = @"NewFeatureVersionKey";

@interface CoreNewFeatureVC ()


/** 模型数组 */
@property (nonatomic,strong) NSArray *models;

@property (nonatomic, strong) NSMutableArray *imageArray;

/** scrollView */
@property (nonatomic,weak) NewFeatureScrollView *scrollView;

@property (nonatomic,copy) void(^enterBlock)();

@property (nonatomic, readonly) RemoteImgListOperator *m_objRemoteImgListOper;
@property (nonatomic, readonly, copy) NSString *m_strURL;

@end

@implementation CoreNewFeatureVC
{
    NSInteger _count;
}

@synthesize m_objRemoteImgListOper = _objRemoteImgListOper;
@synthesize m_strURL = _strURL;

/*
 *  初始化
 */
+(instancetype)newFeatureVCWithModels:(NSArray *)models enterBlock:(void(^)())enterBlock{
    
    CoreNewFeatureVC *newFeatureVC = [[CoreNewFeatureVC alloc] init];
    
    newFeatureVC.models = models;
    
    //记录block
    newFeatureVC.enterBlock = enterBlock;
    
    return newFeatureVC;
}


-(void)viewDidLoad{
    
    [super viewDidLoad];
    
    //控制器准备
    [self vcPrepare];
    
    //显示了版本新特性，保存版本号
    [self saveVersion];
}

/*
 *  显示了版本新特性，保存版本号
 */
-(void)saveVersion{
    
    //系统直接读取的版本号
    NSString *versionValueStringForSystemNow=[UIApplication sharedApplication].version;
    
    //保存版本号
    [CoreArchive setStr:versionValueStringForSystemNow key:NewFeatureVersionKey];
}

/*
 *  控制器准备
 */
-(void)vcPrepare{
    
    //添加scrollView
    NewFeatureScrollView *scrollView = [[NewFeatureScrollView alloc] init];
    
    _scrollView = scrollView;

    //添加
    [self.view addSubview:scrollView];
    
    //添加约束
    [scrollView masViewAddConstraintMakeEqualSuperViewWithInsets:UIEdgeInsetsZero];
    
    //添加图片
    [self imageViewsPrepare];
}




/*
 *  添加图片
 */
-(void)imageViewsPrepare{
    
    [self.models enumerateObjectsUsingBlock:^(NewFeatureModel *model, NSUInteger idx, BOOL *stop) {
        
        NewFeatureImageV *imageV = [[NewFeatureImageV alloc] init];
        
        //设置图片
        imageV.image = model.image;
        
        //记录tag
        imageV.tag = idx;
        
        //开启交互
        imageV.userInteractionEnabled = YES;
        
        if(idx == self.models.count -1) {
            
            //添加手势
            [imageV addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureAction:)]];
            
            UIPanGestureRecognizer * swipe = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(swipeAction:)];
            
            [imageV addGestureRecognizer:swipe];
        }
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        button.userInteractionEnabled = YES;
                
        [button setFrame:CGRectMake(ScreenWidth-70, 35, 50, 25)];
        
        [button cornerRadius:5];
        [button setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.5]];
        [button setTitle:@"跳过" forState:UIControlStateNormal];
        [button setTitleColor:MyWhiteColor forState:UIControlStateNormal];
        button.titleLabel.font = TitleSize(15);
        
        [button addTarget:self action:@selector(onBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [imageV addSubview:button];
        
        [_scrollView addSubview:imageV];
    }];
}



- (void)onBtnClick:(UIButton *)sender
{
    sender.userInteractionEnabled = NO;
    [self dismiss];
}

- (void)swipeAction:(UIPanGestureRecognizer *)swipe
{
    UIView *tapView = swipe.view;
    
    //禁用
    tapView.userInteractionEnabled = NO;
    
    if(UIGestureRecognizerStateEnded == swipe.state) [self dismiss];
}

-(void)gestureAction:(UITapGestureRecognizer *)tap{
    
    UIView *tapView = tap.view;
    
    //禁用
    tapView.userInteractionEnabled = NO;
    
    if(UIGestureRecognizerStateEnded == tap.state) [self dismiss];
}

-(void)dismiss{
    
    if(self.enterBlock != nil) _enterBlock();
}

/*
 *  是否应该显示版本新特性页面
 */
+(BOOL)canShowNewFeature{
    
    //系统直接读取的版本号
    NSString *versionValueStringForSystemNow=[UIApplication sharedApplication].version;
    
    //读取本地版本号
    NSString *versionLocal = [CoreArchive strForKey:NewFeatureVersionKey];
    
    if(versionLocal!= nil && [versionValueStringForSystemNow isEqualToString:versionLocal]){//说明有本地版本记录，且和当前系统版本一致
        
        return NO;
        
    }else{//无本地版本记录或本地版本记录与当前系统版本不一致
        
        //保存
        [CoreArchive setStr:versionValueStringForSystemNow key:NewFeatureVersionKey];
        
        return YES;
    }
}

/*
 *  是否显示广告引导页
 */
+ (BOOL)canShowGuide{
    
    //图片url
    NSString *imageUrl = [CoreArchive strForKey:@"guideNew"];
    
    if (imageUrl != nil) {
        if (![imageUrl isEqualToString:[CoreArchive strForKey:@"guideOld"]]) {
            
            [CoreArchive setStr:imageUrl key:@"guideOld"];
            
            return YES;
        }else{
            return NO;
        }
    }
    return NO;
    
}




@end
