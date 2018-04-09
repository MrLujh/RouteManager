//
//  Target_commons.m
//  RouterMangerExample
//
//  Created by lujh on 2018/4/9.
//  Copyright © 2018年 lujh. All rights reserved.
//

#import "Target_commons.h"
#import "CommonViewController.h"

NSString * const kCTMediatorTargetCommons = @"commons";

@implementation Target_commons
// 自定义push方法
- (UIViewController *)push_CommonViewController:(NSDictionary *)params
    {
        // 因为action是从属于ModuleA的，所以action直接可以使用ModuleA里的所有声明
        
        CommonViewController *vc = [[CommonViewController alloc] init];
        
        return vc;
    }

@end
