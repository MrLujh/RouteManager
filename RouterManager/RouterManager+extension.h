//
//  RouterManager+extension.h
//  RouterMangerExample
//
//  Created by lujh on 2018/4/9.
//  Copyright © 2018年 lujh. All rights reserved.
//

#import "RouterManager.h"
#import "Target_commons.h"
/**
 * 将函数名称编码成CTMediator能解析的方法名称
 *
 */
NSString *enActionFuncName(NSString *actionName);
/**
 * 通过函数名称解析出类的名称
 *
 */
NSString *deActionFuncName(NSString *action);

/**
 * 通过SEL参数解析出类的实例
 *
 */
Class getClassFromAtcion(SEL sel);

//extern NSString *const kCTMediatorClassName;
/**
 * 注册自定义的创建vc函数名称
 *
 */
void registerSelectorToMediator(NSString *clsName,NSString *selName);

/**
 * 删除自定义的创建vc函数名称
 *
 */
void removeSelectorToMediator(NSString *clsName);


@interface RouterManager (extension)
/**
 * 通过vc类的名字创建vc,默认的vc创建函数为createVC:
 *
 * @param actionName vc类名称
 *
 * @param params 创建vc初始化要传递的参数
 *
 * @param shouldCacheTarget 是否需要缓存target，一般传NO
 *
 * @return vc的实例
 *
 */
- (id)performAction:(NSString *)actionName params:(NSDictionary *)params shouldCacheTarget:(BOOL)shouldCacheTarget;

/**
 * 通过vc类的名字创建vc
 *
 * @param actionName vc类名称
 *
 * @param dstSelName vc中实现的创建vc的函数，不要在这个方法中使用self关键字，获取当前类名则
 * 通过使用getClassFromAtcion(_cmd)来获取
 *
 * @param params 创建vc初始化要传递的参数
 *
 * @param shouldCacheTarget 是否需要缓存target，一般传NO
 *
 * @return vc的实例
 *
 */
- (id)performAction:(NSString *)actionName dstSel:(NSString *)dstSelName params:(NSDictionary *)params shouldCacheTarget:(BOOL)shouldCacheTarget;

@end
