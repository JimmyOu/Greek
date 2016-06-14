//
//  GAProductCell.m
//  Geek
//
//  Created by JimmyOu on 16/6/10.
//  Copyright © 2016年 JimmyOu. All rights reserved.
//

#import "GAProductCell.h"
#import "GAMainResponseSDK.h"
#import "UIImageView+YYWebImage.h"
@interface GAProductCell ()
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UILabel *subTitle;
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *feature;
@property (nonatomic, strong) UILabel *buyNum;
@property (nonatomic, strong) UILabel *price;
@property (nonatomic, strong) UILabel *priceUnit;
@property (nonatomic, strong) UIView *line;
@end
@implementation GAProductCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self ) {
        [self loadUI];
    }
    return self;
}
- (void)setProduct:(GAProduct *)product {
    _product = product;
    [self updateUI];
}
- (void)loadUI {
    CGFloat priceFontSize = 14;
    CGFloat titleFontSize = 13;
    CGFloat subTitleFontSize = 11;
    CGFloat priceUnitFontSize = 10;
    CGFloat sideMagin = 5;
    CGFloat kcellWidth = kScreenWidth - 2*sideMagin;
    CGFloat kIconHeight = 180;
    
    _icon = [UIImageView new];
    _icon.frame = CGRectMake(sideMagin, sideMagin, kcellWidth, kIconHeight);
    [self.contentView addSubview:_icon];
    
    _subTitle = [UILabel new];
    _subTitle.backgroundColor = [UIColor clearColor];
    _subTitle.frame = CGRectMake(0, 0, kcellWidth, 2*subTitleFontSize);
    _subTitle.bottom = _icon.bottom - sideMagin;
    _subTitle.font = [UIFont systemFontOfSize:subTitleFontSize];
    _subTitle.textColor = [UIColor whiteColor];
    _subTitle.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_subTitle];
    
    _title = [UILabel new];
    _title.backgroundColor = [UIColor clearColor];
    _title.frame = CGRectMake(sideMagin, 0, kcellWidth, 2*titleFontSize);
    _title.bottom = _subTitle.top - sideMagin;
    _title.font = [UIFont systemFontOfSize:titleFontSize];
    _title.textColor = [UIColor whiteColor];
    _title.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_title];
    

    _feature = [UILabel new];
    _feature.backgroundColor = [UIColor clearColor];
    _feature.frame = CGRectMake(sideMagin, 0, kcellWidth, 2*subTitleFontSize);
    _feature.top = _icon.bottom + sideMagin;
    _feature.font = [UIFont systemFontOfSize:subTitleFontSize];
    _feature.textColor = [UIColor blackColor];
    _feature.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_feature];
    
    _buyNum = [UILabel new];
    _buyNum.backgroundColor = [UIColor clearColor];
    _buyNum.frame = CGRectMake(sideMagin, 0, kcellWidth, 2*subTitleFontSize);
    _buyNum.top = _icon.bottom + sideMagin;
    _buyNum.font = [UIFont systemFontOfSize:subTitleFontSize];
    _buyNum.textColor = [UIColor blackColor];
    _buyNum.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:_buyNum];
    
    _price = [UILabel new];
    _price.backgroundColor = [UIColor clearColor];
    _price.frame = CGRectMake(sideMagin, 0, kcellWidth, 2*priceFontSize);
    _price.top = _buyNum.bottom + sideMagin;
    _price.font = [UIFont systemFontOfSize:priceFontSize];
    _price.textColor = GAColor(239, 116, 8);
    _price.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_price];
    
    _priceUnit = [UILabel new];
    _priceUnit.backgroundColor = [UIColor clearColor];
    _priceUnit.frame = CGRectMake(sideMagin, 0, kcellWidth, 2*priceUnitFontSize);
    _priceUnit.top = _price.top ;
    _priceUnit.font = [UIFont systemFontOfSize:priceUnitFontSize];
    _priceUnit.textColor = [UIColor lightGrayColor];
    _priceUnit.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_priceUnit];
    
    _line = [UIView new];
    _line.frame = CGRectMake(0, _priceUnit.bottom -1, kScreenWidth, 1);
    _line.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:_line];

}
- (void)updateUI {
    [_icon setImageWithURL:[NSURL URLWithString:_product.icon] placeholder:[UIImage imageNamed:@"占位图"]];
    _title.text = _product.title;
    _subTitle.text = _product.subTitle;
    _feature.text = _product.feature;
    _buyNum.text = [NSString stringWithFormat:@"%d人购买",(int)_product.sellCount];
    _price.text = _product.price;
    [_price sizeToFit];
    _price.left = _feature.left;
    _priceUnit.text =_product.priceUnit;
    [_priceUnit sizeToFit];
    _priceUnit.left = _price.right;
    

}
@end
