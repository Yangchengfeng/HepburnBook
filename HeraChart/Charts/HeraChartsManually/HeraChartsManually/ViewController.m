//
//  ViewController.m
//  HeraChartsManually
//
//  Created by Lin,Meini on 2018/11/2.
//  Copyright © 2018年 chengfeng_Yang. All rights reserved.
//

#import "ViewController.h"
// #import "HeraChartsManually-Bridging-Header.h"
#import "HeraChartView.h"
#import "HeraPeriodsDataModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    BarChartView *chartView = [[BarChartView alloc] initWithFrame:self.view.bounds];
//    chartView.backgroundColor = [UIColor yellowColor];
//    [self.view addSubview:chartView];
    
    HeraPeriodsDataModel *dataModel = [[HeraPeriodsDataModel alloc] init];
    
    HeraChartView *chartView = [[HeraChartView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height/2.0 - 150, self.view.bounds.size.width, 300) topicStr:@"体温走势(℃)" yAxisMin:35 maxY:44 andPeriodsModel:[dataModel periodData]];
    [self.view addSubview:chartView];
}

@end
