//
//  KIDAnalysisChartView.m
//  mybaby
//
//  Created by Lin,Meini on 2018/10/28.
//  Copyright © 2018年 ChengfengYang. All rights reserved.
//

#import "KIDAnalysisChartView.h"
#import "AAChartKit.h"

@interface KIDAnalysisChartView ()

@property (nonatomic, strong) UILabel *topicLabel;
@property (nonatomic, strong) AAChartModel *aaChartModel;
@property (nonatomic, strong) AAChartView  *aaChartView;
@property (nonatomic, strong) UIScrollView *aaScrollView; // 新增

@property (nonatomic, strong) NSString *topicStr;

@end

@implementation KIDAnalysisChartView

- (instancetype)initWithFrame:(CGRect)frame topicStr:(NSString *)topic {
    self = [super initWithFrame:frame];
    if(self) {
        [self p_setupUIWithTopic:topic];
    }
    return self;
}

#pragma mark - UI

- (void)p_setupUIWithTopic:(NSString *)topic {
    [self p_configureTopicLabel:topic];
    [self p_configureTheChartView:AAChartTypeArea];
}

- (void)p_configureTopicLabel:(NSString *)topic {
    self.topicLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, self.frame.size.width, 18)];
    self.topicLabel.text = topic;
    self.topicLabel.font = [UIFont boldSystemFontOfSize:18];
    self.topicLabel.textColor = [UIColor blackColor];
    self.topicLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.topicLabel];
}

- (void)p_configureTheChartView:(AAChartType)chartType {
    
    CGFloat scrollViewH = self.bounds.size.height - 35;
    
    self.aaScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 35, self.bounds.size.width, scrollViewH)];
    self.aaScrollView.contentSize = CGSizeMake(self.bounds.size.width * 2, scrollViewH);
    self.aaScrollView.showsHorizontalScrollIndicator = NO;
    self.aaScrollView.showsVerticalScrollIndicator = NO;
    self.aaScrollView.alwaysBounceVertical = NO;
    
    self.aaChartView = [[AAChartView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width*2, scrollViewH)];
    self.backgroundColor = [UIColor whiteColor];
    self.aaChartView.scrollEnabled = NO;
    self.aaChartView.contentHeight = self.aaChartView.frame.size.height;
    [self.aaScrollView addSubview:self.aaChartView];
    
    [self addSubview:self.aaScrollView];
    
    self.aaChartModel = [self configureTheChartModel:chartType];
    [self.aaChartView aa_drawChartWithChartModel:_aaChartModel];
}

- (AAChartModel *)configureTheChartModel:(NSString *)chartType {
    
    NSDictionary *gradientColorDic1 =
    @{
      @"linearGradient": @{
              @"x1": @0,
              @"y1": @1, // 从下往上
              @"x2": @0,
              @"y2": @0
              },
      @"stops": @[@[@0, @"rgba(223, 239, 207, 0.1)"],
                  @[@1, @"rgba(247, 255, 240, 1)"]]
      };
    NSDictionary *gradientColorDic2 =
    @{
      @"linearGradient": @{
              @"x1": @0,
              @"y1": @1,
              @"x2": @0,
              @"y2": @0
              },
      @"stops": @[@[@0, @"rgba(255, 194, 208, 0.1)"],
                  @[@1, @"rgba(255, 245, 247, 1)"]]
      };
    
    NSDictionary *gradientColorDic3 =
    @{
      @"linearGradient": @{
              @"x1": @0,
              @"y1": @1,
              @"x2": @0,
              @"y2": @1
              },
      @"stops": @[@[@0, @"rgba(255, 234, 202, 0.1)"],
                  @[@1, @"rgba(255, 247, 236, 1)"]]
      };
    
    AAChartModel *aaChartModel = AAChartModel.new
    .chartTypeSet(AAChartTypeArea)
    .symbolSet(AAChartSymbolTypeCircle)
    .markerRadiusSet(@4)
    .tooltipEnabledSet(false)
    .titleSet(@"")
    .yAxisTitleSet(@"")
    .symbolStyleSet(AAChartSymbolStyleTypeInnerBlank)
    .dataLabelEnabledSet(true)
    .yAxisTickPositionsSet(@[@(0), @(20), @(40), @(60), @(80), @(100)])
    .yAxisGridLineWidthSet(@0)
    .xAxisCrosshairColorSet(@"#ffffff")
    .xAxisCrosshairWidthSet(@1)
    .categoriesSet(@[@"10/25",@"10/26",@"10/27",@"10/28",@"10/29",@"10/30",@"10/31",@"11/01",@"11/02",@"11/03",@"11/04",@"11/05",])
    .seriesSet(@[AASeriesElement.new
                 .nameSet(@" ")
                 .showInLegendSet(false)
                 .dataSet(@[@2.3, @11, @20, @22, @30, @44, @47, @50, @54, @56, @58, @70,])
                 .lineWidthSet(@3)
                 .markerSet(AAMarker.new
                            .fillColorSet(@"#ffffff")
                            .lineWidthSet(@2)
                           )
                 .zoneAxisSet(@"x")
                 .zonesSet(@[
                             @{@"value": @4,
                               @"color": @"#FF6588", // 线的颜色
                               @"fillColor": gradientColorDic1 // 阴影面积
                               },@{
                                 @"value": @8,
                                 @"color": @"#FF6588",
                                 @"fillColor": gradientColorDic2
                               }, @{
                                 @"color": @"#FF6588",
                                 @"fillColor": gradientColorDic3
                                 }])
                 ,]);
    
    return aaChartModel;
}

@end
