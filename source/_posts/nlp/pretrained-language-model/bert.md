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

## 解决了什么问题

模型参数数量这么大，必然需要海量的训练语料。从哪里收集这些海量的训练语料？《A Neural Probabilistic Language Model》这篇论文说，每一篇文章，天生是训练语料。难道不需要人工标注吗？回答，不需要。

## 为什么这么强

原因有三：

* 双向建模
* 使用MLM和NSP两种训练技巧
* 能够学习到Context-Heavy的Representation

用一句话来说就是：使用MLM和NSP两种训练技巧，基于双向建模能够学习到丰富上下文Representation。

## 整体结构

基于Transformer构建模型，bert-base模型当中参数为：L=12, H=768, A=12，参数数量为110M；Bert-Large模型中参数为：L=24, H=1024, A=16，参数数量为：340M。

![bert-overall](/images/2021.05/bert-overall.png)

> Bert其实是分为Encoder和Decoder两个部分，如果只是为了了解Bert是如何工作的，那只需要了解Encoder部分即可。

是由12层的双向Transformer构成，能够进行不同层面的特征抽取，那为了深入到Bert中的细节，那接下来将要介绍一下Bert的细节。

## Transformer

Transformer是一个基于Attension机制的NLP基础组件，出自于《Attention is All you need》，OpenAI GPT和BERT都是基于Transformer。

下面我将以数据的流向为线索，来介绍模型中的细节。

### 问题定义

最初Transformer被用来解决翻译的问题，那此时就要求其具备：

* 能够步骤输入文本中词与词之间的关系
* 能够将以上关系映射到输出文本中

此时就需要一个Encoder和Decoder来处理这两个问题，结构如下：

![transformer](/images/2021.05/transformer.png)

### 数据的流向

简化后的结构图如下所示：

![transformer](/images/2021.05/transformer-data-flow.png)

> 左边Encoder的输入为input sentence，右边Decoder的输入为target sentence，这两者用来做相关相似度计算。

1. 在原始论文中，N为6.
1. input sentence每一个单词为token，所以一个输入文本可编码为：`input_length` * `embedding_dim`
1. 添加位置信息(positional information)，维度大小同上：`input_length` * `embedding_dim`
1. 数据经过N个Encoder之后的输出为：`input_length` * `embedding_dim`，数据的原始大小并没有变化
1. target sentence进行分词和添加位置信息之后，便输入到Decoder当中，大小为：`target_length` * `embedding_dim`
1. Decoder中的每一层都要使用Encoder的输入，整体输出大小为：`target_length` * `embedding_dim`
1. 最后连接一个Linear层，然后其输出大小为：`target_length` * `vocab_size`

以上便是Transformer中的数据流向过程，那接下来我将介绍每一个细节。

### 输入表示

input sentence 和 target sentence 都是需要进行编码，最终得到一个`input_length` * `embedding_dim`向量，那这是如何得到文本的向量表示的呢？

主要分为两个步骤：

* Token Embedding
* Encoding of Positions

原始文本和目标文本的编码过程是一致的。Token Embedding的原理我就不介绍了，与通用的方法一致，Encoding of Positions的原理可用以下公式来表示：

### Encoder Layer

![transformer](/images/2021.05/transformer-encoder-layer.png)

其中N个Layer链式连接，上一个的输出就是下一个的输入（而且输入和输出的维度大小一致），通过层级连接，能够捕捉到不同层次之间的上下文关系，这个过程也可以认为是sentence-level并非word-level的建模。

#### Multi-Header Layer

![transformer](/images/2021.05/transformer-multi-head.png)

内部有h个Dot-Product Attention连接：多个独立可学习的参数的特征空间，提升某一层的宽度，提取更多的特征空间。

* multi-head：提取特征的数量
* N-Transformer：提取复杂的特征




## 训练方法

### Mask Language Model

### Next Sentence Prediction

****

参考链接：

* [introduction-for-bert-part-1](https://medium.com/@mromerocalvo/dissecting-bert-part1-6dcf5360b07f)
* [introduction-for-bert-part-2](https://medium.com/dissecting-bert/dissecting-bert-part2-335ff2ed9c73)
* [Intuitive Explanation of BERT- Bidirectional Transformers for NLP](https://towardsdatascience.com/intuitive-explanation-of-bert-bidirectional-transformers-for-nlp-cdc1efc69c1e)
* []()