//
//  HeraPeriodsDataModel.m
//  HeraChartsManually
//
//  Created by Lin,Meini on 2018/11/4.
//  Copyright © 2018年 chengfeng_Yang. All rights reserved.
//

#import "HeraPeriodsDataModel.h"
#import "HeraPeriodModel.h"
#import "HeraChartsManually-Bridging-Header.h"

@implementation HeraPeriodsDataModel

// 把相关业务的数据放在这块处理
- (NSArray *)periodData {
    int markI = 0;
    NSMutableArray *yVals1 = [[NSMutableArray alloc] init];
    for (int i = 0; i < 3; i++) {
        int a = (int)(minY + (arc4random() % (maxY - minY + 1)));
        if(i == 2) {
            markI = a;
        }
        ChartDataEntry *entry = [[ChartDataEntry alloc] initWithX:i y:a];
        [yVals1 addObject:entry];
    }
    // 数据 2
    NSMutableArray *yVals2 = [[NSMutableArray alloc] init];
    for (int i = 2; i < 7; i++) {
        int a;
        if(i == 2) {
            a = markI;
        } else {
            a = (int)(minY + (arc4random() % (maxY - minY + 1)));
        }
        if(i == 6) {
            markI = a;
        }
        ChartDataEntry *entry = [[ChartDataEntry alloc] initWithX:i y:a];
        [yVals2 addObject:entry];
    }
    // 数据 3
    NSMutableArray *yVals3 = [[NSMutableArray alloc] init];
    for (int i = 6; i < 25; i++) {
        int a;
        if(i == 6) {
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
    HeraPeriodModel *youngModel = [[HeraPeriodModel alloc] initPeriodModelWithPeriodTopic:@"少年期" gradientColors:gradientColors1 values:yVals1 andLegendColor:[UIColor blueColor]];
    [periodsArr addObject:youngModel];
    
    NSArray *gradientColors2 = @[(id)[UIColor colorWithRed:220/255.0 green:20/255.0 blue:60/255.0 alpha:0.1].CGColor,
                                 (id)[UIColor colorWithRed:220/255.0 green:20/255.0 blue:60/255.0 alpha:1].CGColor];
    HeraPeriodModel *middleModel = [[HeraPeriodModel alloc] initPeriodModelWithPeriodTopic:@"三座山期" gradientColors:gradientColors2 values:yVals2 andLegendColor:[UIColor redColor]];
    [periodsArr addObject:middleModel];
    
    NSArray *gradientColors3 = @[(id)[UIColor colorWithRed:255/255.0 green:215/255.0 blue:255/255.0 alpha:0.1].CGColor,
                                 (id)[UIColor colorWithRed:255/255.0 green:215/255.0 blue:255/255.0 alpha:1].CGColor];
    HeraPeriodModel *oldModel = [[HeraPeriodModel alloc] initPeriodModelWithPeriodTopic:@"年限将至期" gradientColors:gradientColors3 values:yVals3 andLegendColor:[UIColor purpleColor]];
    [periodsArr addObject:oldModel];
    
    return [periodsArr copy];
}

@end
