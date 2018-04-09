//
//  UIViewController+routerManager.m
//  RouterMangerExample
//
//  Created by lujh on 2018/4/9.
//  Copyright © 2018年 lujh. All rights reserved.
//

#import "UIViewController+routerManager.h"
#import "MJExtension.h"

@implementation UIViewController (routerManager)

- (id)createVC:(NSDictionary *)dict{
    
    Class class = getClassFromAtcion(_cmd);
    if (class) {
        
        UIViewController *doc = self;
        doc = [[class alloc]init];
        doc = [doc mj_setKeyValues:dict];
        return doc;
    }
    return nil;
}
@end
