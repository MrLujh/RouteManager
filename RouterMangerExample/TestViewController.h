//
//  TestViewController.h
//  RouterMangerExample
//
//  Created by lujh on 2018/4/9.
//  Copyright © 2018年 lujh. All rights reserved.
//

#import <UIKit/UIKit.h>


/** 反向传参回调blcok */
typedef void(^BackWithDict)(NSString *str);

@interface TestViewController : UIViewController

/** 注意：info 要和pushVC中的字典传参里面的key对应 否则目标控制器无法接收 */
@property (strong, nonatomic) NSDictionary *info; 

/** 反向传参回调blcok */
/** 注意：backblock 要和pushVC中的字典传参里面的key对应 否则目标控制器无法接收 */
@property (nonatomic,copy) BackWithDict backblock;

@end
