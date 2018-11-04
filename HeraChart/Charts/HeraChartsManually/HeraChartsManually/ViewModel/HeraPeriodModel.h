//
//  HeraPeriodModel.h
//  HeraChartsManually
//
//  Created by Lin,Meini on 2018/11/4.
//  Copyright © 2018年 chengfeng_Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HeraChartsManually-Bridging-Header.h"

@interface HeraPeriodModel : NSObject

@property (nonatomic, strong) NSString *periodTopic; // 区块标题
@property (nonatomic, strong) UIColor *periodLegendColor; // 区块标题颜色
@property (nonatomic, strong) NSArray *periodGradientColors; // 区块填充颜色
@property (nonatomic, strong) NSArray<ChartDataEntry *> *periodValues; // 区块曲线上的数据

- (instancetype)initPeriodModelWithPeriodTopic:(NSString *)periodTopic gradientColors:(NSArray *)gradientColors values:(NSArray<ChartDataEntry *> *)values andLegendColor:(UIColor *)legendColor;

@end
