---
title: the-rise-of-decoder-only-model
author: 吴京京
date: 2022-09-12
tags:
    - nlp
    - Transformer
---

Bert是由encoder-only训练而来，T5由encoder-decoder训练而来，不过都是需要有大量的训练语料才能够训练而来.

近段时间，decoder-only的模型出现的越来越多，比如：GPT-{1,2,3}，google的[PaLM]()，此类模型在训练的过程都是单向的：从左到右的语言模型，而其训练目标任务很简单，就是预测下一个token是什么。

GPT-3的模型训练过程仅仅由decoder组成，并且事实证明此结构的模型能够在少样本领域取得显著的效果，

原始的transformer模型是由encoder和decoder两个组成部分，分别由多层的Transformerlayer叠加组成，同时此结构能够很好的解决机器翻译任务。

【介绍机器翻译过程中的计算逻辑。】

## 到底什么样的模型好

refer to

* [https://analyticsindiamag.com/the-rise-of-decoder-only-transformer-models/](https://analyticsindiamag.com/the-rise-of-decoder-only-transformer-models/)
