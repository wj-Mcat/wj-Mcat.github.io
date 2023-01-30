---
title: 开源项目的PM
date: 2022-11-20 09:47:09
tags:
    - opensource
---

这几年一直在接触开源，也认识了一些热爱开源圈的朋友，或许也是因为他们让我爱上了开源。这段时间也在开始在某大厂专职做开源，接触到了里面的一些运作模式，此外也和朋友聊了一些关于开源的一些理念，特别是PM 这块，所以在此想与大家探讨一些细节问题。

## PM 是什么

PM（Project Manager，项目经理）在传统互联网项目当中是一个至关重要的角色，主要负责项目的设计、规划、与客户&技术人员沟通反馈等任务。

> A project manager is a professional in the field of project management. Project managers have the responsibility of the planning, procurement and execution of a project, in any undertaking that has a defined scope, defined start and a defined finish; regardless of industry. Project managers are first point of contact for any issues or discrepancies arising from within the heads of various departments in an organization before the problem escalates to higher authorities, as project representative.
> --- [Project Manager from wiki](https://en.wikipedia.org/wiki/Project_manager)

PM负责项目交互设计，所以非常清楚项目在使用体验上的好与坏，也可以和客户进行良好的沟通；PM设计了对应的交互 UI，所以清楚此功能模块的大致工期，所以在规划项目开发周期上也显得游刃有余；同时 PM 对产品的交互细节非常清楚，所以可以跟客户侃侃而谈；

> 当然这里就细说PM 和开发人员之间的 diss 了，不在此文章的讨论范围之内。

当然，大厂做开源或多或少也会把上面的一套经验直接搬到开源项目中来。

## 互联网的 PM

我们先假定直接把传统互联网PM直接搬到开源项目中来，会出现以下情况：

> 先假定PM是一个没有技术背景的人员或者是对实现细节不清楚的初级开发人员。

1. PM 负责开源项目的交互设计（API）。
1. PM 与开源社区中的开发者（客户）沟通他们遇到的问题，并尝试解决。
1. PM 评估并规划不同功能（Bugfix、Improvement、New Feature）的开发周期。
1. PM 与开源社区和企业用户聊开源产品的交互（API）细节。

听着是不是感觉很不可思议？而且还是不可能执行，于是管理者就会想一个折中的解决方案：

1. API 接口肯定是设计不了了，那就交给开发人员吧，让他们自行自行设计。
1. 开源社区的开发者问题肯定是回复不了了，那就让团队开发人员去回复，可他们自己手上又有一大堆的开发任务，没办法让他们全职来做这个事情，所以就只能让他们「轮班」来回复群里面的问题。
1. PM 没办法知道Bugfix、Improvement 和 New Feature 到底需要花多长时间，所以开发周期和发版计划都是有 tech leader 来决定的。
1. PM 由于不懂技术，所以和开源社区的技术人员很难聊到一块去，更别谈针对于某一些底层架构设计的讨论了，所以就只能够与企业用户聊产品介绍：我们有什么，能做什么？可是一旦聊到：“你们是怎么做的？”可能 就会直接通话转接到技术人员那里（这个层面也还可以）。

> 以上观点不代表所有互联网PM，也不代表某具体公司的PM，没有任何针对性质的言论，仅仅是把我所遇到的现象描述出来。

可是上面的实践方式会出现很多问题：

1. PM 在产品中的定位就弱化了，由于没办法全程参与项目的设计、规划以及与客户（开发人员）的沟通，而且也不能让他们闲着，所以就只能干一些（大部分）运营的工作（某朋友提到了：其实现在很多 PM 干着运营的工作）。
1. PM 没办法和客户（开发者）进行深入的沟通，所以就没办法获取到他们真实的需求，最后也没办法设计产品以及给产品排期。
1. PM 不懂技术，所以也没办法参与到这个问题如何修复？这个可以用什么来提升性能？另外一个框架使用了最新的 XX 技术，咱们也可以引入进来，而且代价比较低，只需要 YYY 就行了。
1. 开源社区是开源项目最核心的部分，甚至比代码都重要（Community over Code），可是 PM 在开源社区的角色也也只能是一个运营，所以很难维护一个开源社区。（开源社区的开发者都想抱大佬大腿，而不是......）

以上是我所见到现象背后所思考的一些问题，那如何解决这样的现状呢？

## 开源项目的 PM

咳咳，以下是我理想中优秀开源项目的 PM ，也欢迎大家来吐槽：

1. PM 是一个精通项目Quick Start、Tutorial 的开发者，同时也是一个 [TechWriter](https://developers.google.com/tech-writing/becoming)。
1. PM 熟悉开发者用户端的所有 API 设计使用，并参与到上层 API 中来；同时非常了解同类竞品的优点和缺点（需要深入实践使用才可以体验到）；
1. PM 可参与到开源社区维护当中来，由于精通 examples 和 docs 内容，所以在解决群里面80%的问题，剩余 20%的问题可以请教团队负责指定模块的开发者从而恢复其开发者的问题。
1. PM 只负责开源社区和项目API规范，运营相关的工作就都交给专业的运营相关同学完成即可，把主要的精力放在项目规范、文档以及开发者身上。

所以总结而言，开源项目的 PM 日常工作就是：回答开源社区的问题、编写docs、编写用户级别API的开发工作、编写各种 examples，甚至写一些对于开发者友好的开源项目，并组织开源社区的开发者一起来贡献。

## 总结

开源社区的 PM 必须要会写代码，精通 Quick Start、Tutorial、 examples以及竞品项目在使用上的区别。

可到[开源项目的PM](https://github.com/wj-Mcat/wj-Mcat.github.io/issues/1)参与具体讨论。
