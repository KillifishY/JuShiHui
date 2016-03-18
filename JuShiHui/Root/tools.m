//
//  tools.m
//  rwtyehfk
//
//  Created by 陈蜜 on 15/6/30.
//  Copyright (c) 2015年 sunyu. All rights reserved.
//

#import "tools.h"

@implementation tools


+ (NSDictionary *)dictionaryReplaceNullWithDict:(NSDictionary *)dict
{
    if (!dict) {
        
        return nil;
    }
    
    if (![dict isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
     NSDictionary *dict1;
    
    //  后台执行：
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        // something
       dict1 = [self dictionaryWithDict:dict];
//    });
    
    
    return dict1;
}


+ (NSDictionary *)dictionaryWithDict:(NSDictionary *)dict
{
    NSNull *null = [[NSNull alloc]init];
    
    NSArray *keys = [dict allKeys];
    
    NSMutableDictionary *muDict = [dict mutableCopy];
    
    for (NSString *key in keys) {
        
       id value = [muDict objectForKey:key];
        
        if (value == null) {
            
            value = @"";
            
            [muDict setObject:value forKey:key];
        }
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            value = [self dictionaryWithDict:value];
            [muDict setObject:value forKey:key];
            
        }
        
        if ([value isKindOfClass:[NSArray class]]) {
            value = [self arrayWithArray:value];
            [muDict setObject:value forKey:key];
        }
    }
    
    return muDict;
}



+ (NSArray *)arrayWithArray:(NSArray *)array
{
    NSNull *null = [[NSNull alloc]init];
    
    NSMutableArray *mutArray = [array mutableCopy];
    
    for (NSInteger i=0; i<mutArray.count; i++) {
        
        id obj = mutArray[i];
        
        if (obj == null) {
            
            obj = @"";
            
            [mutArray replaceObjectAtIndex:i withObject:obj];
        }
        
        if ([obj isKindOfClass:[NSDictionary class]]) {
            obj = [self dictionaryWithDict:obj];
            [mutArray replaceObjectAtIndex:i withObject:obj];
        }
        
        if ([obj isKindOfClass:[NSArray class]]) {
            obj = [self arrayWithArray:obj];
            [mutArray replaceObjectAtIndex:i withObject:obj];
        }
    }
    
    return mutArray;
}







@end
