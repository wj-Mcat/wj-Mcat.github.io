---
title: 什么时候使用Optional
date: 2022-4-3 23:20:23
tags:
    - python
---

所有的 Optional[TypeName] 参数的默认值都必须为None。

## 介绍

在函数的参数列表当中，缺省参数可赋予其默认值，比如：`def sum(x: int = 1, y: Optional[int] = None) -> int: ...`。

可是在实际编码过程中，很容易写成：`def sum(x: int = 1, y: Optional[int] = 2) -> int: ...`。示例代码如下所示：

```python
from typing import Optional

def sum(x: int = 1, y: Optional[int] = 2) -> int:
    y = y or 3
    return x + y
```

如果使用`mypy`对该代码进行代码类型审查时会发现如下问题：

```shell
a.py:8: error: Unsupported operand types for + ("None" and "int")
a.py:8: note: Left operand is of type "Optional[int]"
Found 1 error in 1 file (checked 1 source file)
```

可以发现，`x: Optional[int]`的类型即使是给了默认值`1`，也被当成None或者int了。

## 结论

* `x: int = 1, x: Optional[int] = None`两种写法参数都为可选参数，只不过前者的参数类型始终为`int`，后者的参数类型为`None`或者`int`。
* 如果缺省参数的默认值为None，则此时需要基于`Optional`编写类型注释；如果缺省参数为默认数值，则此时可直接赋予指定类型的数据类型，如`int`。
