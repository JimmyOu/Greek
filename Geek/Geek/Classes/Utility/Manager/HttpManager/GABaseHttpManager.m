//
//  GABaseHttpManager.m
//  Geek
//
//  Created by JimmyOu on 16/6/10.
//  Copyright © 2016年 JimmyOu. All rights reserved.
//

#import "GABaseHttpManager.h"
#import "AFNetworking.h"
@implementation GABaseHttpManager
+ (instancetype)sharedInstance {
    static id shareInstace = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstace = [[self alloc] init];
    });
    return shareInstace;
}
- (AFHTTPSessionManager *)baseHttpRequest {
    AFHTTPSessionManager *httpSessionManager = [[AFHTTPSessionManager alloc] init];
    [httpSessionManager.requestSerializer setTimeoutInterval:kTimeOut];
    //    //header 设置
    [httpSessionManager.requestSerializer setValue:@"api2.renrenbx.com" forHTTPHeaderField:@"Host"];
    [httpSessionManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [httpSessionManager.requestSerializer setValue:@"RRBXI" forHTTPHeaderField:@"rrbx-app"];

    
    [httpSessionManager.requestSerializer setValue:@"zh-Hans-CN;q=1, en-CN;q=0.9, zh-Hant-CN;q=0.8" forHTTPHeaderField:@"Accept-Language"];
    [httpSessionManager.requestSerializer setValue:@"gzip;q=1.0,compress;q=0.5" forHTTPHeaderField:@"Accept-Encoding"];

    [httpSessionManager.requestSerializer setValue:@"renrenbx/com.huibao.renrenbaoxian (1; OS Version 9.3.2 (Build 13F69))" forHTTPHeaderField:@"User-Agent"];
    [httpSessionManager.requestSerializer setValue:@"2.2.3" forHTTPHeaderField:@"rrbx-app-v"];
    
    //response 设置
    httpSessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"text/html", @"application/json", nil];
    
    return httpSessionManager;
}

- (void)getMainResponse:(NSDictionary *)userInfo url:(NSString *)url successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock {
    AFHTTPSessionManager *manager = [self baseHttpRequest];
    NSString *urlStr = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [manager GET:urlStr parameters:nil progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        GAHandleBlock(successBlock,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        GAHandleBlock(failureBlock,error.localizedDescription);
    }];

}

@end
