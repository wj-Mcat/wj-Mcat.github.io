---
title: type hinting in python
date: 2022-6-3
tags:
    - python
---


<!--more -->

## 场景

* 开发者直接在源代码中添加type hinting
* 开发者通过stub file来添加type hinting
* 开发者不想在原始代码中添加，而是想通过第三方package来解决type hinting的问题，从而实现最低无侵入性的实现。

[561 PEP](https://peps.python.org/pep-0561/) 旨在解决实现以上三种场景。

## 打包类型信息

如果要强制添加


```python
setup(
    ...,
    package_data = {
        'foopkg': ['py.typed'],
    },
    ...,
)
```

### Stub Only Packages

