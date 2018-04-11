# ☆☆☆ “RouteManager” ☆☆☆

## 支持pod导入

* pod 'RouteManager'

* 执行pod search RouteManager提示搜索不到，可以执行以下命令更新本地search_index.json文件
  
```objc 
rm ~/Library/Caches/CocoaPods/search_index.json
```
* 如果pod search还是搜索不到，执行pod setup命令更新本地spec缓存（可能需要几分钟），然后再搜索就可以了

## 前言

* GitHub上比较主流路由和中间件实现方案，比如JLRoutes、MGJRouter、HHRouter、CTMediator

    * JLRoutes提供的功能很多很杂，让人难以全面掌握，修改麻烦，甚至需要服务端提供支持，
    
    * MGJRouter的设计让项目新人难以快速上手，成本高，代码写法略装逼，
    
    * CTMediator是我个人比较喜欢的库，在我们的项目中使用了CTMediator中的部分代码，
    
    * 以上几个库都解决了根据路由规则进行控制器的push操作，但都忽视了回调操作（比如delegate回调）,我主要是想解决这个问题，在CTMediator原来的基础上再次进行了封装，优化。
    
* 无论是路由也好，中间件也好，主要目的：功能模块解耦，同时降低业务耦合度；满足多样化的app使用场景，比如在H5点击某个链接可以跳转到原生页面；从app外部点击某个连接跳转到app内部某个功能场景
    
* 移动端路由其实参照的是web端的路由实现方案。web端的路由实现方案，说白了，就是将路由地址和响应事件做一个关系映射，当客户端访问某个URL时，系统就会调用这个URL对应的响应方法

## 架构怎么进化

* 架构进化体现在哪些方面，作为一个技术团队我们要如何把架构进化落地？这个问题因项目而异，因团队而异，因方向而异。本文只介绍手机天猫在发展过程中，与解耦相关的进化历程。

* 升级开发模式

    * 开发模式的概念有点大，本文就只讨论和解耦这件事相关的：团队合作方式和工程组织形式。下文单独一节聊这个事，此处不赘述。
    
* 各维度解耦

    * 工程大了以后，要分拆，不管是组件化还是插件化，还是什么，解耦是第一步，而且是各个维度的解耦。
    
* 完善工具集

    * 模式演进的过程中，解耦的过程中，就会衍生出很多的工具。在进化过程里我们也会去思考，哪些工作是需要工具化的，主动去开发工具。一个完善的工具集，会极大提升团队的生产力，可以说是最有价值的部分。    

## 开发模式升级

* 模块化

    * 先按功能把工程做横向分层，在业务层再做纵向梳理。把不同的模块代码简单的放在一个文件夹里，而工程的组织形式并没有发生变化。跨团队基本不会在同一个模块代码上产生冲突。
    
* 插件化

    * 进一步发展，业务越来越复杂，团队工作越发细分，人也越来越多，代码量越来越大。简单的使用文件夹来组织模块的方式显得力不从心。多业务跨团队，不同的开发节奏，复杂的依赖关系，导致我们会花掉大量的时间解决编译不过的问题。等待其他模块集成这件事居然成了我们开发效率最大的瓶颈。

* 插件化

    * 代码独立，先从形式上解耦
    
    * 独立代码工程化，为独立运行打下基础
    
    * 梳理依赖关系，独立工程可编译
    
    * 放弃源码依赖，提速集成编译

## 解耦思路

* 工欲善其事，必先利其器。这句话每个人都在说，却不是每个人都能做到。一个具有工具文化的团队会在质量，效率各个方面都会有很大优势。
  
* 一个工程，从原始状态迅速膨胀到天猫现在的体量的，依赖关系之复杂，超乎想象。

* 耦合三类：

    * 界面耦合，就是用户操作流程里，不同界面间的跳转，这些界面的跳转是硬编码
    
    * 依赖耦合，顾名思义，两个模块之间的有依赖，就是耦合
    
    * 工程耦合，每个模块有自己的生命周期和运行时，每个模块在生产环境里又需要依赖主工程的运行时
    
    * 放弃源码依赖，提速集成编译
    
## 使用    

* 路由&无参数

    * 由ViewController向TestViewController跳转，在ViewController中将通过路由找到TestViewController
    
```objc       
UIViewController *doc = [[RouterManager sharedInstance]
                             performAction:@"TestViewController"
                             params:nil
                             shouldCacheTarget:NO];

[self.navigationController pushViewController:doc animated:YES];
```

* 路由&带参数

    * 由ViewController向TestViewController跳转，在ViewController中将通过路由找到TestViewController，
    传入的参数赋值给目标控制器，在TestViewController中只需声明一下入参接收对应的key
```objc       
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
```

```objc       
UIViewController *doc = [[RouterManager sharedInstance]
                             performAction:@"TestViewController"
                             params:@{
                                      @"info":@{
                                              @"user":@"我是正向传值参数:push",
                                              }
                                      }
                             shouldCacheTarget:NO];

[self.navigationController pushViewController:doc animated:YES];
```    

* 路由&带参数&回调反向传值

    * 在ViewController和TestViewController中同时声明一个blcok,在demo中有详细说明
```objc       
- (IBAction)popBtnClick:(UIButton *)sender
{
    
    self.backblock(@"我是返回值参数:pop");
    
    [self.navigationController popViewControllerAnimated:YES];
}
```

```objc       
__weak typeof(self) weakSelf = self;
self.backWithDict = ^(NSString *str) {
        
        weakSelf.backLabel.text = str;
};
    
UIViewController *doc = [[RouterManager sharedInstance]
                             performAction:@"TestViewController"
                             params:@{
                                      @"info":@{
                                              @"user":@"我是正向传值参数:push",
                                              },
                                      @"backblock":self.backWithDict
                                      }
                             shouldCacheTarget:NO];

[self.navigationController pushViewController:doc animated:YES];
```    


![Mou icon](https://github.com/MrLujh/Fastlane--Packaging/blob/master/111.gif)

