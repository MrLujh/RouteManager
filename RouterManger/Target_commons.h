//
//  Target_commons.h
//  RouterMangerExample
//
//  Created by lujh on 2018/4/9.
//  Copyright © 2018年 lujh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

extern NSString * const kCTMediatorTargetCommons;

@interface Target_commons : NSObject
// 自定义push方法
- (UIViewController *)push_CommonViewController:(NSDictionary *)params;

@end
