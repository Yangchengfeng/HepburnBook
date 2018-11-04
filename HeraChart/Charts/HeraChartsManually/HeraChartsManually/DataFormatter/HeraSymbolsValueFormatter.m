//
//  HeraSymbolsValueFormatter.m
//  HeraChartsManually
//
//  Created by Lin,Meini on 2018/11/4.
//  Copyright © 2018年 chengfeng_Yang. All rights reserved.
//

#import "HeraSymbolsValueFormatter.h"

@implementation HeraSymbolsValueFormatter

- (id)init {
    if (self = [super init]) {
    }
    return self;
}

- (NSString *)stringForValue:(double)value axis:(ChartAxisBase *)axis {
    return [NSString stringWithFormat:@"%ld",(NSInteger)value];
}

@end
