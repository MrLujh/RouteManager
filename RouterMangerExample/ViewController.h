//
//  ViewController.h
//  RouterMangerExample
//
//  Created by lujh on 2018/4/9.
//  Copyright © 2018年 lujh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BackWithDict)(NSString *str);

@interface ViewController : UIViewController

/** backWithDict */
@property (nonatomic,copy) BackWithDict backWithDict;

@end

