//
//  ViewController.m
//  HeraChart
//
//  Created by Lin,Meini on 2018/10/29.
//  Copyright © 2018年 Lin,Meini. All rights reserved.
//

#import "ViewController.h"
#import "KIDAnalysisChartView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:[self p_setupTemperatureChartView]];
}

- (KIDAnalysisChartView *)p_setupTemperatureChartView {
    KIDAnalysisChartView *chartView = [[KIDAnalysisChartView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, 222) topicStr:@"体温走势(℃)"];
    return chartView;
}

@end
