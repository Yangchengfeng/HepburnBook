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

1、clone下源码，这里选择sourcetree

2、切到v3.1.1提交节点，这里个人选择`6b730a03`节点，可以通过git status看看是不是打印：` HEAD detached at 6b730a03 `，注：如果是通过git 方式clone下来需要去掉Charts的.git文件，在终端进入Charts工程目录，输入：` find . -name ".git" | xargs rm -Rf `

3、去掉以下两个文件夹：ChartsDemo-iOS & ChartsDemo-macOS，并将Charts.xcodeproj拖入你的项目里

【注】如果觉得太麻烦了，可以将`https://github.com/Yangchengfeng/HepburnBook/tree/Charts_iOS_Manually_v2/HeraChart/Charts/HeraChartsManually/Charts`这个文件down下来加到项目

- U can get my demo in this [way](https://github.com/Yangchengfeng/HepburnBook/tree/Charts_iOS_Manually_v2/HeraChart/Charts/HeraChartsManually)

### Bridge

<br>OC和swift桥接，如果项目本身是用swift开发可跳过此步骤</br>

1、创建一个新的swift文件：个人命名为HeraChartsBridge.swift

![](https://github.com/Yangchengfeng/HepburnBook/blob/Charts_iOS_Cocoapods/HeraChart/Charts/create_swift.png)

2、弹窗，标题Would you like to configure an Objective-C bridging header？选择：Create Bridging Header，此时可以看到生成：工程名-Bridging-Header.h 文件，这里为HeraChartsCocoaPods-Bridging-Header.h

![](https://github.com/Yangchengfeng/HepburnBook/blob/Charts_iOS_Cocoapods/HeraChart/Charts/bridge.png)

3、配置（确认swift版本）

![](https://github.com/Yangchengfeng/HepburnBook/blob/Charts_iOS_Cocoapods/HeraChart/Charts/sure_version.png)

// manually的方式需要执行下面3.1 ，3.2

3.1 Always Embed swift standard libraries -> YES

![](https://github.com/Yangchengfeng/HepburnBook/blob/Charts_iOS_Manually_v2/HeraChart/Charts/manuall_settings.png)

3.2 Embedded Binaries

![](https://github.com/Yangchengfeng/HepburnBook/blob/Charts_iOS_Manually_v2/HeraChart/Charts/manually_setting_add_framework.png)

// manually的方式需要执行以上3.1 ，3.2

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
    
    // chartView.backgroundColor = [UIColor yellowColor]; // manually的方式
    
    [self.view addSubview:chartView];
}

@end

```

6、运行得到一个暂未输入数据的结果:

6.1 pod的方式运行结果

![](https://github.com/Yangchengfeng/HepburnBook/blob/Charts_iOS_Cocoapods/HeraChart/Charts/result_nodata_run_on_6plus.png)

6.2 manually的方式运行结果

![](https://github.com/Yangchengfeng/HepburnBook/blob/Charts_iOS_Manually_v2/HeraChart/Charts/manually_result.png)

## Example

## Troubleshooting


## Features


## Appendices

### How to pod

1、[pod step 路](https://www.jianshu.com/p/6bf9e2d8e9db)

2、[pod trouble 坑](https://www.jianshu.com/p/1062907fee17)

3、[OC调用swift](https://www.jianshu.com/p/9f757a09eacd)

