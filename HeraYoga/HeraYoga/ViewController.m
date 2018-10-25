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
    [firstView configureLayoutWithBlock:^(YGLayout * layout) {
        layout.isEnabled = YES;
        layout.width = YGPointValue(320);
        layout.height = YGPointValue(80);
    }];
    [self.view addSubview:firstView];
    [firstView.yoga applyLayoutPreservingOrigin:NO];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
