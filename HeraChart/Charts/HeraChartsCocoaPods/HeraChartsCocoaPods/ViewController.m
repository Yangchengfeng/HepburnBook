//
//  ViewController.m
//  HeraChartsCocoaPods
//
//  Created by Lin,Meini on 2018/11/2.
//  Copyright © 2018年 chengfeng_Yang. All rights reserved.
//

#import "ViewController.h"
#import "HeraChartsCocoaPods-Bridging-Header.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    BarChartView *chartView = [[BarChartView alloc] initWithFrame:self.view.bounds];
    chartView.backgroundColor = [UIColor colorWithRed:255/255.0 green:101/255.0 blue:136/255.0 alpha:1];
    [self.view addSubview:chartView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
