from django.shortcuts import render,HttpResponse,redirect
# from web.forms.develop import OnlinelistModelForm
from web import models
from web.utils.pager import Pagination
from web.utils.urls import memory_reverse
from django.contrib.auth.decorators import login_required
# @login_required()
def online_list(request):
    """
    上线单列表
    :param request:
    :return:
    """
    # 要查看的页码
    page = request.GET.get('page', 1)

    # 数据库中数据总条数
    total_count = models.Onlinelist.objects.all().count()

    # 数据库中获取即可
    pager = Pagination(page,total_count,request.path_info)
    depart_queryset = models.Onlinelist.objects.all()[pager.start :pager.end]

    return render(request, 'online/online_list.html', {'depart_queryset':depart_queryset, 'pager':pager})

