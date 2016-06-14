//
//  GASessionsCell.m
//  Geek
//
//  Created by JimmyOu on 16/6/10.
//  Copyright © 2016年 JimmyOu. All rights reserved.
//

#import "GASessionsCell.h"
#import "UIImageView+WebCache.h"
#import "GAMainResponseSDK.h"
@interface  GASessionsCell()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
//@property (nonatomic, strong) UIPageControl *pageControl;
@end
@implementation GASessionsCell{
    NSInteger _count;
}

- (void)setActivitys:(NSArray<GAActivity *> *)activitys {
    
    if(activitys.count > 0) {
        _activitys = activitys;
        [self setUpUI];
    }

}
- (void)setUpUI {
    CGFloat magin = 10;
    CGFloat imageW = 0.4 * kScreenWidth;
    CGFloat imageH = 150 - 2 * 10;
    CGFloat imageY = 0;
    _count = _activitys.count;
    
    _scrollView = [UIScrollView new];
    _scrollView.frame = CGRectMake(0, 0, kScreenWidth, 150);
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.contentSize = CGSizeMake(_count * imageW + 3*magin, imageH);
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    [self.contentView addSubview:_scrollView];
    

    
    for (int i = 0; i<_count; i++) {
        GAActivity *activity =  _activitys[i];
        UIImageView *imageView = [UIImageView new];
        imageView.userInteractionEnabled = YES;
        [imageView clicked:^(UIView * _Nullable view) {
            if ([self.delegate respondsToSelector:@selector(sessionsCell:seletedIndex:toUrl:)]) {
                [self.delegate sessionsCell:self seletedIndex:i toUrl:activity.url];
            }
        }];
        [imageView sd_setImageWithURL:[NSURL URLWithString:activity.icon] placeholderImage:[UIImage imageNamed:@"占位图"] options:0];
        CGFloat imageX = i*(imageW+magin);
        imageView.backgroundColor = [UIColor redColor];
        imageView.frame = CGRectMake(imageX, magin, imageW, imageH);
        [_scrollView addSubview:imageView];
    }
    

}





@end
