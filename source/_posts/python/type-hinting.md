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

如果开发者希望代码能够支持 type checking，此时就必须要添加一个`py.typed`文件在项目当中，这样当前当所在目录以及所有子文件夹都将会自动开启类型检查功能。

## 基本原理

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

此时就需要单独发布一个包，并且里面只包含stubfiles，并且格式为：`<package-name>-stubs`，比如`paddlenlp-stubs`，此外paddlenlp就不需要是添加`py.typed`文件了，因为`**-stubs`就已经表示此包使用了类型检查的功能。

### Partial Stub Files

需要在包中添加`partial\n`来说明包被分成了`n`个组成部分。

如果只想针对于项目中的部分模块做对应的类型注释，此时就需要使用`py.typed`来设置，详细可见[PEP 420](https://peps.python.org/pep-0420).

`namespace packages`是一种不完整的包，可使包变得更加完整。
