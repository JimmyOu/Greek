//
//  GABaseHttpManager.h
//  Geek
//
//  Created by JimmyOu on 16/6/10.
//  Copyright © 2016年 JimmyOu. All rights reserved.
//

#import <Foundation/Foundation.h>
#define kTimeOut 30
typedef void(^SuccessBlock)(id responseBody);
typedef void (^FailureBlock)(NSString *error);
@interface GABaseHttpManager : NSObject
+ (instancetype)sharedInstance;

#pragma mark - 主页数据
- (void)getMainResponse:(NSDictionary *)userInfo url:(NSString *)url successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock;


@end
