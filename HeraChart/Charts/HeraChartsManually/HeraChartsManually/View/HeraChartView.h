//
//  HeraChartView.h
//  HeraChartsManually
//
//  Created by Lin,Meini on 2018/11/4.
//  Copyright © 2018年 chengfeng_Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeraPeriodModel.h"

@interface HeraChartView : UIView

- (instancetype)initWithFrame:(CGRect)frame topicStr:(NSString *)topic yAxisMin:(int)minY maxY:(int)maxY andPeriodsModel:(NSArray<HeraPeriodModel *>*)periodsModel;

@end
