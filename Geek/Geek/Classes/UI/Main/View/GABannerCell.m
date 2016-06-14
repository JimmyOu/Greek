//
//  GABannerCell.m
//  Geek
//
//  Created by JimmyOu on 16/6/10.
//  Copyright © 2016年 JimmyOu. All rights reserved.
//

#import "GABannerCell.h"

@interface GABannerCell ()
@property (nonatomic, strong) UIView *storeView;
@property (nonatomic, strong) UIView *privilege;
@property (nonatomic, strong) UIView *fresh;
@property (nonatomic, strong) UIView *newestActivity;

@property (nonatomic, strong) UIView *line1;
@property (nonatomic, strong) UIView *line2;
@property (nonatomic, strong) UIView *line3;

@end
@implementation GABannerCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ( self) {
        [self setUpUI];
    }
    return self;
}
- (void)setUpUI {
    
    //macro
    CGFloat storeViewW = 0.5*kScreenWidth;
    CGFloat storeViewHeight = storeViewW;
    CGFloat sideMagin = 15;
    NSInteger titleFontSize = 13;
    NSInteger titleSubSize = 10;
    
    /*******保险商城*******/
    _storeView = [UIView new];
    _storeView.frame = CGRectMake(0, 0, storeViewW, storeViewHeight);
    [_storeView clicked:^(UIView * _Nullable view) {
        //do something here
    }];
    
    UIImageView *storeImageV = [UIImageView new];
    storeImageV.userInteractionEnabled = YES;
    storeImageV.image = [UIImage imageNamed:@"store"];
//    storeImageV.contentMode = UIViewContentModeScaleAspectFit;
    storeImageV.size = storeImageV.image.size;
//    storeImageV.origin = CGPointMake(0, 0);
    storeImageV.centerX = 0.25*kScreenWidth;
    storeImageV.top = 30;
//    storeImageV.frame = _storeView.bounds;
    
    [_storeView addSubview:storeImageV];
    
    UILabel *storeSub = [UILabel new];
    storeSub.text = @"我们只给你最好的";
    [storeSub sizeToFit];
    storeSub.textAlignment = NSTextAlignmentCenter;
    storeSub.textColor = [UIColor blackColor];
    storeSub.font = [UIFont systemFontOfSize:titleSubSize];
    storeSub.centerX = 0.5*storeViewW;
    storeSub.bottom = storeViewHeight - sideMagin;
    [_storeView addSubview:storeSub];
    
    UILabel *storeTitle = [UILabel new];
    storeTitle.text = @"保险商城";
    [storeTitle sizeToFit];
    storeTitle.textColor = [UIColor blackColor];
    storeTitle.font = [UIFont systemFontOfSize:titleFontSize];
    storeTitle.centerX = 0.5*storeViewW;
    storeTitle.bottom = storeSub.top - sideMagin;
    [_storeView addSubview:storeTitle];

    [self.contentView addSubview:_storeView];
    
    /*******达人专享*******/
    _privilege = [UIView new];
    _privilege.frame = CGRectMake(0.5*kScreenWidth , 0, storeViewW, 0.25 * kScreenWidth);
    [_privilege clicked:^(UIView * _Nullable view) {
        //do something here
    }];
    
    UIImageView *privilegeImageV = [UIImageView new];
    privilegeImageV.userInteractionEnabled = YES;
    privilegeImageV.image = [UIImage imageNamed:@"activity"];
//    privilegeImageV.contentMode = UIViewContentModeScaleAspectFit;
//    privilegeImageV.frame = _privilege.bounds;
    privilegeImageV.size = privilegeImageV.image.size;
    privilegeImageV.centerX = _privilege.width * 0.5;
    privilegeImageV.top = 10;
    [_privilege addSubview:privilegeImageV];
    
    [self.contentView addSubview:_privilege];

    /*******新客专享*******/
    _fresh = [UIView new];
    _fresh.frame = CGRectMake(0.5*kScreenWidth, 0.25*kScreenWidth, 0.25*kScreenWidth, 0.25*kScreenWidth);
    [_fresh clicked:^(UIView * _Nullable view) {
        //do something here
    }];
    
    UIImageView *freshImageV = [UIImageView new];
    freshImageV.userInteractionEnabled = YES;
    freshImageV.image = [UIImage imageNamed:@"gift"];
//    freshImageV.contentMode = UIViewContentModeScaleAspectFit;
//    freshImageV.frame = _fresh.bounds;
    freshImageV.size = freshImageV.image.size;
    freshImageV.centerX = _fresh.width *0.5;
    freshImageV.top = 10;
    [_fresh addSubview:freshImageV];
    
    UILabel *freshLable = [UILabel new];
    freshLable.text = @"新客专享";
    freshLable.textAlignment = NSTextAlignmentCenter;
    [freshLable sizeToFit];
    freshLable.textColor = [UIColor blackColor];
    freshLable.font = [UIFont systemFontOfSize:titleSubSize];
    freshLable.centerX = 0.5*_fresh.width;
    freshLable.bottom = _fresh.height - 5;
    [_fresh addSubview:freshLable];
    
    [self.contentView addSubview:_fresh];

    
    /*******最新活动*******/
    _newestActivity = [UIView new];
    _newestActivity.frame = CGRectMake(0.75*kScreenWidth, 0.25*kScreenWidth, 0.25*kScreenWidth, 0.25*kScreenWidth);
    [_newestActivity clicked:^(UIView * _Nullable view) {
        //do something here
    }];
    
    UIImageView *newestImageV = [UIImageView new];
    newestImageV.userInteractionEnabled = YES;
    newestImageV.image = [UIImage imageNamed:@"newActivity"];
//    newestImageV.contentMode = UIViewContentModeScaleAspectFit;
//    newestImageV.frame = _newestActivity.bounds;
    newestImageV.size = newestImageV.image.size;
    newestImageV.centerX = _newestActivity.width * 0.5;
    newestImageV.top = 10;
    [_newestActivity addSubview:newestImageV];
    
    UILabel *newestLable = [UILabel new];
    newestLable.text = @"最新活动";
    [newestLable sizeToFit];
    newestLable.textAlignment = NSTextAlignmentCenter;
    newestLable.textColor = [UIColor blackColor];
    newestLable.font = [UIFont systemFontOfSize:titleSubSize];
    newestLable.centerX = 0.5*_newestActivity.width;
    newestLable.bottom = _newestActivity.height - 5;
    [_newestActivity addSubview:newestLable];
    
    [self.contentView addSubview:_newestActivity];
    
    //
    _line1 = [UIView new];
    _line1.backgroundColor = [UIColor lightGrayColor];
    _line1.frame = CGRectMake(0.5*kScreenWidth, 0, 1, 0.5*kScreenWidth);
    [self.contentView addSubview:_line1];
    
    _line2 = [UIView new];
    _line2.backgroundColor = [UIColor lightGrayColor];
    _line2.frame = CGRectMake(0.5*kScreenWidth, 0.25*kScreenWidth, 0.5*kScreenWidth, 1);
    [self.contentView addSubview:_line2];
    
    _line3 = [UIView new];
    _line3.backgroundColor = [UIColor lightGrayColor];
    _line3.frame = CGRectMake(0.75*kScreenWidth, 0.25*kScreenWidth, 1, 0.25*kScreenWidth);
    [self.contentView addSubview:_line3];
    
}
@end
