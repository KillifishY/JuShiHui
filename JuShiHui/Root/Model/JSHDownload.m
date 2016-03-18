//
//  NLDownload.m
//  newnewle
//
//  Created by tongshunli on 15/4/2.
//  Copyright (c) 2015年 newnewle.com. All rights reserved.
//

#import "JSHDownload.h"
#import "AFNetworking.h"
#import "AFSecurityPolicy.h"
#import "CoreNewFeatureVC.h"
#define _AFNETWORKING_ALLOW_INVALID_SSL_CERTIFICATES_


@interface JSHDownload (){
    NSMutableData *dataa;
    id failure1;
    id success1;
}

@property (nonatomic, readonly) RemoteImgListOperator *m_objRemoteImgListOper;
@property (nonatomic, readonly, copy) NSString *m_strURL;

@end

@implementation JSHDownload
{
    // AFN的客户端，使用基本地址初始化，同时会实例化一个操作队列，以便于后续的多线程处理

//    AFHTTPClient    *_httpClient;
//    NSOperationQueue *_queue;
        NSInteger _count;
}
    
@synthesize m_objRemoteImgListOper = _objRemoteImgListOper;
@synthesize m_strURL = _strURL;


+ (JSHDownload *)share{
    
    static JSHDownload * nlDownload = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        nlDownload = [[[self class] alloc] init];
        
        
    });

    return nlDownload;
    
}

- (void)dealloc
{
    //致空请求
    if (manager) {
        
        [manager.operationQueue cancelAllOperations];
        manager = nil;
    }
}

- (void)downLoadFileWithUrl:(NSString *)fileStr  withSuceess:(NLDownloadSuccess)suceess failure:(NLDownloadFailure)failure
{
    fileStr = [fileStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
//    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
//    
//    manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:config];
//
    dataa = [NSMutableData data];
    NSURL *fileUrl = [NSURL URLWithString:fileStr];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:fileUrl];
    success1 = suceess;
    failure1 = failure;
    
    NSURLConnection *connection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:YES];
    [connection start];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    
//    [data writeToFile:@"address.js" atomically:YES];
    
    
    [dataa appendData:data];
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:dataa options:NSJSONReadingMutableContainers error:nil];
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/address.plist"];

    [dic writeToFile:path atomically:YES];
    if([[NSFileManager defaultManager]fileExistsAtPath:path]){
        if (success1 != nil) {
            
            NLDownloadSuccess block = success1;
            block(path);
        }
    }else{
        if (failure1 != nil) {
            NLDownloadFailure block = failure1;
            block(nil,nil);
        }
    }
}

#pragma mark - GET Request (iOS 6-7)

//GET请求
- (void)getWithUrl:(NSString *)urlStr withSuceess:(NLDownloadSuccess)suceess failure:(NLDownloadFailure)failure
{
    //致空请求
    if (manager) {
        manager = nil;
    }
    //创建请求
    manager = [AFHTTPSessionManager manager];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager.requestSerializer setTimeoutInterval:30];
    
    //发送GET请求
    [manager GET:urlStr parameters:nil success:^(NSURLSessionDataTask *operation, id responseObject) {
        
        id dict = [tools dictionaryReplaceNullWithDict:responseObject];
        
        if (suceess != nil){
            suceess(dict);
        }
        
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
        NSDictionary *errorDict = error.userInfo;
    
//        NSLog(@"%@ <><><<>>%s", errorDict[@"NSErrorFailingURLKey"], [errorDict[@"com.alamofire.serialization.response.error.data"] bytes]);
        
        if (failure != nil){
            failure(errorDict,error);
        }
    }];
}
#pragma mark - get带参数
- (void)getWithUrl:(NSString *)urlStr withParameters:(NSString *)parameter withSuceess:(NLDownloadSuccess)suceess failure:(NLDownloadFailure)failure
{
    //致空请求
    if (manager) {
        manager = nil;
    }
    NSDictionary *parameters = nil;
    if (parameter) {
        NSMutableArray *keys = [NSMutableArray array];
        NSMutableArray *values = [NSMutableArray array];
        
        NSArray *array = [parameter componentsSeparatedByString:@"&"];
        
        for (NSString *str in array) {
            NSArray *arr = [str componentsSeparatedByString:@"="];
            
            [keys addObject:arr[0]];
            [values addObject:arr[1]];
        }
        parameters = [NSDictionary dictionaryWithObjects:values forKeys:keys];
    }

    //创建请求
    manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setTimeoutInterval:30];
    
    //设置请求的解析器为AFHTTPResponseSerializer（用于直接解析数据NSData），默认为AFJSONResponseSerializer（用于解析JSON）
    //        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //发送GET请求
    [manager GET:urlStr parameters:parameters success:^(NSURLSessionDataTask *operation, id responseObject) {
        
        id dict = [tools dictionaryReplaceNullWithDict:responseObject];
        
        if (suceess != nil){
            suceess(dict);
        }
        
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
//        NSData *data = operation.responseData;
        NSDictionary *errorDict = error.userInfo;
        
//        NSLog(@"%@ <><><<>>%s", errorDict[@"NSErrorFailingURLKey"], [errorDict[@"com.alamofire.serialization.response.error.data"] bytes]);
        
        if (failure != nil){
            failure(errorDict,error);
        }
    }];
}

#pragma mark - POST Request (iOS 6-7)

//POST请求
- (void)postWithUrl:(NSString *)urlStr withPostStr:(NSString *)postStr withSuceess:(NLDownloadSuccess)suceess failure:(NLDownloadFailure)failure
{
    //致空请求
    if (manager) {
        manager = nil;
    }
    
    //添加参数
//    NSDictionary *parameters = @{@"Key": @"Object",
//                                 @"Key": @"Object"};
    
    NSDictionary *parameters = nil;
    if (postStr) {
        NSMutableArray *keys = [NSMutableArray array];
        NSMutableArray *values = [NSMutableArray array];
        
        NSArray *array = [postStr componentsSeparatedByString:@"&"];
        
        for (NSString *str in array) {
            NSArray *arr = [str componentsSeparatedByString:@"="];
            
            [keys addObject:arr[0]];
            [values addObject:arr[1]];
        }
        parameters = [NSDictionary dictionaryWithObjects:values forKeys:keys];
    }
    
    //创建请求
    manager = [AFHTTPSessionManager manager];
    
    [manager.requestSerializer setTimeoutInterval:30];
    
    //设置请求的解析器为AFHTTPResponseSerializer（用于直接解析数据NSData），默认为AFJSONResponseSerializer（用于解析JSON）
    //    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //发送POST请求
    [manager POST:urlStr parameters:parameters success:^(NSURLSessionDataTask *operation, id responseObject) {
        
        id dict = [tools dictionaryReplaceNullWithDict:responseObject];
        
        if (suceess) {
            suceess(dict);
        }
        
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
//        NSData *data = operation.responseData;
        NSDictionary *errorDict = error.userInfo;
        
        if (failure != nil){
//            NSLog(@"%@ <><><<>>%s", errorDict[@"NSErrorFailingURLKey"], [errorDict[@"com.alamofire.serialization.response.error.data"] bytes]);
            failure(errorDict,error);
        }
    }];
}


#pragma mark - Upload Request (iOS 6-7)
//上传（以表单方式上传，以图片为例）
- (void)postRequestWithURL: (NSString *)url  // IN
                postParems: (NSDictionary *)postParems // IN
              picImageDict:(NSDictionary *)picImageDict
         picImageNameArray:(NSArray *)picNameArray
                      name:(NSArray *)nameArray
                   suceess:(NLDownloadSuccess)suceess
                   failure:(NLDownloadFailure)failure
{
    
    //致空请求
    if (manager) {
        manager = nil;
    }
    
    //创建请求
    manager = [AFHTTPSessionManager manager];
    
    [manager.requestSerializer setTimeoutInterval:30];
    
    
    [manager POST:url parameters:postParems constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        for (NSInteger i=0; i < picImageDict.count; i++) {
            
            NSString *fileName = picNameArray[i];
            
            NSData *data = picImageDict[fileName];
            
            
            //[formData appendPartWithFileData:图片二进制数据 name:参数名 fileName:图片名 mimeType:@"image/*"];
            /*
             32          此方法参数
             33          1. 要上传的[二进制数据]
             34          2. 对应网站上[upload.php中]处理文件的[字段"file"]
             35          3. 要保存在服务器上的[文件名]
             36          4. 上传文件的[mimeType]
             37          */
            [formData appendPartWithFileData:data name:nameArray[i] fileName:fileName mimeType:@"image/*"];
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
//        NSLog(@"上传完成");
        
        if (suceess) {
            suceess(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure != nil){
//            NSLog(@"%@ <><><<>>%s", error.userInfo[@"NSErrorFailingURLKey"], [error.userInfo[@"com.alamofire.serialization.response.error.data"] bytes]);
            
            failure(error.userInfo,error);
        }
    }];
}


#pragma mark - 删除请求
- (void)deleteWithUrl:(NSString *)url
                 Path:(NSString *)path
        parameters:(NSDictionary *)parameters
           suceess:(NLDownloadSuccess)suceess
            failure:(NLDownloadFailure)failure
{
    
    //致空请求
    if (manager) {
        manager = nil;
    }
    
    //创建请求
    manager = [AFHTTPSessionManager manager];
    
    [manager.requestSerializer setTimeoutInterval:30];
    
//    ((AFJSONResponseSerializer *)manager.responseSerializer).removesKeysWithNullValues = YES;
    
    //设置请求的解析器为AFHTTPResponseSerializer（用于直接解析数据NSData），默认为AFJSONResponseSerializer（用于解析JSON）
    //    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //发送DELETE请求
    [manager DELETE:url parameters:parameters success:^(NSURLSessionDataTask *operation, id responseObject) {
        id dict = [tools dictionaryReplaceNullWithDict:responseObject];
        
        if (suceess) {
            suceess(dict);
        }
        
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
//        NSData *data = operation.responseData;
        NSDictionary *errorDict = error.userInfo;
        NSLog(@"%@ <><><<>>%s", errorDict[@"NSErrorFailingURLKey"], [errorDict[@"com.alamofire.serialization.response.error.data"] bytes]);
        if (failure != nil){
            failure(errorDict,error);
        }
    }];

}



- (void)putWithUrl:(NSString *)url
              Path:(NSString *)path
     parameters:(NSDictionary *)parameters
           suceess:(NLDownloadSuccess)suceess
           failure:(NLDownloadFailure)failure
{
    //致空请求
    if (manager) {
        manager = nil;
    }
    
    //创建请求
    manager = [AFHTTPSessionManager manager];
    
    [manager.requestSerializer setTimeoutInterval:30];
    
    [manager PUT:url parameters:parameters success:^(NSURLSessionDataTask *operation, id responseObject) {
        
//        NSLog(@"%s", operation.responseData.bytes);
        
        id dict = [tools dictionaryReplaceNullWithDict:responseObject];
        
        if (suceess) {
            suceess(dict);
        }

    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        
//        NSData *data = operation.responseData;
        NSDictionary *errorDict = error.userInfo;
//        NSLog(@"%@ <><><<>>%s", errorDict[@"NSErrorFailingURLKey"], [errorDict[@"com.alamofire.serialization.response.error.data"] bytes]);
        if (failure != nil){
            failure(errorDict,error);
        }
    }];
}



/*
 *  向服务器加载广告信息
 */
//- (void)getGuideImage
//{
//    [[JSHDownload share]getWithUrl:GUIDE_URL withSuceess:^(id information) {
//   
//        NSMutableArray *imageArray = [NSMutableArray array];
//        
//        if ([[NSString stringWithFormat:@"%@", information[@"status"]]isEqualToString:@"200"]) {
//            
//            if ([information[@"data"] count]>0) {
//                
//                if ([information[@"data"][@"list"] count] != 0) {
//                    if (![[CoreArchive strForKey:@"guide"]isEqualToString:information[@"data"][@"list"][0][@"img"]]) {
//                        
//                        [CoreArchive setStr:information[@"data"][@"list"][0][@"img"] key:@"guideNew"];
//                        
//                        for (NSDictionary *dict in information[@"data"][@"list"]) {
//                            
//                            [imageArray addObject:dict[@"img"]];
//                            
//                        }
//                        //                    if ([CoreNewFeatureVC canShowGuide]){
//                        [self getImagesWithArray:imageArray];
//                        //                    }
//                    }
//                }
//
//            }
//        }
//    } failure:^(NSDictionary *errorDict, NSError *error) {
//        
////        NSLog(@"%@", error.description);
//        
//    }];
//}


- (void)getImagesWithArray:(NSArray *)array
{
    
    // 创建一个队列对象，以便在当前页面内统一控制下载数量。
    // 页面不需响应图片下载完成的通知，将队列对象扔给具体需显示图片的TableViewCell，由Cell响应通知并显示图片。
    _objRemoteImgListOper = [[RemoteImgListOperator alloc] init];
    [_objRemoteImgListOper resetListSize:array.count];
    [CoreArchive setInt:array.count key:@"guideCount"];
    
    for (NSString *strURL in array) {
        // 页面不需响应图片下载完成的通知，将队列对象扔给具体需显示图片的TableViewCell，由Cell响应通知并显示图片。
        [self setRemoteImgOper:_objRemoteImgListOper];
        [self showImgByURL:strURL];
    }
}

- (void)setRemoteImgOper:(RemoteImgListOperator *)objOper
{
    if (_objRemoteImgListOper)
    {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:_objRemoteImgListOper.m_strSuccNotificationName object:nil];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:_objRemoteImgListOper.m_strFailedNotificationName object:nil];
    }else{}
    
    _objRemoteImgListOper = objOper;
    
    if (_objRemoteImgListOper)
    {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(remoteImgSucc:)
                                                     name:_objRemoteImgListOper.m_strSuccNotificationName
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(remoteImgFailed:)
                                                     name:_objRemoteImgListOper.m_strFailedNotificationName
                                                   object:nil];
    }else{}
    
}

- (void)showImgByURL:(NSString *)strURL
{
    _strURL = strURL ? strURL : @"";
    
    __block NSString *blockStrURL = [strURL copy];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            if (blockStrURL.length > 1)
            {
                // 从网络下载
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (_objRemoteImgListOper)
                    {
                        [_objRemoteImgListOper getRemoteImgByURL:blockStrURL withProgress:nil];
                    }else{}
                });
            }else{}
        });
    });
}

#pragma mark - RemoteImgListOper notification
// 响应下载完成的通知，并保存图片。
- (void)remoteImgSucc:(NSNotification *)noti
{
    if (noti && noti.userInfo && noti.userInfo.allKeys && (noti.userInfo.allKeys.count > 0))
    {
        NSString *strURL;
//        NSData *dataImg;
        
        strURL = [noti.userInfo.allKeys objectAtIndex:0];
//        dataImg = [noti.userInfo objectForKey:strURL];
        if (_strURL && [_strURL isEqualToString:strURL])
        {
            
        }else{}
        
    }else{}
}

- (void)remoteImgFailed:(NSNotification *)noti
{
    if (noti && noti.userInfo && noti.userInfo.allKeys && (noti.userInfo.allKeys.count > 0))
    {
        NSString *strURL;
        strURL = [noti.userInfo.allKeys objectAtIndex:0];
        if (_strURL && [_strURL isEqualToString:strURL])
        {
            
        }else{}
        
    }else{}
}


/*
 *  关闭请求
 */
- (void)closeRequest{
    
    [manager.operationQueue cancelAllOperations];
    manager = nil;
    
}



+ (BOOL)extractIdentity:(SecIdentityRef *)outIdentity andTrust:(SecTrustRef*)outTrust fromPKCS12Data:(NSData *)inPKCS12Data {
    OSStatus securityError = errSecSuccess;
    
    // 证书密钥
    NSDictionary *optionsDictionary = [NSDictionary dictionaryWithObject:@"testHttps"
                                                                  forKey:(__bridge id)kSecImportExportPassphrase];
    
    CFArrayRef items = CFArrayCreate(NULL, 0, 0, NULL);
    securityError = SecPKCS12Import((__bridge CFDataRef)inPKCS12Data,(__bridge CFDictionaryRef)optionsDictionary,&items);
    
    if (securityError == 0) {
        CFDictionaryRef myIdentityAndTrust = CFArrayGetValueAtIndex (items, 0);
        const void *tempIdentity = NULL;
        tempIdentity = CFDictionaryGetValue (myIdentityAndTrust, kSecImportItemIdentity);
        *outIdentity = (SecIdentityRef)tempIdentity;
        const void *tempTrust = NULL;
        tempTrust = CFDictionaryGetValue (myIdentityAndTrust, kSecImportItemTrust);
        *outTrust = (SecTrustRef)tempTrust;
    } else {
        NSLog(@"Failed with error code %d",(int)securityError);
        return NO;  
    }  
    return YES;  
}

- (AFSecurityPolicy*)customSecurityPolicy {
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"service" ofType:@"cer"];
    NSData *certData = [NSData dataWithContentsOfFile:cerPath];
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    [securityPolicy setAllowInvalidCertificates:YES];
    [securityPolicy setPinnedCertificates:@[certData]];
    /**** SSL Pinning ****/
    return securityPolicy;
}


@end
