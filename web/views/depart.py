from django.shortcuts import render, HttpResponse, redirect
from web.forms.depart import DepartModelForm
from web import models
from web.utils.pager import Pagination  # 分页功能
from web.utils.urls import memory_reverse


def depart_list(request):
    """
    部门列表
    :param request:
    :return:
    """
    # 要查看的页码
    page = request.GET.get('page', 1)

    # 数据库中数据总条数
    total_count = models.Department.objects.all().count()

    # 数据库中获取即可
    pager = Pagination(page, total_count, request.path_info)  # 调用Pagination类
    # 页面上面显示的数据
    depart_queryset = models.Department.objects.all()[pager.start:pager.end]

    return render(request, 'depart_list.html', {'depart_queryset': depart_queryset, 'pager': pager})


def depart_add(request):
    """
    添加部门
    :param request:
    :return:
    """

    if request.method == 'GET':
        form = DepartModelForm()
        return render(request, 'form.html', {'form': form})
    form = DepartModelForm(data=request.POST)
    # 对用户提交的数据进行校验
    if form.is_valid():
        form.save()
        return redirect(memory_reverse(request, 'depart_list'))
    return render(request, 'form.html', {'form': form})


def depart_edit(request, nid):
    """
    编辑部门
    :param request:
    :param nid: 当前要编辑的部门ID
    :return:
    """
    obj = models.Department.objects.filter(id=nid).first()  # 包含此行的所有数据
    if request.method == "GET":
        # 生成HTML标签 + 携带默认值
        form = DepartModelForm(instance=obj)
        return render(request, 'form.html', {'form': form})  # 带默认值
    form = DepartModelForm(data=request.POST, instance=obj)
    if form.is_valid():
        form.save()
        return redirect(memory_reverse(request, 'depart_list'))
    return render(request, 'form.html', {'form': form})


def depart_del(request, nid):
    """
    删除部门
    :param request:
    :param nid:
    :return:
    """
    origin = memory_reverse(request, 'depart_list') # 代表的是一个url的地址
    if request.method == 'GET': # 如果删除的时候，点取消就返回下面的页面
        return render(request, 'delete.html', {'cancel': origin})  # 把origin传到删除页面，从而点取消之后返回相应页面
    models.Department.objects.filter(id=nid).delete()
    return redirect(origin)
