//
//  GASessionsCell.h
//  Geek
//
//  Created by JimmyOu on 16/6/10.
//  Copyright © 2016年 JimmyOu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GAActivity;
@class GASessionsCell;
@protocol GASessionsCellDelegate <NSObject>

- (void)sessionsCell:(GASessionsCell *)cell seletedIndex:(NSInteger)index toUrl:(NSString *)url;

@end
@interface GASessionsCell : UITableViewCell
@property (nonatomic, strong) NSArray <GAActivity *> *activitys;
@property (nonatomic, assign) id<GASessionsCellDelegate> delegate;
@end
