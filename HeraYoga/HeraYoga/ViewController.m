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

@property (nonatomic, strong) UIView *baseClassView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self devideView];
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
