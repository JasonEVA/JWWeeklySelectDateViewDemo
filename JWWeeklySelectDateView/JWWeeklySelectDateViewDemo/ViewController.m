//
//  ViewController.m
//  JWWeeklySelectDateViewDemo
//
//  Created by jasonwang on 2017/5/23.
//  Copyright © 2017年 JasonWang. All rights reserved.
//

#import "ViewController.h"
#import "HMWeeklySelectDateView.h"
#import <Masonry.h>
#import <DateTools/DateTools.h>

#define DATESELECTSELECTVIEWHEIGHT      100

@interface ViewController ()
@property (nonatomic, strong) HMWeeklySelectDateView *dateSelectView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self setTitle:[[NSDate date] formattedDateWithFormat:@"yyyy-MM-dd"]];
   
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithTitle:@"今天" style:UIBarButtonItemStylePlain target:self action:@selector(rightClick)];
    [self.navigationItem setRightBarButtonItem:rightBtn];

    [self.view addSubview:self.dateSelectView];
    [self.dateSelectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.equalTo(@DATESELECTSELECTVIEWHEIGHT);
    }];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)rightClick {
    [self.dateSelectView configDate:[NSDate date]];
    [self setTitle:[[NSDate date] formattedDateWithFormat:@"yyyy-MM-dd"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (HMWeeklySelectDateView *)dateSelectView {
    if (!_dateSelectView) {
        _dateSelectView = [[HMWeeklySelectDateView alloc] initWithStartDate:[NSDate date]];
        [_dateSelectView dateCellClick:^(NSDate *selectedDate) {
            [self setTitle:[selectedDate formattedDateWithFormat:@"yyyy-MM-dd"]];
        }];
    }
    return _dateSelectView;
}

@end
