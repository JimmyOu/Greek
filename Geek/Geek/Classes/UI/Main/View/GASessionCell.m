//
//  GASessionCell.m
//  Geek
//
//  Created by JimmyOu on 16/6/10.
//  Copyright © 2016年 JimmyOu. All rights reserved.
//

#import "GASessionCell.h"
#import "UIImageView+WebCache.h"
#import "GAMainResponseSDK.h"
static const NSInteger kCellHeight = 180;
static const NSInteger kCellMagin = 10;
@interface GASessionCell()
@property (nonatomic, strong) UIImageView *iconV;
@end
@implementation GASessionCell
- (void)setGrab:(GAGrab *)grab {
    _grab = grab;
    [self loadUI];
}
- (void)loadUI {
    _iconV = [UIImageView new];
    _iconV.contentMode = UIViewContentModeScaleAspectFill;
    _iconV.frame= CGRectMake(0, kCellMagin, kScreenWidth, kCellHeight - 2*kCellMagin);
    [self.contentView addSubview:_iconV];
    [_iconV sd_setImageWithURL:[NSURL URLWithString:_grab.icon] placeholderImage:[UIImage imageNamed:@"占位图"] options:0];
    
//    [_iconV clicked:^(UIView * _Nullable view) {
//        GAHandleBlock(_clickImage);
//    }];
}
@end
