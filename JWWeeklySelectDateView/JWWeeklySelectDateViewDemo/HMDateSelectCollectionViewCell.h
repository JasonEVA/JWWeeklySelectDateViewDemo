//
//  HMDateSelectCollectionViewCell.h
//  HMClient
//
//  Created by JasonWang on 2017/5/8.
//  Copyright © 2017年 YinQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HMDateSelectCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UIButton *dayBtn;
@property (nonatomic, strong) UILabel *monthLb;

- (void)fillDataWithDate:(NSDate *)date;

@end
