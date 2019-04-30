from django.shortcuts import render,HttpResponse,redirect
from web.forms.database import DatabasetModelForm
from web import models
from rbac import models as rbac_model  # 导入rbac里面的用户表
from web.utils.pager import Pagination
from web.utils.urls import memory_reverse

def database_list(request):
    """
    数据库修改申请表
    :param request:
    :return:
    """
    # 要查看的页码
    page = request.GET.get('page', 1)

    # 数据库中数据总条数
    total_count = models.Sqlcredential.objects.all().count()

    # 数据库中获取即可
    pager = Pagination(page,total_count,request.path_info)
    depart_queryset = models.Sqlcredential.objects.all()[pager.start :pager.end]

    return render(request, 'database/database_list.html', {'depart_queryset':depart_queryset, 'pager':pager})

def database_add(request):
    """
    添加数据库修改申请单
    :param request:
    :return:
    """
    if request.method == 'GET':
        form = DatabasetModelForm()
        return render(request, 'form.html', {'form': form})
    form = DatabasetModelForm(data=request.POST)
    # 对用户提交的数据进行校验
    if form.is_valid():
        form.save()
        return redirect(memory_reverse(request, 'database_list'))
    return render(request, 'form.html', {'form': form})

def database_detail(request,online_id):
        """
        数据库修改申请单详情页面
        :param request:
        :return:
        """
        # 数据库中数据总条数
        total_count = models.Sqlcredential.objects.filter(id=online_id).first()
        print(total_count)
        if not total_count:
            return HttpResponse("404")

        return render(request, 'database/database_detail.html', {'report': total_count})

def database_edit(request,nid):
    """
    编辑数据库申请单
    :param request:
    :param nid: 当前要编辑的部门ID
    :return:
    """
    obj = models.Sqlcredential.objects.filter(id=nid).first() # 包含此行的所有数据
    if request.method == "GET":
        # 生成HTML标签 + 携带默认值
        form = DatabasetModelForm(instance=obj)
        return render(request,'form.html',{'form':form}) # 带默认值
    form = DatabasetModelForm(data=request.POST,instance=obj)
    if form.is_valid():
        form.save()
        return redirect(memory_reverse(request,'database_list'))
    return render(request, 'form.html', {'form': form})



def project_database_edit(request, report_id):
    """
    项目负责人编辑上线单
    :param request:
    :param report_id:
    :return:
    """
    if request.method == "POST":
        url = request.get_full_path()
        print(url)

        new_zj_qz = request.POST.get("Zj_qz"),  # 项目负责人签字
        report_obj = models.Onlinelist.objects.filter(id=report_id).update(

            Zj_qz=request.POST.get("Zj_qz"),

        )
        zj = models.Onlinelist.objects.filter(id=report_id).values('Zj_qz').first()  # 判断项目负责人是否签字是一个字典格式
        is_null = zj['Zj_qz'].strip()  # 获取项目负责人是否签字是字符串格式

        if is_null == 'None':  # 如果项目负责人没有签字则发送邮件告知rd,没有通过审核
            try:

                user = request.POST.get("Rd_qz")  # 获取申请人的用户名
                rd_email_dict = rbac_model.UserInfo.objects.filter(username=user).values(
                    'email').first()  # 根据这个用户名去获取邮箱
                rd_email = rd_email_dict['email']
                my_user = Project_mail(rd_email)  # 实例化
                my_user.projectmail()  # 发送邮件
                models.Onlinelist.objects.filter(id=report_id).update(status=4)  # 更改状态否决上线
            except Exception as e:
                print(e)
        else:  # 通过审核之后更新状态
            models.Onlinelist.objects.filter(id=report_id).update(status=2)  # 更改状态
        return redirect("/database/list/")
    report_obj = models.Onlinelist.objects.filter(id=report_id).first()
    staff = rbac_model.UserInfo.objects.filter(jobs='项目负责人')
    return render(request, "database/project_edit_database.html", {'report': report_obj, 'all_staff': staff})


def op_database_edit(request, report_id):
    """
    运维审核数据库申请单
    :param request:
    :param report_id:
    :return:
    """
    if request.method == "POST":
        url = request.get_full_path()
        print(url)

        new_test_qz = request.POST.get("Op_qz"),  # 运维签字
        report_obj = models.Onlinelist.objects.filter(id=report_id).update(

            Op_qz=request.POST.get("Op_qz"),

        )
        op = models.Onlinelist.objects.filter(id=report_id).values('Op_qz').first()  # 判断项目负责人是否签字是一个字典格式
        is_null = op['Op_qz']  # 获取项目负责人是否签字是字符串格式

        if is_null == 'None':  # 如果测试没有签字则发送邮件告知rd,没有通过审核
            try:

                user = request.POST.get("Rd_qz")  # 获取申请人的用户名
                rd_email_dict = rbac_model.UserInfo.objects.filter(username=user).values(
                    'email').first()  # 根据这个用户名去获取邮箱
                rd_email = rd_email_dict['email']
                my_user = Op_mail(rd_email)  # 实例化
                my_user.opmail()  # 发送邮件
                models.Onlinelist.objects.filter(id=report_id).update(status=4)  # 更改状态否决上线
            except Exception as e:
                print(e)
        else:  # 通过审核之后更新状态
            models.Onlinelist.objects.filter(id=report_id).update(status=3)  # 更改状态
        return redirect("/database/list/")
    report_obj = models.Onlinelist.objects.filter(id=report_id).first()

    return render(request, "database/op_database_edit.html", {'report': report_obj, })

def database_del(request,nid):
    """
    删除
    :param request:
    :param nid:
    :return:
    """
    origin = memory_reverse(request,'database_list')
    if request.method == 'GET':
        return render(request, 'delete.html', {'cancel': origin})
    models.Sqlcredential.objects.filter(id=nid).delete()
    return redirect(origin)