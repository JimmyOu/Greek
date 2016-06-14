//
//  GAMainActivityCell.h
//  Geek
//
//  Created by JimmyOu on 16/6/10.
//  Copyright © 2016年 JimmyOu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GABanner;
@protocol GAMainActivityCellDelegate <NSObject>

- (void)didSelectedIndex:(NSInteger)index toUrl:(NSString *)url;

@end
@interface GAMainActivityCell : UITableViewCell
@property (nonatomic, strong) NSArray  <GABanner *>*banners;

@property (nonatomic, assign) id <GAMainActivityCellDelegate>delegate;
@end
