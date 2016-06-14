//
//  GAUtility.h
//  Geek
//
//  Created by JimmyOu on 16/6/10.
//  Copyright © 2016年 JimmyOu. All rights reserved.
//

#ifndef GAUtility_h
#define GAUtility_h

//手机系统
#define kIOSVersion             [[[UIDevice currentDevice] systemVersion] floatValue]

//设备
#define isIPhone4               ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960),[[UIScreen mainScreen] currentMode].size): NO)
#define isIPhone5               ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136),[[UIScreen mainScreen] currentMode].size) : NO)
#define isIPhone6               ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334),[[UIScreen mainScreen] currentMode].size) : NO)
#define isIPhone6Plus           ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208),[[UIScreen mainScreen] currentMode].size) : NO)
#define isIPhone6PlusZoomIn     ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2001),[[UIScreen mainScreen] currentMode].size) : NO)

// 获取RGB颜色
#define GAColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
//设备尺寸
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight  [UIScreen mainScreen].bounds.size.height
/**
 *  block 宏定义
 */
#define GAHandleBlock(block, ...)         if(block) { block(__VA_ARGS__); }

//日志输出定义
#ifdef DEBUG
#   define DebugLog(fmt, ...)       NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DebugLog(...)
#endif

#pragma mark - app 内使用的宏定义
#define ACHRDelegate                ((AppDelegate *)[UIApplication sharedApplication].delegate)

#endif /* GAUtility_h */
