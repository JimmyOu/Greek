//
//  GAMainActivityCell.m
//  Geek
//
//  Created by JimmyOu on 16/6/10.
//  Copyright © 2016年 JimmyOu. All rights reserved.
//

#import "GAMainActivityCell.h"
#import "GAMainResponseSDK.h"
#import "UIImageView+WebCache.h"
#import "YYCycleScrollView.h"
static const NSInteger kTotal =2;
@interface GAMainActivityCell () <UIScrollViewDelegate>
//@property (nonatomic, strong) UIScrollView *scrollView;
//@property (nonatomic, strong) UIPageControl *pageControl;
//@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) YYCycleScrollView *cycleView;
@end
@implementation GAMainActivityCell
//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (self) {
//        [self loadUI];
//    }
//    return self;
//}
- (void)loadUI {

}
- (void)setBanners:(NSArray<GABanner *> *)banners {
    _banners = banners;
    if (_banners.count > 0) {
    [self setUpUI];
    }
}

- (void)setUpUI {
    YYCycleScrollView *cycleScrollView = [[YYCycleScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 180) animationDuration:2.0];
    //    cycleScrollView.backgroundColor = [UIColor redColor];
    
    NSMutableArray *viewArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < _banners.count; i++) {
                GABanner *banner =  _banners[i];
        UIImageView *tempImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 180)];
        
        [tempImageView sd_setImageWithURL:[NSURL URLWithString:banner.icon]];
        
//        tempImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i+1]];
        tempImageView.contentMode = UIViewContentModeScaleAspectFill;
        tempImageView.clipsToBounds = true;
        [viewArray addObject:tempImageView];
    }
    [cycleScrollView setFetchContentViewAtIndex:^UIView *(NSInteger(pageIndex)) {
        return [viewArray objectAtIndex:pageIndex];
    }];
    [cycleScrollView setTotalPagesCount:^NSInteger{
        return _banners.count;
    }];
    [cycleScrollView setTapActionBlock:^(NSInteger(pageIndex)) {
        
        NSLog(@"点击的相关的页面%ld",(long)pageIndex);
        
    }];
    
    [self.contentView addSubview:cycleScrollView];


}

//- (void)setUpUI {
//    CGFloat imageW = kScreenWidth;
//    CGFloat imageH = 180;
//    CGFloat imageY = 0;
//    NSInteger count = kTotal;
//
//        _scrollView = [UIScrollView new];
//        _scrollView.frame = CGRectMake(0, 0, imageW, imageH);
//        _scrollView.showsVerticalScrollIndicator = NO;
//        _scrollView.showsHorizontalScrollIndicator = NO;
//        _scrollView.contentSize = CGSizeMake(count * imageW, imageH);
//        _scrollView.pagingEnabled = YES;
//        _scrollView.delegate = self;
//        [self.contentView addSubview:_scrollView];
//
//    
//    for (int i = 0; i<count; i++) {
//        GABanner *banner =  _banners[i];
//        
//        UIImageView *imageView = [UIImageView new];
//        imageView.userInteractionEnabled = YES;
//        [imageView clicked:^(UIView * _Nullable view) {
//            if ([self.delegate respondsToSelector:@selector(didSelectedIndex:toUrl:)]) {
//                [self.delegate didSelectedIndex:i toUrl:banner.url];
//            }
//        }];
//        imageView.contentMode = UIViewContentModeScaleAspectFit;
//
//        [imageView sd_setImageWithURL:[NSURL URLWithString:banner.icon]];
//        CGFloat imageX = i*imageW;
//        imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
//        [_scrollView addSubview:imageView];
//    }
//    
//    _pageControl = [UIPageControl new];
//    _pageControl.frame = CGRectMake(0, 0, 40, 20);
//    _pageControl.bottom = _scrollView.bottom - 10;
//    _pageControl.centerX = kScreenWidth*0.5;
//    _pageControl.numberOfPages = count;
//    _pageControl.currentPage = 0;
//    [self.contentView addSubview:_pageControl];
//    
//    [self addTimer];
//    
//    
//}
//
//- (void)addTimer {
////    _timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(nextpage) userInfo:nil repeats:YES];
//    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(nextpage) userInfo:nil repeats:YES];
////    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
//}
//- (void)removeTimer {
//    [_timer invalidate];
//    _timer = nil;
//}
//- (void)dealloc {
//    [self removeTimer];
//}
//- (void)nextpage {
//    
//    int current = _pageControl.currentPage;
//    DebugLog(@"current formmer %d",current);
//    if (current == kTotal) {
//        current = 0;
//    } else {
//        current++;
//    }
////    _pageControl.currentPage = current;
//    //scroll
////    DebugLog(@"current after %d",current);
//    CGFloat x = current *self.scrollView.width;
////    _scrollView.contentOffset = CGPointMake(x, 0);
//    [_scrollView setContentOffset:CGPointMake(x, 0) animated:YES];
//}
//#pragma mark – delegate (eg:UITableViewDelegate)
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    CGFloat scrollW = scrollView.width;
//    CGFloat x = scrollView.contentOffset.x;
//    int page = (x + scrollW * 0.5) / scrollW;
//    self.pageControl.currentPage = page;
//}
//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
//    [self removeTimer];
//}
//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
//    [self addTimer];
//}


@end
