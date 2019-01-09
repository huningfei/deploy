from django.shortcuts import render,HttpResponse,redirect
from web.forms.user import UserModelForm
from web import models
from web.utils.pager import Pagination
from web.utils.urls import memory_reverse

def user_list(request):
    """
    用户列表
    :param request:
    :return:
    """
    # 获取用户传过来的要查看的页码，如果没有，默认是1
    page = request.GET.get('page', 1)

    # 数据库中数据总条数
    total_count = models.UserInfo.objects.all().count()

    # 数据库中获取即可
    pager = Pagination(page,total_count,request.path_info)
    depart_queryset = models.UserInfo.objects.all()[pager.start :pager.end]

    return render(request,'user_list.html',{'depart_queryset':depart_queryset,'pager':pager})

def user_add(request):
    """
    添加  用户
    :param request:
    :return:
    """

    if request.method == 'GET':
        form = UserModelForm()
        return render(request, 'form.html', {'form':form})
    form = UserModelForm(data=request.POST)
    # 对用户提交的数据进行校验
    if form.is_valid():
        form.save()
        return redirect(memory_reverse(request,'user_list'))
    return render(request, 'form.html', {'form': form})

def user_edit(request,nid):
    """
    编辑  用户
    :param request:
    :param nid: 当前要编辑的部门ID
    :return:
    """
    obj = models.UserInfo.objects.filter(id=nid).first() # 包含此行的所有数据
    if request.method == "GET":
        # 生成HTML标签 + 携带默认值
        form = UserModelForm(instance=obj)
        return render(request,'form.html',{'form':form}) # 带默认值
    form = UserModelForm(data=request.POST,instance=obj)

    if form.is_valid():
        print('写入数据库')
        form.save()
        return redirect(memory_reverse(request,'user_list'))
    return render(request, 'form.html', {'form': form})

def user_del(request,nid):
    """
    删除  用户
    :param request:
    :param nid:
    :return:
    """
    origin = memory_reverse(request,'user_list')
    if request.method == 'GET':
        return render(request, 'delete.html', {'cancel': origin})
    models.UserInfo.objects.filter(id=nid).delete()
    return redirect(origin)