---
title: http-server review
date: 2022-4-3 23:20:23
tags:
    - python
---

Http Server旨在处理HttpRequest并返回HttpResponse，不同WebFramework具备不同的Routing、View等机制，可都遵循WSGI接口处理Http请求，这样所有的请求就都可以运行在基于WSGI的服务器上，从而实现接口。

在Python中写一个WebFramework是一个很简单的事情，当然入口方法最核心的在于以下此函数：

```python
from werkzeug.serving import run_simple
run_simple(t.cast(str, host), port, self, **options)
```

此代码仅仅是给大家一个直观的感受，后续我将逐渐剖析几个主流WebFramework中的核心技巧和源码实现。

<!--more -->

## Flask 源码

### app.py

* http handler entry point

```python
def __call__(self, environ: dict, start_response: t.Callable) -> t.Any:
    """The WSGI server calls the Flask application object as the
    WSGI application. This calls :meth:`wsgi_app`, which can be
    wrapped to apply middleware.
    """
    return self.wsgi_app(environ, start_response)
```

第一个参数就是http request header的字典类型，此时如何处理header在不同请求头里面的。
start_response 负责status code 和 exception等情况的处理。

* dispatch request

```python
def dispatch_request(self) -> ResponseReturnValue:
    """Does the request dispatching.  Matches the URL and returns the
    return value of the view or error handler.  This does not have to
    be a response object.  In order to convert the return value to a
    proper response object, call :func:`make_response`.

    .. versionchanged:: 0.7
        This no longer does the exception handling, this code was
        moved to the new :meth:`full_dispatch_request`.
    """
    req = _request_ctx_stack.top.request
    if req.routing_exception is not None:
        self.raise_routing_exception(req)
    rule = req.url_rule
    # if we provide automatic options for this URL and the
    # request came with the OPTIONS method, reply automatically
    if (
        getattr(rule, "provide_automatic_options", False)
        and req.method == "OPTIONS"
    ):
        return self.make_default_options_response()
    # otherwise dispatch to the handler for that endpoint
    return self.ensure_sync(self.view_functions[rule.endpoint])(**req.view_args)
```
其中`view_functions`为字典类型，key是module-method identifier，value 是view function。 

> 此类方法看似很简单，其实就这样设计即可实现功能

### view.py

这个模块整体比较简单，

### Route

```python
def route(self, rule: str, **options: t.Any) -> t.Callable:
    """Decorate a view function to register it with the given URL
    rule and options. Calls :meth:`add_url_rule`, which has more
    details about the implementation.

    .. code-block:: python

        @app.route("/")
        def index():
            return "Hello, World!"

    See :ref:`url-route-registrations`.

    The endpoint name for the route defaults to the name of the view
    function if the ``endpoint`` parameter isn't passed.

    The ``methods`` parameter defaults to ``["GET"]``. ``HEAD`` and
    ``OPTIONS`` are added automatically.

    :param rule: The URL rule string.
    :param options: Extra options passed to the
        :class:`~werkzeug.routing.Rule` object.
    """

    def decorator(f: t.Callable) -> t.Callable:
        endpoint = options.pop("endpoint", None)
        self.add_url_rule(rule, endpoint, f, **options)
        return f

    return decorator
```

此函数就负责最常使用的route函数，是不是很简单，并不需要很复杂的设计，只需要完成功能即可。
