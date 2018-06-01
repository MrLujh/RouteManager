//
//  ErrorViewController.m
//  RouterMangerExample
//
//  Created by lujh on 2018/6/1.
//  Copyright © 2018年 lujh. All rights reserved.
//

#import "ErrorViewController.h"

@interface ErrorViewController ()

@end

@implementation ErrorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"找不到对应的VC";
    
    UILabel *label = [[UILabel alloc] initWithFrame:self.view.bounds];
    label.font = [UIFont systemFontOfSize:20];
    label.textColor = [UIColor redColor];
    label.text = @"找不到对应的VC";
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
}

@end
