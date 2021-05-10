title: few-shot papers
tags:
  - nlp
date: 2021-05-07 23:12:01
---
Few-Shot 在工业界落地非常吃香，很大原因在于让客户给你标注数据的代价太大，就算给你标，也很容易出现脏数据，此时few-shot就显得尤为重要。

<!--more-->

# 整体介绍

## 方法

使用相似度方程来将query在support set中的预测。

## 数据集

* Omnilglot：手下数字识别，类别很多，数据集非常小，很适合在学术界上学习测试
* Mini-ImageNet：100classes

## 孪生网络

> 连体网络

Encoder层级是一致的。

训练数据是需要进行正负例样本。
Loss： Triple Loss 

One-Shot Prediction：最后只需要计算distance

步骤：
* 使用孪生网络在是大型数据集上做训练
* 构造support-set
	* 训练数据集是包含测试集中的类别
* 使用孪生网络来计算其相似度

12:45




# 论文列表

## 2021

### PROTODA: EFFICIENT TRANSFER LEARNING FOR FEW-SHOT INTENT CLASSIFICATION



*****

参考链接：
* [How to Write Beautiful and Meaningful README.md](https://blog.bitsrc.io/how-to-write-beautiful-and-meaningful-readme-md-for-your-next-project-897045e3f991)