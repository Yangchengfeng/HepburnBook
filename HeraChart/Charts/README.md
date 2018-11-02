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
❗️platform :ios, '8.0'要加入
❗️use_frameworks!一定要加入（不能注释掉）
❗️由于个人Xcode支持swift版本问题，这里选择pod v3.1.1的Charts

3、终端输入：pod install

- U can get my demo in this [way](https://github.com/Yangchengfeng/HepburnBook/tree/master/HeraChart/Charts/HeraChartsCocoaPods)

#### manually

- U can get my demo in this way：


### Bridge

<br>OC和swift桥接，如果项目本身是用swift开发可跳过此步骤

1、创建一个新的swift文件：个人命名为HeraChartsBridge.swift

2、弹窗，标题Would you like to configure an Objective-C bridging header？选择：Create Bridging Header，此时可以看到生成：工程名-Bridging-Header.h 文件，这里为HeraChartsCocoaPods-Bridging-Header.h

## Troubleshooting


## Features


## Appendices
