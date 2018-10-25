//
//  ViewController.m
//  HeraYoga
//
//  Created by Lin,Meini on 2018/10/23.
//  Copyright © 2018年 Lin,Meini. All rights reserved.
//

#import "ViewController.h"
#import <YogaKit/UIView+Yoga.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *firstView = [[UIView alloc] initWithFrame:CGRectZero];
    firstView.backgroundColor = [UIColor redColor];
    [firstView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.marginTop = YGPointValue(64);
        layout.width = YGPointValue(self.view.frame.size.width);
        layout.height = YGPointValue(self.view.frame.size.height);
        layout.justifyContent = YGJustifyFlexStart;
    }];
    [self.view addSubview:firstView];
    
    UIView *secondView = [[UIView alloc] initWithFrame:CGRectZero];
    secondView.backgroundColor = [UIColor cyanColor];
    [secondView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionRow;
        layout.width = YGPointValue(self.view.frame.size.width - 50);
    }];
    [firstView addSubview:secondView];
    
    UILabel *availabelLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    availabelLabel.backgroundColor = [UIColor greenColor];
    availabelLabel.text = @"我想测试下具体的长度及其显示的效果，ABCDEFGHIJKLMN";
    [availabelLabel configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexGrow = 0;
    }];
    [secondView addSubview:availabelLabel];
    
    UIView *tagView = [[UIView alloc] initWithFrame:CGRectZero];
    tagView.backgroundColor = [UIColor magentaColor];
    [tagView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexGrow = 2.0;
    }];
    [secondView addSubview:tagView];
    
    UIImageView *tagImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    tagView.backgroundColor = [UIColor yellowColor];
    tagImageView.image = [UIImage imageNamed:@"add"];
    [tagImageView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexGrow = 0;
        layout.width = YGPointValue(15);
    }];
    [tagView addSubview:tagImageView];
    
    [firstView.yoga applyLayoutPreservingOrigin:NO];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
