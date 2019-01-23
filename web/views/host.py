from django.shortcuts import render,HttpResponse,redirect
from web.forms.host import HostModelForm
from web import models
from web.utils.pager import Pagination
from web.utils.urls import memory_reverse

def host_list(request):
    """
    部门列表
    :param request:
    :return:
    """
    # 要查看的页码
    page = request.GET.get('page', 1)

    # 数据库中数据总条数
    total_count = models.Host.objects.all().count()

    # 数据库中获取即可
    pager = Pagination(page,total_count,request.path_info)
    depart_queryset = models.Host.objects.all()[pager.start :pager.end]

    return render(request,'host_list.html',{'depart_queryset':depart_queryset,'pager':pager})

def host_add(request):
    """
    添加部门
    :param request:
    :return:
    """

    if request.method == 'GET':
        form = HostModelForm()
        return render(request, 'form.html', {'form':form})
    form = HostModelForm(data=request.POST)
    # 对用户提交的数据进行校验
    if form.is_valid():
        form.save()
        return redirect(memory_reverse(request,'host_list'))
    return render(request, 'form.html', {'form': form})

def host_edit(request,nid):
    """
    编辑部门
    :param request:
    :param nid: 当前要编辑的部门ID
    :return:
    """
    obj = models.Host.objects.filter(id=nid).first() # 包含此行的所有数据
    if request.method == "GET":
        # 生成HTML标签 + 携带默认值
        form = HostModelForm(instance=obj)
        return render(request,'form.html',{'form':form}) # 带默认值
    form = HostModelForm(data=request.POST,instance=obj)
    if form.is_valid():
        form.save()
        return redirect(memory_reverse(request,'host_list'))
    return render(request, 'form.html', {'form': form})

def host_del(request,nid):
    """
    删除部门
    :param request:
    :param nid:
    :return:
    """
    origin = memory_reverse(request,'host_list')
    if request.method == 'GET':
        return render(request, 'delete.html', {'cancel': origin})
    models.Host.objects.filter(id=nid).delete()
    return redirect(origin)