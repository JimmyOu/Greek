//
//  GAHttpManager.h
//  Geek
//
//  Created by JimmyOu on 16/6/10.
//  Copyright © 2016年 JimmyOu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GABaseHttpManager.h"
@interface GAHttpManager : NSObject
+ (instancetype)sharedInstance;

//主页信息
- (void)getMainItems:(NSDictionary *)userInfo successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock;

@end
