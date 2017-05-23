//
//  HMWeeklySelectDateView.h
//  HMClient
//
//  Created by JasonWang on 2017/5/8.
//  Copyright © 2017年 YinQ. All rights reserved.
//  按周横滑选择日期控件

#import <UIKit/UIKit.h>

typedef void(^HMWeeklySelectedDateBlock)(NSDate *selectedDate);

@interface HMWeeklySelectDateView : UIView

// 初始化方法
- (instancetype)initWithStartDate:(NSDate *)startDate;
// 外部设置日期接口
- (void)configDate:(NSDate *)date;
// 内部日期选择回调
- (void)dateCellClick:(HMWeeklySelectedDateBlock)block;

@end
