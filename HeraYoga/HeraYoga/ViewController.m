//
//  ViewController.m
//  HeraYoga
//
//  Created by Lin,Meini on 2018/10/23.
//  Copyright © 2018年 Lin,Meini. All rights reserved.
//

#import "ViewController.h"
#import <YogaKit/UIView+Yoga.h>

#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
#define randomColor random(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))

@interface ViewController ()

@property (nonatomic, strong) UIView *baseClassView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // flex-grow使用
    // [self devideView];
    
    // flex-wrap使用
    // [self nineView];
    
    // raywenderlich_yoga
    [self simpleView];
}

- (void)simpleView {
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectZero];
    contentView.backgroundColor = [UIColor lightGrayColor];
    [contentView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionRow;
        layout.width = YGPointValue(320);
        layout.height = YGPointValue(80);
        layout.marginTop = YGPointValue(40);
        layout.marginLeft = YGPointValue(10);
    }];
    [self.view addSubview:contentView];
    
    UIView *childViewOne = [[UIView alloc] initWithFrame:CGRectZero];
    childViewOne.backgroundColor = [UIColor redColor];
    [childViewOne configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(80);
    }];
    [contentView addSubview:childViewOne];
    
    UIView *childViewTwo = [[UIView alloc] initWithFrame:CGRectZero];
    childViewTwo.backgroundColor = [UIColor blueColor];
    [childViewTwo configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(80);
        layout.flexGrow = 1; // 允许自增长填充
    }];
    [contentView addSubview:childViewTwo];
    
    [contentView.yoga applyLayoutPreservingOrigin:NO];
}

- (void)nineView {
    NSArray *arr = [NSArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", nil];
    
    UIView *firstView = [[UIView alloc] initWithFrame:CGRectZero];
    firstView.backgroundColor = [UIColor greenColor];
    [firstView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionRow;
        layout.height = YGPointValue(40*(arr.count/4));
        layout.width = YGPointValue(self.view.frame.size.width);
//        layout.flexWrap = YGWrapWrap; // wrap
//        layout.flexWrap = YGWrapNoWrap; // nowrap
        layout.flexWrap = YGWrapWrapReverse; // wrap-reverse
    }];
    [self.baseClassView addSubview:firstView];
    
    for (NSString *str in arr) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
        view.backgroundColor = randomColor;
        [view configureLayoutWithBlock:^(YGLayout * layout) {
            layout.isEnabled = YES;
            layout.width = YGPointValue(self.view.frame.size.width/4.0);
            layout.height = YGPointValue(40);
        }];
        [firstView addSubview:view];
    
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectZero];
        lbl.text = str;
        lbl.textAlignment = NSTextAlignmentCenter;
        [lbl configureLayoutWithBlock:^(YGLayout * layout) {
            layout.isEnabled = YES;
            layout.flexGrow = 1.0;
            layout.padding = YGPointValue(0);
        }];
        [view addSubview:lbl];
    }
    [self.baseClassView.yoga applyLayoutPreservingOrigin:NO];
}

- (void)devideView {
    UIView *firstView = [[UIView alloc] initWithFrame:CGRectZero];
    firstView.backgroundColor = [UIColor grayColor];
    [firstView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexGrow = 1.0;
    }];
    [self.baseClassView addSubview:firstView];
    
    UIView *secondView = [[UIView alloc] initWithFrame:CGRectZero];
    secondView.backgroundColor = [UIColor redColor];
    [secondView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexGrow = 2.0;
    }];
    [self.baseClassView addSubview:secondView];
    
    UIView *thirdView = [[UIView alloc] initWithFrame:CGRectZero];
    thirdView.backgroundColor = [UIColor orangeColor];
    [thirdView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexGrow = 1.0;
    }];
    [self.baseClassView addSubview:thirdView];
    
    [self.baseClassView.yoga applyLayoutPreservingOrigin:NO];
}

- (UIView *)baseClassView {
    if(!_baseClassView) {
        _baseClassView = [[UIView alloc] initWithFrame:CGRectZero];
        _baseClassView.backgroundColor = [UIColor redColor];
        [_baseClassView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.isEnabled = YES;
            layout.marginTop = YGPointValue(64);
            layout.width = YGPointValue(self.view.frame.size.width);
            layout.height = YGPointValue(self.view.frame.size.width);
            layout.justifyContent = YGJustifyFlexStart;
        }];
        [self.view addSubview:_baseClassView];
    }
    return _baseClassView;
}


@end
