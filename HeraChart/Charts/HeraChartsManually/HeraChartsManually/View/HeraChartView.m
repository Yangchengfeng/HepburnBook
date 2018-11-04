//
//  HeraChartView.m
//  HeraChartsManually
//
//  Created by Lin,Meini on 2018/11/4.
//  Copyright © 2018年 chengfeng_Yang. All rights reserved.
//

#import "HeraChartView.h"
#import "HeraDataValueFormatter.h"
#import "HeraSymbolsValueFormatter.h"
#import "HeraSetValueFormatter.h"
#import "HeraChartsManually-Swift.h"

@interface HeraChartView ()

@property (nonatomic, strong) UILabel *topicLabel;
@property (nonatomic, copy) NSArray<HeraPeriodModel *> *periodsModel;
@property (nonatomic, strong) NSMutableArray<ChartLegendEntry*> *legendEntries;
@property (nonatomic, strong) NSMutableArray *dataSets;

@end

@implementation HeraChartView

/*
 * 图表参数
 * @param frame        图表frame
 * @param topic        图表主题
 * @param minY         y轴最小数
 * @param maxY         y轴最大数
 * @param periodsModel 所有时期数据模型
 *
 */
- (instancetype)initWithFrame:(CGRect)frame topicStr:(NSString *)topicStr yAxisMin:(int)minY maxY:(int)maxY andPeriodsModel:(NSArray<HeraPeriodModel *>*)periodsDataModel {
    self = [super initWithFrame:frame];
    if(self) {
        
        self.dataSets = [NSMutableArray array];
        self.legendEntries = [NSMutableArray array];
        
        [self p_configureTopicLabel:topicStr];
        [self p_configureChartViewWithYAxisMin:minY maxY:maxY andPeriodsModel:periodsDataModel];
    }
    return self;
}

#pragma mark - UI

- (void)p_configureTopicLabel:(NSString *)topic {
    self.topicLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, self.frame.size.width, 15)];
    self.topicLabel.text = topic;
    self.topicLabel.font = [UIFont boldSystemFontOfSize:18];
    self.topicLabel.textColor = [UIColor blackColor];
    self.topicLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.topicLabel];
}

- (void)p_configureChartViewWithYAxisMin:(int)minY maxY:(int)maxY andPeriodsModel:(NSArray<HeraPeriodModel *>*)periodsModel {
    
    int xVals_count = 30;
    
    // 创建并初始化chart
    LineChartView *chartView = [self p_createChartViewWithMinY:minY maxY:maxY andCycle:xVals_count];

    for (HeraPeriodModel *periodModel in periodsModel) {
        [self p_addEveryPartValuesForLegendEntriesWith:periodModel.periodTopic andColor:periodModel.periodLegendColor];
        [self p_addEveryPartValuesForLineValues:periodModel.periodValues AndFillColor:periodModel.periodGradientColors];
    }
    
    if(periodsModel.count > 0) {
        LineChartData *chartDatas = [[LineChartData alloc] initWithDataSets:[self.dataSets copy]];
        chartDatas.highlightEnabled = NO;
        chartView.data = chartDatas;
        
        ChartLegend *legend = chartView.legend;
        legend.enabled = NO;
        [legend setCustomWithEntries:self.legendEntries];
        
        HeraLineChartLabelRenderer *renderer = [[HeraLineChartLabelRenderer alloc] initWithDataProvider:chartView animator:chartView.chartAnimator viewPortHandler:chartView.viewPortHandler legend:legend];
        [renderer labelPositionSetWithCenterY:36]; // ❗️根据你设置y范围选择
        chartView.renderer = renderer;
    }
    
    [self addSubview:chartView];
}

// 各时期图例
- (void)p_addEveryPartValuesForLegendEntriesWith:(NSString *)legendEntryStr andColor:(UIColor *)color {
    ChartLegendEntry *entry = [[ChartLegendEntry alloc] initWithLabel:legendEntryStr form:ChartLegendFormSquare formSize:NAN formLineWidth:NAN formLineDashPhase:NAN formLineDashLengths:nil formColor:color];
    [self.legendEntries addObject:entry];
}

/*
 * 各时期区块数据设置及描边
 * @param lineValues 区块设置
 * @param fillColor  填充颜色
 */
- (void)p_addEveryPartValuesForLineValues:(NSArray *)lineValues AndFillColor:(NSArray *)fillColor {
    LineChartDataSet *set = [self p_drawLineWithData:lineValues andGradientColors:fillColor];
    [self.dataSets addObject:set];
}

/*
 * 创建图表
 * @param minY       y轴最小值
 * @param maxY       y轴最大值
 * @param chartCycle 图表绘制最大周期，即用户分析周期
 *
 */
- (LineChartView *)p_createChartViewWithMinY:(int)minY maxY:(int)maxY andCycle:(int)chartCycle {
    // 创建并初始化chart
    LineChartView *chartView = [[LineChartView alloc] initWithFrame:CGRectMake(0, 55, self.bounds.size.width, self.bounds.size.height - 55 - 20)];
    chartView.backgroundColor = [UIColor whiteColor];
    chartView.rightAxis.enabled = NO;
    chartView.noDataText = @"暂无数据";
    chartView.chartDescription.text = @"";
    chartView.doubleTapToZoomEnabled = NO;
    chartView.pinchZoomEnabled = NO;
    chartView.dragEnabled = YES;
    chartView.userInteractionEnabled = YES;
    chartView.scaleXEnabled = YES;
    chartView.scaleYEnabled = NO;
    [chartView setScaleMinima:chartCycle/7 scaleY:1]; // 缩放(一屏横坐标个数)
    
    // y轴设置
    ChartYAxis *yAxis = chartView.leftAxis;
    [yAxis setAxisMinimum:minY-1];
    [yAxis setAxisMaximum:maxY+1];
    yAxis.valueFormatter = [[HeraSymbolsValueFormatter alloc] init];
    yAxis.forceLabelsEnabled = NO;
    yAxis.labelPosition = YAxisLabelPositionOutsideChart;
    yAxis.labelTextColor = [UIColor grayColor];
    yAxis.labelFont = [UIFont systemFontOfSize:12.0f];
    yAxis.inverted = NO;
    yAxis.gridAntialiasEnabled = NO;
    yAxis.axisLineColor = [UIColor grayColor];
    yAxis.axisLineWidth = 1;
    yAxis.gridColor = [UIColor clearColor];
    
    // x轴设置
    NSMutableArray *xVals = [[NSMutableArray alloc] init];
    for (int i = 1; i <= chartCycle; i++) {
        [xVals addObject: [NSString stringWithFormat:@"%d岁", i]];
    }
    ChartXAxis *xAxis = chartView.xAxis;
    xAxis.valueFormatter = [[HeraDataValueFormatter alloc] initWithArr:xVals];
    xAxis.drawGridLinesEnabled = NO;
    xAxis.granularityEnabled = YES;
    xAxis.labelPosition= XAxisLabelPositionBottom;
    xAxis.labelTextColor = [UIColor grayColor];
    xAxis.labelFont = [UIFont systemFontOfSize:12];
    xAxis.axisLineColor = [UIColor grayColor];
    xAxis.axisLineWidth = 1;
    xAxis.gridColor = [UIColor clearColor];
    
    return chartView;
}

/*
 * 画曲线
 * @param lineDatas      曲线上数据(x-y)
 * @param gradientColors 渐变色范围
 *
 */
- (LineChartDataSet *)p_drawLineWithData:(NSArray *)lineDatas andGradientColors:(NSArray *)gradientColors{
    LineChartDataSet *dataSet = [[LineChartDataSet alloc] initWithValues:lineDatas label:nil];
    dataSet.mode = LineChartModeCubicBezier; // 贝塞尔曲线
    dataSet.valueFormatter = [[HeraSetValueFormatter alloc] initWithArr:lineDatas]; // 数据格式
    dataSet.highlightColor = [UIColor clearColor];
    [dataSet setColor:[UIColor redColor]];
    dataSet.lineWidth = 1.5; // 线宽
    dataSet.drawCirclesEnabled = YES; // 每个数据点样式
    dataSet.circleRadius = 4;
    dataSet.circleHoleRadius = 2;
    dataSet.circleHoleColor = [UIColor whiteColor];
    [dataSet setCircleColor:[UIColor redColor]];
    dataSet.drawFilledEnabled = YES;
    CGGradientRef gradientRef = CGGradientCreateWithColors(nil, (CFArrayRef)gradientColors, nil); // 阴影区域样式
    dataSet.fillAlpha = 1.f;
    dataSet.fill = [ChartFill fillWithLinearGradient:gradientRef angle:90.0f];
    CGGradientRelease(gradientRef);
    return dataSet;
}

@end
