//
//  GABaseNavigationVC.m
//  Geek
//
//  Created by JimmyOu on 16/6/10.
//  Copyright © 2016年 JimmyOu. All rights reserved.
//

#import "GABaseNavigationVC.h"

@implementation GABaseNavigationVC
- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        if (kIOSVersion >= 7.0) {
            self.navigationBar.barTintColor = [UIColor colorWithWhite:1 alpha:0.05];
        } else {
            self.navigationBar.barTintColor = [UIColor colorWithWhite:1 alpha:0.05];
            
            UIView *statusV = [[UIView alloc] initWithFrame:(CGRect){0, -20, kScreenWidth, 20}];
            [statusV setBackgroundColor:[UIColor blackColor]];
            [self.navigationBar addSubview:statusV];
        }
    }
    return self;
}

+ (void)initialize
{
    // 设置BarButtonItem
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    NSMutableDictionary *normal = [NSMutableDictionary dictionary];
    normal[NSForegroundColorAttributeName] = GAColor(239, 116, 8);
    normal[NSFontAttributeName] = [UIFont systemFontOfSize:15.0];
    [item setTitleTextAttributes:normal forState:UIControlStateNormal];
    
    NSMutableDictionary *disabled = [NSMutableDictionary dictionary];
    disabled[NSForegroundColorAttributeName] = GAColor(111, 111, 111);
    disabled[NSFontAttributeName] = [UIFont systemFontOfSize:15.0];
    [item setTitleTextAttributes:disabled forState:UIControlStateDisabled];
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
    
}
@end
