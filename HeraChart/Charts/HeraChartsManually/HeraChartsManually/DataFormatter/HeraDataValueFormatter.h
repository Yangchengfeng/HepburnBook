//
//  HeraDataValueFormatter.h
//  HeraChartsManually
//
//  Created by Lin,Meini on 2018/11/4.
//  Copyright © 2018年 chengfeng_Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HeraChartsManually-Bridging-Header.h"

@interface HeraDataValueFormatter : NSObject <IChartAxisValueFormatter>

- (id)initWithArr:(NSArray *)arr;

@end
