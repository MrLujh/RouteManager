//
//  UIViewController+routerManager.h
//  RouterMangerExample
//
//  Created by lujh on 2018/4/9.
//  Copyright © 2018年 lujh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RouterManager+extension.h"
#import <MJExtension.h>

@interface UIViewController (routerManager)

- (id)createVC:(NSDictionary *)dict;
@end
