//
//  GAMainResponseSDK.h
//  Geek
//
//  Created by JimmyOu on 16/6/10.
//  Copyright © 2016年 JimmyOu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GABanner;
@class GAGrab;
@class GAActivity;
@class GAProduct;
@interface GAMainResponse:NSObject
@property (nonatomic, strong) NSArray <GABanner *> *banners;
@property (nonatomic, strong) GAGrab *grab;
@property (nonatomic, strong) NSArray <GAActivity *> *activitys;
@property (nonatomic, strong) NSArray <GAActivity *> *hotactivitys;
@property (nonatomic, strong) NSArray <GAActivity *> *newtypes;
@property (nonatomic, strong) NSArray <GAProduct *> *products;
@end
@interface GABanner :NSObject
@property (nonatomic, assign) NSInteger id;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *priority;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, assign) NSInteger pdid;
@end

@interface GAGrab :NSObject
@property (nonatomic, assign) NSInteger id;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, assign) NSTimeInterval nowTime;
@property (nonatomic, assign) NSTimeInterval startTime;
@property (nonatomic, assign) NSTimeInterval endTime;
@end

@interface GAActivity :NSObject
@property (nonatomic, assign) NSInteger id;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *bType;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *priority;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString *pdid;
@end

@interface GAProduct :NSObject
@property (nonatomic, strong) NSString *rrbxProductId;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subTitle;
@property (nonatomic, strong) NSString *feature;
@property (nonatomic, strong) NSString *oldPrice;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *priceUnit;
@property (nonatomic, strong) NSString *insAmount;
@property (nonatomic, strong) NSString *serviceAward;
@property (nonatomic, strong) NSString *timeRange;
@property (nonatomic, strong) NSString *insuredAge;
@property (nonatomic, assign) NSInteger showType;
@property (nonatomic, strong) NSString *showUrl;
@property (nonatomic, strong) NSString *shareUrl;
@property (nonatomic, strong) NSString *shareContent;
@property (nonatomic, strong) NSString *shareLogo;
@property (nonatomic, strong) NSString *tags;
@property (nonatomic, assign) BOOL ishot;
@property (nonatomic, assign) NSInteger sort;
@property (nonatomic, assign) NSInteger sellCount;
@property (nonatomic, assign) NSInteger collectCount;
@property (nonatomic, assign) NSInteger eval;
@property (nonatomic, assign) NSInteger lineDownTime;
@property (nonatomic, assign) NSInteger lineUpTime;
@property (nonatomic, assign) NSInteger onlineCompensation;
@property (nonatomic, assign) NSInteger notify_type;
@property (nonatomic, assign) NSInteger status;
@end
