---
title: [RFC]: Request for Comment
tags:
  - opensource
  - work
author: wj-Mcat
date: 2022-08-22
---

Request For Comment： 适合在团队里面提出一些有建议性的话题来跟大家一起讨论

<!--more-->

# Github RFC

## Abstract

## Problem

## Solution

## Risks

## References


## Abstract

在Token Classification的任务当中，tokens和labels的长度必须是一致的，可是存在一些情况会导致其不一致：

当数据集中已经给出tokens和labels的数据，如tokens=["I", "love", "\xa0", "chinaaaaa"] , labels = ["O", "O", "O", "B"]
当token经过tokenizer之后，由于\0ax会变成空字符串，`chinaaaaa`会变成china, ##a, ##a, ##a, ##a等token，这个时候就会出现问题.

## Problem

## Solution

## Reference

## Risk

## References

* [Token Classification with W-NUT Emerging Entities](https://huggingface.co/transformers/v4.4.2/custom_datasets.html#token-classification-with-w-nut-emerging-entities)
* [Token classification](https://huggingface.co/docs/transformers/tasks/token_classification)


