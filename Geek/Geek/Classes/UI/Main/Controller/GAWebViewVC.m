//
//  GAWebViewVC.m
//  Geek
//
//  Created by JimmyOu on 16/6/10.
//  Copyright © 2016年 JimmyOu. All rights reserved.
//

#import "GAWebViewVC.h"
@interface GAWebViewVC()
@property (nonatomic, strong) UIWebView *webView;
@end
@implementation GAWebViewVC
#pragma mark – VC life cycle
- (void)viewDidLoad{
    [super viewDidLoad];
    _webView = [UIWebView new];
    _webView.frame = self.contentView.bounds;
    [self.contentView addSubview:_webView];
    self.navigationController.navigationBar.hidden = YES;
    
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_url]]];
//    self.title = @"旅游";
//    self.navigationController.title = @"旅游";
}
- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

#pragma mark – delegate (eg:UITableViewDelegate)
#pragma mark – event (eg:button clicked)
#pragma mark – public method
#pragma mark – private method
#pragma mark – getters and setters

@end
