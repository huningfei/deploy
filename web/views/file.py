from django.shortcuts import render,HttpResponse,redirect
from web.forms.file import FileModelForm
from web import models
from web.utils.pager import Pagination
from web.utils.urls import memory_reverse

def file_list(request):
    """
    列表
    :param request:
    :return:
    """
    # 要查看的页码
    page = request.GET.get('page', 1)

    # 数据库中数据总条数
    total_count = models.File.objects.all().count()

    # 数据库中获取即可
    pager = Pagination(page,total_count,request.path_info)
    depart_queryset = models.File.objects.all()[pager.start :pager.end]

    return render(request,'file_list.html',{'depart_queryset':depart_queryset,'pager':pager})

def file_add(request):
    """
    添加
    :param request:
    :return:
    """

    if request.method == 'GET':
        form = FileModelForm()
        return render(request, 'form.html', {'form':form})
    form = FileModelForm(data=request.POST)
    # 对用户提交的数据进行校验
    if form.is_valid():
        form.save()
        return redirect(memory_reverse(request,'file_list'))
    return render(request, 'form.html', {'form': form})

def file_edit(request,nid):
    """
    编辑
    :param request:
    :param nid: 当前要编辑的部门ID
    :return:
    """
    obj = models.File.objects.filter(id=nid).first() # 包含此行的所有数据
    if request.method == "GET":
        # 生成HTML标签 + 携带默认值
        form = FileModelForm(instance=obj)
        return render(request,'form.html',{'form':form}) # 带默认值
    form = FileModelForm(data=request.POST,instance=obj)
    if form.is_valid():
        form.save()
        return redirect(memory_reverse(request,'file_list'))
    return render(request, 'form.html', {'form': form})

def file_del(request,nid):
    """
    删除
    :param request:
    :param nid:
    :return:
    """
    origin = memory_reverse(request,'file_list')
    if request.method == 'GET':
        return render(request, 'delete.html', {'cancel': origin})
    models.File.objects.filter(id=nid).delete()
    return redirect(origin)