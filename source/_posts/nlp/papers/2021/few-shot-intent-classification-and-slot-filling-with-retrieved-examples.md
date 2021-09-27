title: Few-shot Intent Classification and Slot Filling with Retrieved Examples
tags:
  - nlp
  - few-shot
date: 2021-09-17 09:36:03
---

使用基于检索式的方法建模意图识别和槽填充。个人认为这种方法比较符合人类的思维方式，通过拿SupportSet召回最相思的Span，从而根据这个来意图识别和槽填充。

创新点：
* training：batch softmax objective function
* span retriver：使用support set 中的数据来做对应的召回

这种方式相对于其他方法的区别在于：  

<!--more-->

## 模型介绍

模型结构相对简单，作者在论文中也仅仅给出`query`和`support set`的样例数据。

## 优点

* 模型训练速度非常快
* 针对于相似文本的span召回效果非常好
* 可解释性好
* 能够实现多意图识别
* 不需要对标签之间的转移矩阵进行建模，加大学习的难度
* 预测的过程可以并行，执行效果非常好
* 可以通过阈值来调整precision和recall的性能表现能力


## 模型

### 数据构造

其实就是根据数据的检索建模来完成。

### Retriver

模型其实就是一个Encoder，对文本进行编码建模，然后在其中找到对应最相思的span作为其标签。

* Encoder

一般都使用Bert

* Span Embedding

如果是槽填充，便使用第一个单词和最后一个单词的embedding拼接来完成。如果是意图识别就使用[cls]位置的embedding向量表示。

* similarity score

内积大小

TODO：我觉得可以尝试使用其他几种不同的模型来处理

* batch softmaxs

每一个support set 都和batch中的所有span计算相似度，得出最终的结果。

## 数据集

* SNIPS、CLINC

| 数据集 |     |     |     |
| ------ | --- | --- | --- |
| sdf    |     |     |     |
|        |     |     |     |
|        |     |     |     |
|        |     |     |     |

