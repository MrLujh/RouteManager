//
//  ViewController.m
//  RouterMangerExample
//
//  Created by lujh on 2018/4/9.
//  Copyright © 2018年 lujh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *backLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"路由解耦";
    
}

- (IBAction)pushBtnClick:(UIButton *)sender
{
    
    __weak typeof(self) weakSelf = self;
    self.backWithDict = ^(NSString *str) {
        
        weakSelf.backLabel.text = str;
    };
    
    
    UIViewController *doc = [[RouterManager sharedInstance]
                             performAction:@"TestViewController"
                             params:@{
                                      @"insuranceInfo":@{
                                              @"userName":@"我是正向传值参数:push",
                                              },
                                      @"backblock":self.backWithDict
                                      }
                             shouldCacheTarget:NO];

    [self.navigationController pushViewController:doc animated:YES];
}

- (IBAction)commonPushBtnClick:(UIButton *)sender
{
    Target_commons *ds = [[Target_commons alloc] init];
    UIViewController *VC = [ds push_CommonViewController:@"CommonViewController" params:@{}];
    
    [self.navigationController pushViewController:VC animated:YES];
}

@end
