//
//  ViewController.m
//  ZYFCategory
//
//  Created by 亚飞 on 2018/5/30.
//  Copyright © 2018年 yafei. All rights reserved.
//

#import "ViewController.h"

#import "YFCategory_header.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:view];
    [view addChangeColorWithColorArray:@[(id)[UIColor greenColor].CGColor, (id)[UIColor orangeColor].CGColor] startPoint:CGPointMake(0, 0) endPoint:CGPointMake(1, 1) radius:0];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
