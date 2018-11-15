# HeraChart

📈 📊 最近接触到图表的页面，也在了解GitHub上比较popular的图表框架，下面从每个的使用来看看：

## AAChartKit

🔗 [传送门](https://github.com/AAChartKit)

📒 [相关参数参见](https://www.hcharts.cn/docs)

📚 [Apply](https://github.com/Yangchengfeng/HepburnBook/tree/master/HeraChart/HeraChart)

![demo](https://github.com/Yangchengfeng/HepburnBook/blob/master/HeraChart/HeraChart/AAChartKit%E5%AE%9E%E8%B7%B5%E5%9B%BE.png)

2.7k star✨的AAChartKit支持OC、swift两种语言，更有slim包，只需要手动导入AAChartKitLib并加入.pch文件即可，易上手，作者也是特别nice的人；但是[HighCharts](https://shop.highsoft.com/highcharts/)说明商业及政府站点需要付费❗️❗️❗️

![web](https://github.com/Yangchengfeng/HepburnBook/blob/master/HeraChart/HeraChart/highchart.png)

## Charts

🔗 [iOS_传送门](https://github.com/danielgindi/Charts) & [Android_传送门](https://github.com/PhilJay/MPAndroidChart)

📚 [Apply](https://github.com/Yangchengfeng/HepburnBook/tree/master/HeraChart/Charts)

📓 [Example](https://github.com/Yangchengfeng/HepburnBook/blob/Charts_iOS_Manually_v2/HeraChart/Charts/README.md)

主要实现点有如下：

- 图表设置：x、y轴数据

- 曲线数据样式及填充

  - 分不同区块，如：少年期、中年期、老年期；

  - 不同区块包含了各自的：曲线上的数据(x-y轴)、填充颜色(支持单一或渐变)、区块描述(文案：颜色、位置、字号等)

  - 缩放图表(根据个人对x轴可视数据个数设置)，使得图表可以拖动

具体效果图如下：

![demo](https://github.com/Yangchengfeng/HepburnBook/blob/master/Pic/Charts_Example.png)

这个库应该是图表库里边star✨特别多的了(安卓的同学推荐用这个库MPAndroidChart🔥🔥🔥)；相对而言有如下问题：

❗️iOS是swift语言开发的，如果是本身项目是OC开发的，需要桥接

❗️该库GitHub上的[wiki](https://github.com/PhilJay/MPAndroidChart/wiki)是针对MPAndroidChart的简介，开发的时候可以看看，特性还是比较相似的

❗️对于具体业务，网上资料比较多是安卓的，需要理解源码

 虽然有以上问题，但是挡不住这个功能丰富的库的光芒🌅，具体操作、遇到问题及解决方案([传送门](https://blog.csdn.net/yang_chengfeng/article/details/83515863))

## ECharts

下面分享一篇个人看到的关于ECharts的分析[文章](https://www.sciencedirect.com/science/article/pii/S2468502X18300068)
