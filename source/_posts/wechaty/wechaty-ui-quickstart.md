---
title: Wechaty UI QuickStart
tags:
  - ui
  - wechaty
author: wj-Mcat
date: 2022-08-14
---

Wechaty UI能够让开发者为自己的插件编写对应的UI，从而实现交互式界面，这篇文章将要介绍如何使用为插件编写对应的UI。

<!--more-->

# QuickStart

在这里将带着各位开发者实现一个：从server端获取点击数量的前后端交互界面功能。功能展示如下所示：

![]()

## 编写插件基类

```python
from quart import Quart, render_template_string, jsonify
from wechaty import WechatyPlugin

class CounterPlugin(WechatyPlugin):
    # 需要和blueprint注册的UI入口地址一致
    VIEW_URL = '/api/plugins/counter/view'

    def __init__(self):
        # 此方法不能删除
        super().__init__()
        self.count = 0

    async def blueprint(self, app: Quart) -> None:
        
        @app.route('/api/plugins/counter/view')
        async def get_counter_view():
            
            with open("./src/plugins/views/table.jinja2", 'r', encoding='utf-8') as f:
                template = f.read()

            self.count += 1
            response = await render_template_string(template, count=self.count)
            return response
```

此插件中需要注意如下几个地方：
* `VIEW_URL`: UI 页面加载的入口，在类中注册的属性必须和`blueprint`中一致。
* `blueprint`: 此函数传递一个Quart对象以此注册全局路由来处理不同UI逻辑。
* `view`入口（get_counter_view）:  返回的只需要是浏览器可识别的元素即可，可为：字符串、html代码、jinja2 渲染数据之后的数据（也是字符串）

## 添加UI代码

```jinja2
<h2>来自于服务器的数据</h2>
<ul>
{% for item in tables %}
    <li>{{item}}</li>
{% endfor %}
</ul>
```

通过以上两个步骤即可实现一个：实时统计页面浏览数量的插件。是不是很简单，可是这个实在是太过于简单，接下来我将给大家介绍如何使用vue2编写一个前后端有交互的UI元素。

# Vue Counter

在以上的示例代码中，每次都是通过刷新页面从而得到浏览次数的更新，在这个功能中只需要通过按钮即可实现浏览次数的新增，理论上只需要作如下几个地方的调整即可：

* 在插件中添加前后端交互的接口函数：`get_ui_counter_view`
* 添加vue代码

## Vue Counter Plugin

```python
class UICounterPlugin(WechatyPlugin):
    # 需要和blueprint注册的UI入口地址一致
    VIEW_URL = '/api/plugins/ui_counter/view'

    def __init__(self):
        # 此方法不能删除
        super().__init__()
        self.count = 0

    async def blueprint(self, app: Quart) -> None:
        
        @app.route('/api/plugins/ui_counter/view')
        async def get_ui_counter_view():
            
            with open("./src/plugins/views/vue.html", 'r', encoding='utf-8') as f:
                template = f.read()
            return template
        
        @app.route('/api/plugins/ui_counter/count')
        async def get_ui_count():
            self.count += 0
            return jsonify({"data": self.count})
```

## Vue Counter UI

```html
<body>
  <div id="app">
    <el-button @click="refresh">Click</el-button>
    <span>Count: {{count}}</span>
  </div>
</body>
<script>
  new Vue({
    el: '#app',
    data: function() {
      return { 
        count: 0
      }
    },
    mounted() {
      this.refresh()
    },
    methods: {
      refresh() {
        let $this = this;
        axios.get("/api/plugins/ui_counter/count").then(function(e){
          $this.count = e.data.data
          
          $this.$notify({
            type: "success",
            message: "点击量+1"
          })
        })
      }
    }
  })
</script>
```

以上代码代码展示了如何使用vue来编写最小版本的前后端交互代码，如果各位开发者想要实现更加复杂的前后端交互方式，可直接使用[vue-admin-template](https://github.com/PanJiaChen/vue-admin-template)构建。

# 文档

## WechatyPlugin

这是所有插件的基类，提供了全部接口，

# 如何扩展

# 总结