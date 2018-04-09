# ☆☆☆ “RouteManager” ☆☆☆

## 支持pod导入
* pod 'RouteManager'

![Mou icon](https://github.com/MrLujh/RouteManager/blob/master/resource/21432543.gif)

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
    
## 应用架构谈 组件化方案

* https://casatwy.com/iOS-Modulization.html

## My weixin
![(author)](https://github.com/daniulaolu/PushParameterWithDict-/blob/master/xiaolu.jpg)

![Mou icon](https://github.com/MrLujh/Fastlane--Packaging/blob/master/111.gif)

