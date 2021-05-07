title: 关于Bert的一切
tags:
  - nlp
  - bert
categories:
  - nlp
  - pretrained-language-model
author: wj-Mcat
date: 2021-04-28 11:13:00
---
作为NLP领域里程碑式的作品，对于其深刻的理解是很多后续学习工作的基础，更是面试找工作的利器。

<!-- more -->

# 介绍

`bert`是一个基于海量无结构化文本进行深度双向语义建模的预训练模型，通过`Mask Language Model`和`Next Sentence Prediction`两种训练任务，学习到文本中丰富的先验知识。实践证明，这些通用先验知识能够应用于各种下游任务，并取得`SOTA`效果，即使是在`low-resource`下也能够取得良好的效果。

bert是由一个谷歌AI NLP团队提出：[《BERT: Pre-training of Deep Bidirectional Transformers for Language Understanding》](https://arxiv.org/abs/1810.04805)，是第一个无监督双向语言模型，一经发表就刷新了各大榜单，被定义为里程碑式的模型，让NLP达到了新的高度。

## 为什么这么强

原因有三：

* 双向建模
* 使用MLM和NSP两种训练技巧
* 能够学习到Context-Heavy的Representation

用一句话来说就是：使用MLM和NSP两种训练技巧，基于双向建模能够学习到丰富上下文Representation。

## 整体结构

基于Transformer构建模型，bert-base模型当中参数为：L=12, H=768, A=12，参数数量为110M；Bert-Large模型中参数为：L=24, H=1024, A=16，参数数量为：340M。

## 训练方法

### Mask Language Model

### Next Sentence Prediction