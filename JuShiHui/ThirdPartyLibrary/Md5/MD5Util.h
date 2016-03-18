//
//  MD5Util.h
//  twocloo
//
//  Created by 佟顺利 on 14-11-19.
//  Copyright (c) 2014年 twocloo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h> 

//md5 加密
@interface MD5Util : NSObject {

}

+ (NSString *) md5:(NSString *)str;
+ (NSString *) md5ForFileContent:(NSString *)file;
+ (NSString *) md5ForData:(NSData *)data;

@end
