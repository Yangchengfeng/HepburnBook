//
//  ViewController.m
//  HeraChartsManually
//
//  Created by Lin,Meini on 2018/11/2.
//  Copyright © 2018年 chengfeng_Yang. All rights reserved.
//

#import "ViewController.h"
#import "HeraChartsManually-Bridging-Header.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    BarChartView *chartView = [[BarChartView alloc] initWithFrame:self.view.bounds];
    chartView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:chartView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
