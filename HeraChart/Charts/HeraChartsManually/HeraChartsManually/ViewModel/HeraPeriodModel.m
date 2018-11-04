//
//  HeraPeriodModel.m
//  HeraChartsManually
//
//  Created by Lin,Meini on 2018/11/4.
//  Copyright © 2018年 chengfeng_Yang. All rights reserved.
//

#import "HeraPeriodModel.h"

@implementation HeraPeriodModel

- (instancetype)initPeriodModelWithPeriodTopic:(NSString *)periodTopic gradientColors:(NSArray *)gradientColors values:(NSArray<ChartDataEntry *> *)values andLegendColor:(UIColor *)legendColor {
    self = [super init];
    if(self) {
        _periodTopic = periodTopic;
        _periodGradientColors = gradientColors;
        _periodValues = values;
        _periodLegendColor = legendColor;
    }
    return self;
}

@end
