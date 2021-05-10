title: 模型蒸馏
tags:
  - nlp
date: 2021-04-30 22:12:01
---
模型蒸馏旨在减模型参数量，减少部署的压力。

<!--more-->

# 介绍

## 名词解释

* teacher -> 原始模型或模型ensemble
* student -> 蒸馏得到的模型
* transfer set -> 用来迁移teacher知识、训练student的数据集合
* soft target -> teacher输出的预测结果（一般是softmax之后的概率）
* hard target -> 样本原本的标签
* temperature -> 蒸馏目标函数中的超参数
* born-again network -> 蒸馏的一种，指student和teacher的结构和尺寸完全一样
* teacher annealing -> 防止student的表现被teacher限制，在蒸馏时逐渐减少soft targets的权重

## 



*****

参考链接：
* [深度神经网络模型蒸馏Distillation](https://zhuanlan.zhihu.com/p/71986772)