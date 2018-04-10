//
//  TestViewController.m
//  RouterMangerExample
//
//  Created by lujh on 2018/4/9.
//  Copyright © 2018年 lujh. All rights reserved.
//  QQ:287929070

#import "TestViewController.h"

@interface TestViewController ()

@property (weak, nonatomic) IBOutlet UILabel *pushLabel;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pushLabel.text = [self.info objectForKey:@"user"];
}

- (IBAction)popBtnClick:(UIButton *)sender
{
    
    self.backblock(@"我是返回值参数:pop");
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
