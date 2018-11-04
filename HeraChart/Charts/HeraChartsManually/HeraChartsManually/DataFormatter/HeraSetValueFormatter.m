//
//  HeraSetValueFormatter.m
//  HeraChartsManually
//
//  Created by Lin,Meini on 2018/11/4.
//  Copyright © 2018年 chengfeng_Yang. All rights reserved.
//

#import "HeraSetValueFormatter.h"

@interface HeraSetValueFormatter()

@property (nonatomic, assign) CGFloat dataSetIndex;
@property (nonatomic, copy) NSArray *arr;

@end

@implementation HeraSetValueFormatter

- (id)initWithArr:(NSArray *)arr {
    self = [super init];
    if (self) {
        _arr = arr;
        NSMutableArray * muArr = [NSMutableArray arrayWithArray:arr];
        [muArr sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            ChartDataEntry * entry1 =(ChartDataEntry *)obj1;
            ChartDataEntry * entry2 =(ChartDataEntry *)obj2;
            if (entry1.y >= entry2.y){
                return NSOrderedAscending;
            }else{
                return NSOrderedDescending;
            }
        }];
        _dataSetIndex =((ChartDataEntry * )muArr[0]).x;
    }
    return self;
}

- (NSString * _Nonnull)stringForValue:(double)value entry:(ChartDataEntry * _Nonnull)entry dataSetIndex:(NSInteger)dataSetIndex viewPortHandler:(ChartViewPortHandler * _Nullable)viewPortHandler {
    // TODO:通过entry.x获取今天的值
    return @"";
}

@end
