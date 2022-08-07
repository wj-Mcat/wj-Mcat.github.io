---
title: 数据结构在机器学习中的思考
tags:
  - nlp
  - data 
categories:
  - nlp
  - knowledge
author: wj-Mcat
date: 2022-3-23 11:13:00
---

当不同任务下的数据结构统一后，如训练数据、验证数据以及测试数据，模型的训练、切换、验证、测试等不同阶段都可以实现高效自动化。

<!-- more -->

## 介绍

做过模型训练平台的小伙伴对此不会陌生，因为这也是他们日常工作中的一部分，也算是基础设计了。先介绍一下一些MLOps平台的一个基础需求吧：

* 支持上传多种不同类型的任务数据集
* 

## 快速实验

如果想要将数据集应用在这些数据集上，

![](/images/2022.07/data-structure-of-nlp-corpus.png)

## 数据结构化

模型可能需要在多个数据集上训练、验证以及预测，故数据集结构的统一对于流程化管理至关重要。

针对于不同任务可制定不同的数据集数据结构，如下所示：

* 单标签分类

  * 训练输入
  ```json
  {
    "label":"标签", 
    "raw_text":"xxx",
    "metadata": {}
  }
  ```
  * 测试输入
  ```json
  {
    "raw_text": "xxx",
    "metadata": {}
  }
  ```

* 多标签分类

  * 训练输入

  ```json
  {
    "label":["标签1","标签2","标签3"],
    "request_label":["标签1","标签2","标签3"],
    "raw_text": "xxx",
    "metadata": {}
  }
  ```
  * 测试输入
  ```json
  {
    "request_label":["标签1","标签2","标签3"],
    "raw_text": "xxx",
    "metadata": {}
  }
  ```

* 序列标注

  * 训练输入
  ```json
  {
    "raw_text":"XXX",
    "metadata": {},
    "label":[
      {
        "class_name": "XX",
        "start_offset": 0,
        "end_offset": 1,
        "span": "XXX"
      }, ...]
  } 
  ```

  * 测试输入

  ```json
  {
    "raw_text": "XXX",
    "metadata": {}
  }
  ```

* 文本相似度匹配

  * 训练输入
  ```json
  {
    "label":"标签",
    "text_a":"sentence1",
    "text_b": "sentence2",
    "metadata":{}
  }
  ```

  * 测试输入
  ```json
  {
    "text_a":"sentence1",
    "text_b": "sentence2",
    "metadata":{}
  }
  ```

* 问答

## 总结