//
//  HeraDataValueFormatter.m
//  HeraChartsManually
//
//  Created by Lin,Meini on 2018/11/4.
//  Copyright © 2018年 chengfeng_Yang. All rights reserved.
//

#import "HeraDataValueFormatter.h"

@interface HeraDataValueFormatter ()

@property (nonatomic, copy) NSArray *arr;

@end

@implementation HeraDataValueFormatter

- (id)initWithArr:(NSArray *)arr {
    self = [super init];
    if (self) {
        _arr = arr;
    }
    return self;
}

// x轴数值
- (NSString *)stringForValue:(double)value axis:(ChartAxisBase *)axis {
    if(value >= _arr.count || value<0) {
        return @"";
    }
    return _arr[(int)value];
}

@end
