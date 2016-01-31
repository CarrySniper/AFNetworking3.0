//
//  AFHTTPClient.m
//  AFNetworking3.0
//
//  Created by chan on 16/1/30.
//  Copyright © 2016年 CK_chan. All rights reserved.
//

#import "AFHTTPClient.h"

#define WEAKSELF  typeof(self) __weak weakSelf = self;

@implementation AFHTTPClient

//第二步：实现声明单例方法 GCD
+ (AFHTTPClient *)shareInstance
{
    static AFHTTPClient *singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [[AFHTTPClient alloc] init];
    });
    return singleton;
}

- (void)startRequestMethod:(RequestMethod)method
                parameters:(NSDictionary*)parameters
                       url:(NSString*)url
                   success:(void (^)(id responseObject))success
{
    WEAKSELF
    
    //POST 方法
    if (method == POST) {
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.requestSerializer.timeoutInterval = 30.0f;
        [manager POST:url parameters:parameters success:^(NSURLSessionTask *task, id responseObject) {
            if (success) {
                success(responseObject);
            }
        } failure:^(NSURLSessionTask *operation, NSError *error) {
            [weakSelf requestFailed:error];
        }];
    }
    //GET 方法
    else{
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.requestSerializer.timeoutInterval = 30.0f;
        [manager GET:url parameters:parameters success:^(NSURLSessionTask *task, id responseObject) {
            if (success) {
                success(responseObject);
            }
        } failure:^(NSURLSessionTask *operation, NSError *error) {
            [weakSelf requestFailed:error];
        }];
    }
}

/**
 *  请求失败回调方法
 *
 *  @param error 错误对象
 */
- (void)requestFailed:(NSError *)error
{
    NSLog(@"--------------\n%ld %@",error.code, error.debugDescription);
    switch (error.code) {
        case AFNetworkErrorType_NoNetwork :
            break;
        case AFNetworkErrorType_TimedOut :
            break;
        default:
            break;
    }
}


@end
