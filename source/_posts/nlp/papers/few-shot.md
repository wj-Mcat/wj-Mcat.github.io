title: few-shot papers
tags:
  - nlp
date: 2021-05-07 23:12:01
---
Few-Shot 在工业界落地非常吃香，很大原因在于让客户给你标注数据的代价太大，就算给你标，也很容易出现脏数据，此时few-shot就显得尤为重要。

<!--more-->
# 介绍

## 什么是Few-Shot

Few-Shot learning(FSL)，在少量数据集（通常2个，5个左右）上进行预测的深度学习方法。

目前的机器学习中，都是基于大量数据来训练模型，甚至流行一句话：数据多又好，模型才能好。可这个在现实工业落地场景中是一个不实际的场景，更多的都是少又脏的数据，而Few-Shot学习则主要是为了解决这样的问题。

为什么few-shot能work且这么重要呢？

* 像人类一样判断：few-shot 通过把query和support set进行对比，找到相似度最高的那个类别，这个过程和人类来判断一个新事物的方式是非常类似的，也容易理解。
* 在少量数据集上学习：通过将query与提供的少量支撑集进行相似度对比计算，得到query的类别，这个过程能够基于非常少量的数据集上学习到一个很好的效果，这个对于实际工业落地来说，非常的重要。
* 降低数据搜集和算力的消耗：由于数据集非常少，搜集起来就相对简单，同时计算也非常快，这也是对于工业界非常有益。

## few-shot VS zero-shot

## 方法

* Pretraing：基于某一个预训练模型来对输入进行编码，提取特征。
* fine-tuning: SoftMax Linear
  * 用supoort set的向量平均数据作为初始值
  * entropy regularization
  * cosine similarity + Softmax Linear Classifier
* few-shot prediction：根据一个query在support set中进行预测，一类support set中的特征将会取平均。

### Entropy Regularization

属于强化学习中的一个正则化方法。

在正式讲解之前，需要预习一下Entropy基本概念：如果类别判断的信心分数很低（类别分数平均），则Entropy score很高；如果类别判断的信心分数很高（类别分数不平均，可以肯定是属于哪类），则Entropy score很低。

> 信息熵本身就是描述一件事物的混乱程度，且始终趋于混乱程度更高的方向发展。

作用：

* Improve Exploration

提升模型的优化能力，避免local optimization。

* Fine-Tuning Policies

在Fine-Tuning过程中，使用Entropy Regularization能够让模型优化更加具有探索性，避免过拟合，让模型总是有探索性的去优化全局参数。

* More Robustness

由于模型在fine-tuning阶段更具有探索性，故模型能够避免局部优化，提升全局优化，提升模型的鲁棒性。

> 参考论文：[Generalized Entropy Regularization or: There’s Nothing Special about Label Smoothing](https://www.aclweb.org/anthology/2020.acl-main.615.pdf)

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

## 技巧



# 论文列表

## 2021

### PROTODA: EFFICIENT TRANSFER LEARNING FOR FEW-SHOT INTENT CLASSIFICATION



*****

参考链接：
* [How to Write Beautiful and Meaningful README.md](https://blog.bitsrc.io/how-to-write-beautiful-and-meaningful-readme-md-for-your-next-project-897045e3f991)
* [A Closer Look at Few-shot Classification](https://arxiv.org/abs/1904.04232)
* [A Baseline for few-shot Image classification](https://arxiv.org/abs/1909.02729)
* [A New Meta-Baseline for Few-Shot Learning](https://arxiv.org/abs/2003.04390)