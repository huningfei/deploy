from django.shortcuts import render,HttpResponse,redirect
from web.forms.project import ProjectModelForm
from web import models
from web.utils.pager import Pagination
from web.utils.urls import memory_reverse

def search(request):
    q = request.GET.get('q')

    error_msg = ''

    if not q:
        error_msg = '请输入关键词'
        return render(request, 'result.html', {'error_msg': error_msg})

    # post_list = models.Asset.objects.filter(leader__icontains=q)
    # for i in post_list:
    data_list=models.Project.objects.filter(title__contains=q)

    return render(request, 'result.html', {'error_msg': error_msg, 'post_list': data_list})


def project_list(request):
    page = request.GET.get('page', 1)
    # 数据库中数据总条数
    total_count = models.Project.objects.all().count()
    # 数据库中获取即可
    pager = Pagination(page, total_count, request.path_info)
    depart_queryset = models.Project.objects.all()[pager.start:pager.end]
    return render(request, 'project_list.html', {'depart_queryset': depart_queryset, 'pager': pager})


def project_add(request):
    """
    添加项目
    :param request:
    :return:
    """
    if request.method == 'GET':
        form = ProjectModelForm()
        return render(request, 'form.html', {'form':form})
    form = ProjectModelForm(data=request.POST)
    # 对用户提交的数据进行校验
    if form.is_valid():
        form.save()
        return redirect(memory_reverse(request,'project_list'))
    return render(request, 'form.html', {'form': form})

def project_edit(request,nid):
    """
    编辑项目
    :param request:
    :param nid: 当前要编辑的部门ID
    :return:
    """
    obj = models.Project.objects.filter(id=nid).first() # 包含此行的所有数据
    if request.method == "GET":
        # 生成HTML标签 + 携带默认值
        form = ProjectModelForm(instance=obj)
        return render(request,'form.html',{'form':form}) # 带默认值
    form = ProjectModelForm(data=request.POST,instance=obj)
    if form.is_valid():
        form.save()
        return redirect(memory_reverse(request,'project_list'))
    return render(request, 'form.html', {'form': form})

def project_del(request,nid):
    """
    删除项目
    :param request:
    :param nid:
    :return:
    """
    origin = memory_reverse(request,'project_list')
    if request.method == 'GET':
        return render(request, 'delete.html', {'cancel': origin})
    models.Project.objects.filter(id=nid).delete()
    return redirect(origin)