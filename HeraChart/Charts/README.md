![](https://github.com/Yangchengfeng/HepburnBook/blob/master/HeraChart/Charts/topic.png)

# Charts

## What I get


## About

### The repository can be found here：https://github.com/danielgindi/Charts

### Language：OC


## Usage

### Install

#### CocoaPods Install

1、终端输入：

a、 cd 工程路径（个人这里目录为：`cd /Users/ChengfengYang/HepburnBook/HeraChart/Charts/HeraChartsCocoaPods`）

b、touch Podfile

c、open -a xcode Podfile​

2、在Podfile​中输入如下并保存

```
platform :ios, '8.0'
use_frameworks!

target '您的项目名称' do
   pod 'Charts'
end

```
这里我的Podfile如下：

```
platform :ios, '8.0'
use_frameworks!

target 'HeraChartsCocoaPods' do
   pod 'Charts','3.1.1'
end

```

❗️platform :ios, '8.0'要加入

❗️use_frameworks!一定要加入（不能注释掉）

❗️由于个人Xcode支持swift版本问题，这里选择pod v3.1.1的Charts

3、终端输入：pod install，可以看到类似如下结果

![](https://github.com/Yangchengfeng/HepburnBook/blob/Charts_iOS_Cocoapods/HeraChart/Charts/result.png)

- U can get my demo in this [way](https://github.com/Yangchengfeng/HepburnBook/tree/master/HeraChart/Charts/HeraChartsCocoaPods)

#### manually

- U can get my demo in this [way](https://github.com/Yangchengfeng/HepburnBook/tree/Charts_iOS_Cocoapods/HeraChart/Charts/HeraChartsManually)


### Bridge

<br>OC和swift桥接，如果项目本身是用swift开发可跳过此步骤</br>

1、创建一个新的swift文件：个人命名为HeraChartsBridge.swift

![](https://github.com/Yangchengfeng/HepburnBook/blob/Charts_iOS_Cocoapods/HeraChart/Charts/create_swift.png)

2、弹窗，标题Would you like to configure an Objective-C bridging header？选择：Create Bridging Header，此时可以看到生成：工程名-Bridging-Header.h 文件，这里为HeraChartsCocoaPods-Bridging-Header.h

![](https://github.com/Yangchengfeng/HepburnBook/blob/Charts_iOS_Cocoapods/HeraChart/Charts/bridge.png)

3、配置（确认swift版本）

![](https://github.com/Yangchengfeng/HepburnBook/blob/Charts_iOS_Cocoapods/HeraChart/Charts/sure_version.png)

4、进行桥接，在`工程名-Bridging-Header.h`中，写上引用的swift头文件

```

@import Charts;

```

5、尝试调用相关的类

```

//
//  ViewController.m
//  HeraChartsCocoaPods
//
//  Created by Lin,Meini on 2018/11/2.
//  Copyright © 2018年 chengfeng_Yang. All rights reserved.
//

#import "ViewController.h"
#import "HeraChartsCocoaPods-Bridging-Header.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];

    BarChartView *chartView = [[BarChartView alloc] initWithFrame:self.view.bounds];
    chartView.backgroundColor = [UIColor colorWithRed:255/255.0 green:101/255.0 blue:136/255.0 alpha:1];
    [self.view addSubview:chartView];
}

@end

```

6、运行得到一个暂未输入数据的结果:

![](https://github.com/Yangchengfeng/HepburnBook/blob/Charts_iOS_Cocoapods/HeraChart/Charts/result_nodata_run_on_6plus.png)

## Troubleshooting


## Features


## Appendices
