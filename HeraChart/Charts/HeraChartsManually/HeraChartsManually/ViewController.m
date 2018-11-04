//
//  ViewController.m
//  HeraChartsManually
//
//  Created by Lin,Meini on 2018/11/2.
//  Copyright © 2018年 chengfeng_Yang. All rights reserved.
//

#import "ViewController.h"
#import "HeraChartsManually-Bridging-Header.h"
#import "HeraChartView.h"

static const int minY = 35;
static const int maxY = 44;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    BarChartView *chartView = [[BarChartView alloc] initWithFrame:self.view.bounds];
//    chartView.backgroundColor = [UIColor yellowColor];
//    [self.view addSubview:chartView];
    
    
    int markI = 0;
    NSMutableArray *yVals1 = [[NSMutableArray alloc] init];
    for (int i = 0; i < 4; i++) {
        int a = (int)(minY + (arc4random() % (maxY - minY + 1)));
        if(i == 3) {
            markI = a;
        }
        ChartDataEntry *entry = [[ChartDataEntry alloc] initWithX:i y:a];
        [yVals1 addObject:entry];
    }
    // 数据 2
    NSMutableArray *yVals2 = [[NSMutableArray alloc] init];
    for (int i = 3; i < 13; i++) {
        int a;
        if(i == 3) {
            a = markI;
        } else {
            a = (int)(minY + (arc4random() % (maxY - minY + 1)));
        }
        if(i == 12) {
            markI = a;
        }
        ChartDataEntry *entry = [[ChartDataEntry alloc] initWithX:i y:a];
        [yVals2 addObject:entry];
    }
    // 数据 3
    NSMutableArray *yVals3 = [[NSMutableArray alloc] init];
    for (int i = 12; i < 25; i++) {
        int a;
        if(i == 12) {
            a = markI;
        } else {
            a = (int)(minY + (arc4random() % (maxY - minY + 1)));
        }
        ChartDataEntry *entry = [[ChartDataEntry alloc] initWithX:i y:a];
        [yVals3 addObject:entry];
    }
    
    NSMutableArray *periodsArr = [NSMutableArray array];
   
    NSArray *gradientColors1 = @[(id)[UIColor colorWithRed:30/255.0 green:144/255.0 blue:255/255.0 alpha:0.1].CGColor,
                                 (id)[UIColor colorWithRed:30/255.0 green:144/255.0 blue:255/255.0 alpha:1].CGColor];
    HeraPeriodModel *youngModel = [[HeraPeriodModel alloc] initPeriodModelWithPeriodTopic:@"少年期" gradientColors:gradientColors1 values:yVals1 andLegendColor:[UIColor redColor]];
    [periodsArr addObject:youngModel];

    NSArray *gradientColors2 = @[(id)[UIColor colorWithRed:255/255.0 green:215/255.0 blue:255/255.0 alpha:0.1].CGColor,
                                 (id)[UIColor colorWithRed:255/255.0 green:215/255.0 blue:255/255.0 alpha:1].CGColor];
    HeraPeriodModel *middleModel = [[HeraPeriodModel alloc] initPeriodModelWithPeriodTopic:@"三座山期" gradientColors:gradientColors2 values:yVals2 andLegendColor:[UIColor greenColor]];
    [periodsArr addObject:middleModel];
    
    NSArray *gradientColors3 = @[(id)[UIColor colorWithRed:220/255.0 green:20/255.0 blue:60/255.0 alpha:0.1].CGColor,
                                 (id)[UIColor colorWithRed:220/255.0 green:20/255.0 blue:60/255.0 alpha:1].CGColor];
    HeraPeriodModel *oldModel = [[HeraPeriodModel alloc] initPeriodModelWithPeriodTopic:@"年限将至期" gradientColors:gradientColors3 values:yVals3 andLegendColor:[UIColor blueColor]];
    [periodsArr addObject:oldModel];
    
    HeraChartView *chartView = [[HeraChartView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height/2.0 - 150, self.view.bounds.size.width, 300) topicStr:@"体温走势(℃)" yAxisMin:35 maxY:44 andPeriodsModel:[periodsArr copy]];
    [self.view addSubview:chartView];
}

@end
