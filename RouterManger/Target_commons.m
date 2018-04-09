//
//  Target_commons.m
//  RouterMangerExample
//
//  Created by lujh on 2018/4/9.
//  Copyright © 2018年 lujh. All rights reserved.
//

#import "Target_commons.h"

NSString * const kCTMediatorTargetCommons = @"commons";

@implementation Target_commons
// 自定义push方法
- (UIViewController *)push_CommonViewController:(NSString *)stringVCName params:(NSDictionary *)params
{
        // 因为action是从属于ModuleA的，所以action直接可以使用ModuleA里的所有声明
        
        Class class = NSClassFromString(stringVCName);
        UIViewController *controller = [[class alloc] init];
    
        return controller;
}

@end
