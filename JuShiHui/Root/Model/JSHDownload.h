//
//  NLDownload.h
//  newnewle
//
//  Created by tongshunli on 15/4/2.
//  Copyright (c) 2015年 newnewle.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CoreArchive.h"
#import "RemoteImgListOperator.h"
#import "NLLink.h"
#import "AFNetworking.h"
//#import "tools.h"

#define IOS_VN [[UIDevice currentDevice].systemVersion doubleValue]

@interface JSHDownload : NSObject<NSURLConnectionDataDelegate>
{
    AFHTTPSessionManager *manager; //创建请求（iOS 6-7）
    
#ifndef  __IPHONE_7_0 //<= IOS_VN
    AFURLSessionManager *manager;    //创建请求（iOS7专用）
#endif
    
    
    
//    AFHTTPRequestOperation *operation;      //创建请求管理（用于上传和下载）
}

+ (JSHDownload *)share;

#pragma mark - 请求成功后的回调
typedef void (^NLDownloadSuccess)(id information);

#pragma mark - 请求失败后的回调
typedef void (^NLDownloadFailure)(NSDictionary *errorDict ,NSError *error);

#pragma mark - post方式 (普通)
- (void)postWithUrl:(NSString *)urlStr withPostStr:(NSString *)postStr withSuceess:(NLDownloadSuccess)suceess failure:(NLDownloadFailure)failure;//postStr需要post的数据（格式：%@=%@&%@=%@）

#pragma mark - get方式
- (void)getWithUrl:(NSString *)urlStr withSuceess:(NLDownloadSuccess)suceess failure:(NLDownloadFailure)failure;
#pragma mark - get方式(带参数)
- (void)getWithUrl:(NSString *)urlStr withParameters:(NSString *)parameter withSuceess:(NLDownloadSuccess)suceess failure:(NLDownloadFailure)failure;


//上传（以表单方式上传，以图片为例）
- (void)postRequestWithURL: (NSString *)url  // IN
                   postParems: (NSDictionary *)postParems // IN
                 picImageDict:(NSDictionary *)picImageDict
            picImageNameArray:(NSArray *)picNameArray
                         name:(NSArray *)nameArray
                      suceess:(NLDownloadSuccess)suceess
                      failure:(NLDownloadFailure)failure;


- (void)downLoadFileWithUrl:(NSString *)fileStr  withSuceess:(NLDownloadSuccess)suceess failure:(NLDownloadFailure)failure;
#pragma mark - PUT请求
/**
 *  @param url 地址链接
 *
 *  @param path 追加的参数
 *
 *  @param parameters  要处理的数据
 *
 **/
- (void)putWithUrl:(NSString *)url
              Path:(NSString *)path
     parameters:(NSDictionary *)parameters
        suceess:(NLDownloadSuccess)suceess
        failure:(NLDownloadFailure)failure;


#pragma mark - DELETE请求
- (void)deleteWithUrl:(NSString *)url
                 Path:(NSString *)path
        parameters:(NSDictionary *)parameters
           suceess:(NLDownloadSuccess)suceess
           failure:(NLDownloadFailure)failure;


/*
 *  向服务器加载广告信息
 */
- (void)getGuideImage;

/*
 *  关闭请求
 */
- (void)closeRequest;

- (void)checkNetwork;

@end
