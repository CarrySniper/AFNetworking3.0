//
//  AFHTTPClient.h
//  AFNetworking3.0
//
//  Created by chan on 16/1/30.
//  Copyright © 2016年 CK_chan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"


typedef NS_ENUM(NSUInteger, RequestMethod) {
    POST = 0,
    GET,
};

//错误状态码 iOS-sdk里面的 NSURLError.h 文件
typedef NS_ENUM (NSInteger, AFNetworkErrorType) {
    
    AFNetworkErrorType_TimedOut = NSURLErrorTimedOut,                               //-1001 请求超时
    AFNetworkErrorType_UnURL = NSURLErrorUnsupportedURL,                            //-1002 不支持的url
    AFNetworkErrorType_NoNetwork = NSURLErrorNotConnectedToInternet,                //-1009 断网
    AFNetworkErrorType_404Failed = NSURLErrorBadServerResponse,                     //-1011 404错误
    
};


@interface AFHTTPClient : NSObject

//第一步：创建声明单例方法
+ (AFHTTPClient *)shareInstance;


/**
 *  AFNetworking请求方法 [AFHTTPClient shareInstance]
 *
 *  @param method     请求方式 POST / GET
 *  @param parameters 请求参数
 *  @param url        请求url字符串
 *  @param success    请求成功回调block
 */
- (void)startRequestMethod:(RequestMethod)method
                parameters:(NSDictionary*)parameters
                       url:(NSString*)url
                   success:(void (^)(id responseObject))success;



@end
