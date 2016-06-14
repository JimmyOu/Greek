//
//  GAMainResponseSDK.m
//  Geek
//
//  Created by JimmyOu on 16/6/10.
//  Copyright © 2016年 JimmyOu. All rights reserved.
//

#import "GAMainResponseSDK.h"

@implementation GAMainResponse
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{ @"banners" : [GABanner class],
              @"activitys" : [GAActivity class],
              @"hotactivitys" : [GAActivity class],
              @"newtypes" : [GAActivity class],
              @"products" : [GAProduct class]};
}
@end
@implementation GABanner

@end
@implementation GAGrab

@end

@implementation GAActivity

@end
@implementation GAProduct

@end