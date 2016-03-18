//
//  RemoteImgOperator.m
//  RemoteImgListOperatorDemo
//
//  Created by jimple on 14-1-7.
//  Copyright (c) 2014年 Jimple Chen. All rights reserved.
//

#import "RemoteImgOperator.h"
#import "UIImageView+WebCache.h"

@protocol DownloadImgProgressDelegate <NSObject>

- (void)setProgress:(float)newProgress;

@end

@interface RemoteImgOperator ()

@property (nonatomic, strong) UIImageView *imageV;

//@property (nonatomic, readonly) AFHTTPSessionManager *m_objAFOper;
@property (nonatomic, readonly) id <DownloadImgProgressDelegate> downloadProgressDelegate;

@end


@implementation RemoteImgOperator
@synthesize delegate;
//@synthesize m_objAFOper = _imageV;
@synthesize downloadProgressDelegate;

- (id)init
{
    self = [super init];
    if (self)
    {
        _imageV = [[UIImageView alloc]init];
    }else{}
    return self;
}

- (void)dealloc
{
    if (_imageV)
    {
        [_imageV sd_cancelCurrentImageLoad];
        _imageV = nil;
    }else{}
    
    delegate = nil;
    downloadProgressDelegate = nil;
}

- (BOOL)getRemoteImgFromURL:(NSString *)strSrcURL
{
    return [self getRemoteImgFromURL:strSrcURL progressDelegate:nil];
}

- (BOOL)getRemoteImgFromURL:(NSString *)strSrcURL progressDelegate:(id)progress
{
    BOOL bRet = NO;
    
    [self cancelRequest];
    if (strSrcURL && (strSrcURL.length > 0))
    {
        bRet = YES;
        
        [self cancelRequest];
        downloadProgressDelegate = progress;
        
        __block NSString *blockStrURL = [strSrcURL copy];
        __weak typeof(self) blockSelf = self;
        
        [_imageV sd_setImageWithURL:[NSURL URLWithString:strSrcURL] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            if (!error) {
                @try {
                    NSData *data = UIImageJPEGRepresentation(image, 1.0);
                    if (data)
                    {
                        if (blockSelf.delegate && [blockSelf.delegate respondsToSelector:@selector(remoteImgOper:getImgSucc:fromURL:)])
                        {
                            // delegate 通知获取成功
                            [blockSelf.delegate remoteImgOper:blockSelf getImgSucc:data fromURL:blockStrURL];
                        }else{}
                    }
                    else
                    {
                        if (blockSelf.delegate && [blockSelf.delegate respondsToSelector:@selector(remoteImgOper:getImgFailedFromURL:)])
                        {
                            // delegate 通知获取失败
                            [blockSelf.delegate remoteImgOper:blockSelf getImgFailedFromURL:blockStrURL];
                        }else{}
                    }
                }
                @catch (NSException *exception) {
                    if (blockSelf.delegate && [blockSelf.delegate respondsToSelector:@selector(remoteImgOper:getImgFailedFromURL:)])
                    {
                        // delegate 通知获取失败
                        [blockSelf.delegate remoteImgOper:blockSelf getImgFailedFromURL:blockStrURL];
                    }else{}
                }
                @finally {}
            }else
            {
                
                if (blockSelf.delegate && [blockSelf.delegate respondsToSelector:@selector(remoteImgOper:getImgFailedFromURL:)])
                {
                    // delegate 通知获取失败
                    [blockSelf.delegate remoteImgOper:blockSelf getImgFailedFromURL:blockStrURL];
                }else{}
                
            }
        }];
    }
    else
    {
        bRet = NO;
    }
    
    return bRet;
}

- (void)cancelRequest
{
    if (_imageV){
        
        [_imageV sd_cancelCurrentImageLoad];
    }else{}
}

- (void)setProgressDelegate:(id)progress
{
    downloadProgressDelegate = progress;
}

- (id)getProgressDelegate
{
    return downloadProgressDelegate;
}



















@end
