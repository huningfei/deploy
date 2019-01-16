from django.urls import reverse


def memory_reverse(request, name, *args, **kwargs):
    """
    反向生成带条件的URL
    :param request:  传这个参数是获取url后面携带的参数
    :param name:  这个是views里面url的别名
    :param args:
    :param kwargs:
    :return:
    """

    url = reverse(name, args=args, kwargs=kwargs)
    filter = request.GET.get('_filter')
    if not filter:
        return url
    return "%s?%s" % (url, filter,)
