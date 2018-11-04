//
//  HeraLineChartLabelRenderer.swift
//  HeraChartsManually
//
//  Created by Lin,Meini on 2018/11/4.
//  Copyright © 2018年 chengfeng_Yang. All rights reserved.
//

import Foundation
import CoreGraphics

#if !os(OSX)
import UIKit
#endif

open class HeraLineChartLabelRenderer: LineChartRenderer
{
    @objc open weak var legend: Legend?
    @objc var centerY: CGFloat = 0.0
    
    @objc public init(dataProvider: LineChartDataProvider, animator: Animator, viewPortHandler: ViewPortHandler, legend:Legend)
    {
        super.init(dataProvider: dataProvider, animator: animator, viewPortHandler: viewPortHandler)
        
        self.legend = legend
    }
    
    @objc open func labelPositionSet(centerY: CGFloat)
    {
        self.centerY = centerY
    }
    
    @objc open func drawLineLabel(context: CGContext, dataSet: ILineChartDataSet, legendEntry: LegendEntry)
    {
        if(legendEntry.label?.isEmpty)! {
            return;
        }
        
        let str:String = legendEntry.label!
        let centerX:CGFloat = CGFloat((dataSet.xMax + dataSet.xMin)/2.0);
        
        var pt = CGPoint()
        let trans = self.dataProvider?.getTransformer(forAxis: dataSet.axisDependency)
        let valueToPixelMatrix = trans?.valueToPixelMatrix
        pt.x = centerX
        pt.y = centerY
        pt = pt.applying(valueToPixelMatrix!)
        
        ChartUtils.drawText(context: context, text: str, point: CGPoint(x: pt.x, y: pt.y), align: .center, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12), NSAttributedStringKey.foregroundColor: legendEntry.formColor ?? UIColor.clear])
    }
    
    open override func drawData(context: CGContext)
    {
        guard let lineData = dataProvider?.lineData else { return }
        
        for i in 0 ..< lineData.dataSetCount
        {
            guard let set = lineData.getDataSetByIndex(i) else { continue }
            
            if set.isVisible
            {
                if !(set is ILineChartDataSet)
                {
                    fatalError("Datasets for LineChartRenderer must conform to ILineChartDataSet")
                }
                
                drawDataSet(context: context, dataSet: set as! ILineChartDataSet)
                
                if(i<(self.legend?.entries.count)!) {
                    drawLineLabel(context: context, dataSet: set as! ILineChartDataSet, legendEntry:self.legend!.entries[i]) 
                }
            }
        }
    }
}
