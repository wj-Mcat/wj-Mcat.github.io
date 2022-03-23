title: Some Practice in ML Ops
tags:
  - nlp
  - data 
categories:
  - nlp
  - knowledge
author: wj-Mcat
date: 2022-3-23 11:13:00
---

MLOps（Machine Learning Operations）旨在提供模型开发、构建以及部署等多方面的流程化管理，类似于DevOps，只需要按照某种约定和配置，即可实现整体性的测试发布流程。

在模型层面，模型的正确性测试、模型指标验证、模型的发布以及模型的可视化测试等多个层面都可进行流程化控制，从而减少算法工程师的工作量；从技术的历史发展进程上来看，**ML Ops是每一个算法工程师在未来都将具备的基本技能**。

![](images/2022.03/mlops_visual.svg)

<!-- more -->

## 目录

## 训练数据集结构标准化

模型可能需要在多个数据集上训练、验证以及预测，故数据集结构的统一对于流程化管理至关重要。

针对于不同任务可制定不同的数据集数据结构，如下所示：

* 单标签分类

  * 训练输入
  ```json
  {"label":"标签", "raw_text":"xxx", "metadata": {}}
  ```
  * 测试输入
  ```json
  {"raw_text": "xxx", "metadata": {}}
  ```

* 多标签分类

  * 训练输入

  ```json
  {"label":["标签1","标签2","标签3"], "request_label":["标签1","标签2","标签3"], "raw_text": "xxx", "metadata": {}}
  ```
  * 测试输入
  ```json
  {"request_label":["标签1","标签2","标签3"], "raw_text": "xxx", "metadata": {}}
  ```

* 序列标注

  * 训练输入
  ```json
  {"raw_text":"XXX", "metadata": {},"label":[{"class_name": "XX", "start_offset": 0, "end_offset": 1, "span": "XXX"}]} 
  ```

  * 测试输入

  ```json
  {"raw_text": "XXX", "metadata": {}} 
  ```

* 文本相似度匹配

  * 训练输入
  ```json
  {"label":"标签", "text_a":"sentence1", "text_b": "sentence2", "metadata":{}} 
  ```

  * 测试输入
  ```json
  {"text_a":"sentence1", "text_b": "sentence2", "metadata":{}} 
  ```

* 问答