//
//  GAHttpManager.m
//  Geek
//
//  Created by JimmyOu on 16/6/10.
//  Copyright © 2016年 JimmyOu. All rights reserved.
//

#import "GAHttpManager.h"
#import "GAMainResponseSDK.h"
#import "NSObject+YYModel.h"
@implementation GAHttpManager
+ (instancetype)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (void)getMainItems:(NSDictionary *)userInfo successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock {
    NSString *url = [NSString stringWithFormat:@"http://api2.renrenbx.com/home/list"];
    
    [[GABaseHttpManager sharedInstance] getMainResponse:userInfo url:url
                                           successBlock:^(id responseBody) {
        NSDictionary *dic = responseBody;
        GAMainResponse *response = [GAMainResponse modelWithDictionary:dic[@"response"]];
        GAHandleBlock(successBlock,response);
    } failureBlock:^(NSString *error) {
        DebugLog(@"获取getMainItems数据失败%@",error);
    }];

}
@end
