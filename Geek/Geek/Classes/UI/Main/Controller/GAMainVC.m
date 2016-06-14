//
//  GAMainVC.m
//  Geek
//
//  Created by JimmyOu on 16/6/10.
//  Copyright © 2016年 JimmyOu. All rights reserved.
//

#import "GAMainVC.h"
#import "GAHttpManager.h"
#import "GAMainResponseSDK.h"
#import "GAWebViewVC.h"
//cell types
#import "GAMainActivityCell.h"
#import "GABannerCell.h"
#import "GASessionCell.h"
#import "GASessionsCell.h"
#import "GAProductCell.h"

@interface GAMainVC ()<UITableViewDelegate,UITableViewDataSource,GASessionsCellDelegate>


//data from net
@property (nonatomic, strong) NSArray *banners;
@property (nonatomic, strong) GAMainResponse *response;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *cellHeights;

@end
@implementation GAMainVC
#pragma mark – VC life cycle
/**
 *  @property (nonatomic, strong) NSArray <GABanner *> *banners;
 @property (nonatomic, strong) GAGrab *grab;
 @property (nonatomic, strong) NSArray <GAActivity *> *activitys;
 @property (nonatomic, strong) NSArray <GAActivity *> *hotactivitys;
 @property (nonatomic, strong) NSArray <GAActivity *> *newtypes;
 @property (nonatomic, strong) NSArray <GAProduct *> *products;
 */

- (BOOL)prefersStatusBarHidden {
    return YES;
}
- (void)viewDidLoad{
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    [self loadUI];
    [self requestData];
    _cellHeights = @[@(180),@(0.5*kScreenWidth),@(180),@(150),@(250)];//180
    
}
- (void)requestData {
    [self showHUDWithString:@"Lording"];
    [[GAHttpManager sharedInstance] getMainItems:nil successBlock:^(GAMainResponse * responseBody) {
        [self hideHUD];
        _response = responseBody;
        [self.tableView reloadData];
    } failureBlock:^(NSString *error) {
        [self hideHUD];
    }];
}
- (void)loadUI {
    _tableView = [[UITableView alloc] initWithFrame:self.contentView.bounds style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.delegate = self;
    _tableView.dataSource =self;
    _tableView.frame = self.contentView.bounds;
    [self.contentView addSubview:_tableView];
       
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
#pragma mark - delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section != 4) {
        return 1;
    } else {
        return _response.products.count;
    }
}
- (void)sessionsCell:(GASessionsCell *)cell seletedIndex:(NSInteger)index toUrl:(NSString *)url {
    GAWebViewVC *webVC = [GAWebViewVC new];
    webVC.url = url;
    [self pushViewController:webVC animated:YES];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        GAMainActivityCell *cell = [[GAMainActivityCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        cell.banners = _response.banners;
        return cell;
    }else if (indexPath.section == 1) {
        GABannerCell *cell = [[GABannerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
#warning - need do something here
        return cell;
    
    }else if (indexPath.section == 2) {
        GASessionCell *cell = [[GASessionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        cell.grab = _response.grab;
        return cell;
    
    } else if (indexPath.section == 3) {
        GASessionsCell *cell = [[GASessionsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        
        cell.activitys = _response.hotactivitys;
        cell.delegate = self;
        return cell;
    
    }else {
        static NSString *kCellIdentifier = @"CellIdentifier";
        GAProductCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
        if (!cell) {
            cell = [[GAProductCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellIdentifier];
        }
        cell.product = _response.products[indexPath.row];
        
        return cell;
    
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSNumber *height = _cellHeights[indexPath.section];
    return [height floatValue];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 2) {
        GAWebViewVC *webVC = [GAWebViewVC new];
        webVC.url = _response.grab.url;
//        webVC.title = @"旅游";
        [self pushViewController:webVC animated:YES];
    } else if (indexPath.section == 4) {
        GAWebViewVC *webVC = [GAWebViewVC new];
        GAProduct *product= _response.products[indexPath.row];
        webVC.url = product.shareUrl;
        //        webVC.title = @"旅游";
        [self pushViewController:webVC animated:YES];
    }
}
#pragma mark – event (eg:button clicked)
#pragma mark – public method
#pragma mark – private method
#pragma mark – getters and setters

@end
