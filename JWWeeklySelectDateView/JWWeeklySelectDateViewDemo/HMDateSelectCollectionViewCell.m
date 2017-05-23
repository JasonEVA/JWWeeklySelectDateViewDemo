//
//  HMDateSelectCollectionViewCell.m
//  HMClient
//
//  Created by JasonWang on 2017/5/8.
//  Copyright © 2017年 YinQ. All rights reserved.
//

#import "HMDateSelectCollectionViewCell.h"
#import <Masonry.h>
#import <DateTools/DateTools.h>

#define DAYWIDTH  25
@interface HMDateSelectCollectionViewCell ()

@end

@implementation HMDateSelectCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.dayBtn];
        [self.contentView addSubview:self.monthLb];
        
        [self.dayBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.top.equalTo(self.contentView);
            make.width.equalTo(@DAYWIDTH);
            make.height.equalTo(@DAYWIDTH);
        }];
        
        [self.monthLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.dayBtn);
            make.top.equalTo(self.dayBtn.mas_bottom);
        }];
    }
    return self;
}

- (void)fillDataWithDate:(NSDate *)date {
    [self.dayBtn setTitle:[NSString stringWithFormat:@"%ld",(long)date.day] forState:UIControlStateNormal];
    if ([date isToday]) {
        [self.dayBtn.layer setBorderWidth:1];
    }
    else {
        [self.dayBtn.layer setBorderWidth:0];
    }
    [self.monthLb setText:[self acquireMonthStringWithDate:date]];
}

- (NSString *)acquireMonthStringWithDate:(NSDate *)date {
    NSString *tempString = @"";
    if (date.month == 1) {
        tempString = @"一月";
    }
    else if (date.month == 2) {
        tempString = @"二月";
    }
    else if (date.month == 3) {
        tempString = @"三月";
    }
    else if (date.month == 4) {
        tempString = @"四月";
    }
    else if (date.month == 5) {
        tempString = @"五月";
    }
    else if (date.month == 6) {
        tempString = @"六月";
    }
    else if (date.month == 7) {
        tempString = @"七月";
    }
    else if (date.month == 8) {
        tempString = @"八月";
    }
    else if (date.month == 9) {
        tempString = @"九月";
    }
    else if (date.month == 10) {
        tempString = @"十月";
    }
    else if (date.month == 11) {
        tempString = @"十一月";
    }
    else if (date.month == 12) {
        tempString = @"十二月";
    }
    return tempString;
}


/**
 * 创建纯色的图片，用来做背景
 */
- (UIImage *)at_imageWithColor:(UIColor *)color size:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, 0, [UIScreen mainScreen].scale);
    [color set];
    UIRectFill(CGRectMake(0, 0, size.width, size.height));
    UIImage *ColorImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return ColorImg;
}

- (UIButton *)dayBtn {
    if (!_dayBtn) {
        _dayBtn = [[UIButton alloc] init];
        [_dayBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_dayBtn setTitleColor:[UIColor cyanColor] forState:UIControlStateSelected];
        [_dayBtn setBackgroundImage:[self at_imageWithColor:[UIColor whiteColor] size:CGSizeMake(1, 1)] forState:UIControlStateSelected];
        [_dayBtn setBackgroundImage:[self at_imageWithColor:[UIColor clearColor] size:CGSizeMake(1, 1)] forState:UIControlStateNormal];
        [_dayBtn setTitle:@"33" forState:UIControlStateNormal];
        [_dayBtn.layer setCornerRadius:DAYWIDTH / 2];
        [_dayBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [_dayBtn setClipsToBounds:YES];
        [_dayBtn setUserInteractionEnabled:NO];
        [_dayBtn.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    }
    return _dayBtn;
}

- (UILabel *)monthLb {
    if (!_monthLb) {
        _monthLb = [UILabel new];
        [_monthLb setText:@"十三月"];
        [_monthLb setTextColor:[UIColor lightGrayColor]];
        [_monthLb setAlpha:0.5];
        [_monthLb setFont:[UIFont systemFontOfSize:14]];
    }
    return _monthLb;
}
@end
