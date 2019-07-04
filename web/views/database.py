from django.shortcuts import render, HttpResponse, redirect
from web.forms.database import DatabasetModelForm
from web import models
from rbac import models as rbac_model  # 导入rbac里面的用户表
from web.utils.pager import Pagination
from web.utils.urls import memory_reverse
from web.utils.send_mail import Mail  # 导入发邮件函数
from web.utils.send_mail import Project_mail  # 导入发邮件函数

from web.utils.send_mail import Op_mail  # 导入运维邮件
from bs4 import BeautifulSoup  # 用来清洗数据
import json


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
    pager = Pagination(page, total_count, request.path_info)
    depart_queryset = models.Sqlcredential.objects.all()[pager.start:pager.end]

    return render(request, 'database/database_list.html', {'depart_queryset': depart_queryset, 'pager': pager})


def database_add(request):
    """
    添加数据库申请单
    :param request:
    :return:
    """
    if request.method == "POST":

        database_name = request.POST.get("database_name")  # 获取项目名字
        Apply_time = request.POST.get("Apply_time")
        sql_yj = request.POST.get("sql_yj")
        Rollback_name = request.POST.get("Rollback_name")
        Development_qz = request.POST.get("Development_qz")

        project = request.POST.getlist("project")  # 获取html页面选择的负责人
        op = request.POST.getlist("op")  # 获取html页面选择的运维人员
        print(project,op)
        # 获取网页提交过来的用户名字，然后写入到数据库
        project_str = ' '.join(project)
        op_str = ' '.join(op)

        email2 = rbac_model.UserInfo.objects.filter(username=project_str).values('email').first()  # 获取员工email地址
        email3 = rbac_model.UserInfo.objects.filter(username=op_str).values('email').first()  # 获取员工email地址
        id_dict = rbac_model.UserInfo.objects.filter(username=project_str).values('id').first()  # 获取员工id
        id = id_dict['id']  # 对应选择人的id


        email2 = json.dumps(email2['email'])  # 员工的邮箱
        email3 = json.dumps(email3['email'])  # 员工的邮箱

        # 给这个邮箱地址发送一封邮件，告诉他有任务要处理
        my_user = Mail(email3, email2)
        # my_user = Mail("huningfei@p2peye.com","825536458@qq.com","huningfei@126.com") # 实例化
        my_user.mail()  # 发送邮件
        soup = BeautifulSoup(sql_yj, "html.parser")

        # 把提交的内容包含有script的标签清洗掉
        for i in soup.find_all("script"):
            # 遍历所有的script标签，删除掉
            i.decompost()

        # with transaction.atomic():
        # 先创建一条上线列表
        report_obj = models.Sqlcredential.objects.create(
            database_name=request.POST.get("database_name"),
            Apply_time=request.POST.get("Apply_time"),
            sql_yj=request.POST.get("sql_yj"),
            Rollback_name=request.POST.get("Rollback_name"),
            Development_qz=request.POST.get("Development_qz"),
            select_project=project_str,
            select_op=op_str,
            staff_id=id,  # 关联员工表
        )

        return redirect("/database/list/")
        # url=request.get_full_path()
        # print(url)
        # staff = models.UserInfo.objects.all()
    project = rbac_model.UserInfo.objects.filter(jobs='项目负责人')  # 只列出项目负责人的名字

    op = rbac_model.UserInfo.objects.filter(jobs='运维')  # 只列出项目负责人的名字
    return render(request, "database/dev_add_database.html", {'all_staff': project, "all_op": op})


def database_detail(request, online_id):
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


def database_edit(request, nid):
    """
    开发编辑数据库申请单
    :param request:
    :param nid: 当前要编辑的部门ID
    :return:
    """
    if request.method == "POST":

        database_name = request.POST.get("database_name")  # 获取项目名字
        Apply_time = request.POST.get("Apply_time")  # 获取提交时间
        sql_yj = request.POST.get("sql_yj")  # 获取sql语句
        Rollback_name = request.POST.get("Rollback_name")  # 获取回滚名称
        Development_qz = request.POST.get("Development_qz")  # 获取开发签字

        project = request.POST.getlist('project')  # 获取html页面选择的负责人对应的id

        op = request.POST.getlist('op')  # 获取html页面选择的运维人员

        # 把获取的id转换成字符串
        project_str = ' '.join(project)
        op_str = ' '.join(op)
        # 根据id获取用户的名字，然后给写入到数据库里面
        project_dict = rbac_model.UserInfo.objects.filter(id=project_str).values('username').first()  # 字典格式

        op_dict = rbac_model.UserInfo.objects.filter(id=op_str).values('username').first()
        # 取出每个用户的名字
        project_name = project_dict['username']  # 取出username
        op_name = op_dict['username']
        # 根据id获取邮箱地址
        email2 = rbac_model.UserInfo.objects.filter(id=project_str).values('email').first()  # 获取员工email地址
        email3 = rbac_model.UserInfo.objects.filter(id=op_str).values('email').first()  # 获取员工email地址

        email2 = json.dumps(email2['email'])  # 员工的邮箱
        email3 = json.dumps(email3['email'])  # 员工的邮箱

        # 给这个邮箱地址发送一封邮件，告诉他有任务要处理
        my_user = Mail(email3, email2)

        my_user.mail()  # 发送邮件
        soup = BeautifulSoup(sql_yj, "html.parser")

        # 把提交的内容包含有script的标签清洗掉
        for i in soup.find_all("script"):
            # 遍历所有的script标签，删除掉
            i.decompost()

        report_obj = models.Sqlcredential.objects.filter(id=nid).update(
            database_name=request.POST.get("database_name"),
            Apply_time=request.POST.get("Apply_time"),
            sql_yj=request.POST.get("sql_yj"),
            Rollback_name=request.POST.get("Rollback_name"),
            Development_qz=request.POST.get("Development_qz"),
            select_op=op_name,
            select_project=project_name,

        )

        return redirect("/database/list/")
    report_obj = models.Sqlcredential.objects.filter(id=nid).first()

    project = rbac_model.UserInfo.objects.filter(jobs='项目负责人')  # 只列出项目负责人的名字

    op = rbac_model.UserInfo.objects.filter(jobs='运维')  # 只列出项目负责人的名字

    # staff_list = request.POST.getlist("version")
    return render(request, "database/dev_edit_database.html",
                  {'report': report_obj, 'all_staff': project, "all_op": op})


def project_database_edit(request, report_id):
    """
    （技术总监）编辑上线单
    :param request:
    :param report_id:
    :return:
    """
    if request.method == "POST":
        url = request.get_full_path()
        print(url)

        new_zj_qz = request.POST.get("Technical_qz"),  # 技术总监签字
        print(new_zj_qz)
        report_obj = models.Sqlcredential.objects.filter(id=report_id).update(

            Technical_qz=request.POST.get("Technical_qz"),

        )
        zj = models.Sqlcredential.objects.filter(id=report_id).values('Technical_qz').first()  # 判断项目负责人是否签字是一个字典格式
        is_null = zj['Technical_qz'].strip()  # 获取项目负责人是否签字是字符串格式


        if is_null == '':  # 如果项目负责人没有签字则发送邮件告知rd,没有通过审核
            try:

                user = request.POST.get("Development_qz")  # 获取发起申请单这个人的用户名
                rd_email_dict = rbac_model.UserInfo.objects.filter(username=user).values(
                    'email').first()  # 根据这个用户名去获取邮箱
                rd_email = rd_email_dict['email']
                my_user = Project_mail(rd_email)  # 实例化
                my_user.projectmail()  # 发送邮件
                models.Sqlcredential.objects.filter(id=report_id).update(status=4)  # 更改状态否决上线
            except Exception as e:
                print(e)
        else:  # 通过审核之后更新状态
            models.Sqlcredential.objects.filter(id=report_id).update(status=2)  # 更改状态
        return redirect("/database/list/")
    report_obj = models.Sqlcredential.objects.filter(id=report_id).first()
    staff = rbac_model.UserInfo.objects.filter(jobs='项目负责人')
    print('项目负责人',staff)
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

        new_test_qz = request.POST.get("op_qz"),  # 运维签字

        report_obj = models.Sqlcredential.objects.filter(id=report_id).update(

            op_qz=request.POST.get("op_qz"),

        )
        op = models.Sqlcredential.objects.filter(id=report_id).values('op_qz').first()  # 判断运维是否签字是一个字典格式
        is_null = op['op_qz']  # 获取运维是否签字是字符串格式

        if is_null == '':  # 如果运维没有签字则发送邮件告知rd,没有通过审核
            try:

                user = request.POST.get("Development_qz")  # 获取填写申请单开发的用户名
                rd_email_dict = rbac_model.UserInfo.objects.filter(username=user).values(
                    'email').first()  # 根据这个用户名去获取邮箱
                rd_email = rd_email_dict['email']
                my_user = Op_mail(rd_email)  # 实例化
                my_user.opmail()  # 发送邮件
                models.Sqlcredential.objects.filter(id=report_id).update(status=4)  # 更改状态否决上线
            except Exception as e:
                print(e)
        else:  # 通过审核之后更新状态
            models.Sqlcredential.objects.filter(id=report_id).update(status=3)  # 更改状态
        return redirect("/database/list/")
    report_obj = models.Sqlcredential.objects.filter(id=report_id).first()

    return render(request, "database/op_database_edit.html", {'report': report_obj, })


def pm_database_edit(request, report_id):
    """
    产品确认数据库申请单
    :param request:
    :param report_id:
    :return:
    """
    if request.method == "POST":
        url = request.get_full_path()
        print(url)

        new_test_qz = request.POST.get("Project_confirm_qz"),  # 产品签字,根据html页面的name字段去写的这里要跟name一致
        print(new_test_qz)
        report_obj = models.Sqlcredential.objects.filter(id=report_id).update(Project_confirm_qz=request.POST.get("Project_confirm_qz"))
        print('差评',report_obj)
        op = models.Sqlcredential.objects.filter(id=report_id).values('Project_confirm_qz').first()  # 判断项目负责人是否签字是一个字典格式
        is_null = op['Project_confirm_qz']  # 获取项目负责人是否签字是字符串格式

        if is_null == '':  # 如果产品没有签字则发送邮件告知rd,没有通过审核
            try:

                user = request.POST.get("Development_qz")  # 获取填写申请单开发的用户名
                rd_email_dict = rbac_model.UserInfo.objects.filter(username=user).values(
                    'email').first()  # 根据这个用户名去获取邮箱
                rd_email = rd_email_dict['email']
                my_user = Op_mail(rd_email)  # 实例化
                my_user.opmail()  # 发送邮件
                models.Sqlcredential.objects.filter(id=report_id).update(status=4)  # 更改状态否决上线
            except Exception as e:
                print(e)
        else:  # 通过审核之后更新状态
            models.Sqlcredential.objects.filter(id=report_id).update(status=6)  # 更改状态为结束
        return redirect("/database/list/")
    report_obj = models.Sqlcredential.objects.filter(id=report_id).first()

    return render(request, "database/pm_database_edit.html", {'report': report_obj, })


def database_del(request, nid):
    """
    删除
    :param request:
    :param nid:
    :return:
    """
    origin = memory_reverse(request, 'database_list')
    if request.method == 'GET':
        return render(request, 'delete.html', {'cancel': origin})
    models.Sqlcredential.objects.filter(id=nid).delete()
    return redirect(origin)
