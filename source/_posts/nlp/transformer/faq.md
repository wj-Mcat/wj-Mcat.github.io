---
title: Transformer相关技术问题
author: 吴京京
date: 2022-09-12
tags:
    - nlp
    - Transformer
---

## Bert为什么没有Decoder模块

Decoder是否存在其实是依赖于预测目标依赖什么数据的？

> 以下的tokens表示为预测目标

* 传统的Causal Language Model中，每一个token都是通过前面的tokens而得
* Neural Machine Translation（机器翻译）模型中，每一个token都是通过前面的tokens以及原始文本而来，token都是由decoder生成，而原始文本就需要使用encoder来进行编码。当然也并不是所有的翻译模型都是需要encoder+decoder，也是有设decoder-only的翻译模型，比如[Layer-Wise Coordination between Encoder and
Decoder for Neural Machine Translation](https://dl.acm.org/doi/pdf/10.5555/3327757.3327891)
* 在Masked Language Model（如BERT等），每一个被Masked掉的token都是由所在文本中的其他未masked的token来进行预测，原始文本和masked token都在encoder当中处理，所以就不需要decoder了，当然在Masked LM当中并没有严格的限制，比如[MASS](https://arxiv.org/abs/1905.02450)就是一个Encoder-Decoder的生成式模型。

