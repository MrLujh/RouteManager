//
//  TestViewController.h
//  RouterMangerExample
//
//  Created by lujh on 2018/4/9.
//  Copyright © 2018年 lujh. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^BackWithDict)(NSString *str);

@interface TestViewController : UIViewController

@property (strong, nonatomic) NSDictionary *insuranceInfo; //保单信息

/** 注释 */
@property (nonatomic,copy) BackWithDict backblock;

@end
