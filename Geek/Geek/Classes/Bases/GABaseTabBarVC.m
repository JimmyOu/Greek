//
//  GABaseTabBarVC.m
//  Geek
//
//  Created by JimmyOu on 16/6/10.
//  Copyright © 2016年 JimmyOu. All rights reserved.
//

#import "GABaseTabBarVC.h"
#import "GABaseNavigationVC.h"
#import "GAMainVC.h"
#import "GAFoundVC.h"
#import "GACommentVC.h"
#import "GAMineVC.h"

@interface GABaseTabBarVC ()

@end
@implementation GABaseTabBarVC
+ (instancetype)sharedInstance {
    static  id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
        
    });
    return sharedInstance;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
    self.tabBar.tintColor=GAColor(236, 128, 0);
    
    // 自定义tabBarView
    // 初始化所有子控制器
    [self setupAllChildViewControllers];
}
/**

/**
 *  初始化所有子控制器
 */
- (void)setupAllChildViewControllers
{
    GAMainVC *home = [[GAMainVC alloc] init];
    [self setupChildViewController:home title:@"首页"
                         imageName:@"tabbar_home"
                 selectedImageName:@"tabbar_home_selected"];
    
    GAFoundVC *foundVC = [[GAFoundVC alloc] init];
    [self setupChildViewController:foundVC title:@"发现"
                         imageName:@"tabbar_discover"
                 selectedImageName:@"tabbar_discover_selected"];
    
    GACommentVC *commentVC = [[GACommentVC alloc] init];
    [self setupChildViewController:commentVC title:@"问问"
                         imageName:@"tabbar_message_center"
                 selectedImageName:@"tabbar_message_center_selected"];

    
    GAMineVC *me = [[GAMineVC alloc] init];
    [self setupChildViewController:me title:@"我"
                         imageName:@"tabbar_profile"
                 selectedImageName:@"tabbar_profile_selected"];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

/**
 *  初始化一个子控制器
 *
 *  @param VC                子控制器
 *  @param title             标题
 *  @param imageName         图片
 *  @param selectedImageName 选中图片
 */
- (void)setupChildViewController:(UIViewController *)VC title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    
    // 给tabBarItem设置数据
    VC.title = title;
    VC.tabBarItem.image = [UIImage imageNamed:imageName];
    VC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 初始化导航控制器
    GABaseNavigationVC *nav = [[GABaseNavigationVC alloc] initWithRootViewController:VC];
    [self addChildViewController:nav];
    

}

@end
