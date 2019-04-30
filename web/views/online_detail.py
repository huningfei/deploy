from django.shortcuts import render, HttpResponse, redirect
from web.forms.develop import OnlinelistModelForm
from web.forms.online import OnlineModelForm
from web import models
from rbac import models as rbac_model  # 导入rbac里面的用户表
from web.utils.pager import Pagination
from web.utils.urls import memory_reverse
from django.db import transaction
from bs4 import BeautifulSoup  # 用来清洗数据
from django.contrib import auth
from django.contrib.auth.decorators import login_required
from web.utils.send_mail import Mail  # 导入发邮件函数
from web.utils.send_mail import Project_mail  # 导入发邮件函数
from web.utils.send_mail import Test_mail  # 导入测试邮件
from web.utils.send_mail import Op_mail  # 导入运维邮件
from web.utils.send_mail import Pm_mail  # 导入产品邮件
import json


def online_detail(request, online_id):
    """
    上线单详情页面
    :param request:
    :return:
    """

    # 数据库中数据总条数
    total_count = models.Onlinelist.objects.filter(id=online_id).first()
    print(total_count)
    if not total_count:
        return HttpResponse("404")

    return render(request, 'online/online_detail.html', {'report': total_count})


def online_add(request):
    """
    添加上线单
    :param request:
    :return:
    """
    if request.method == "POST":

        Online_project = request.POST.get("Online_project")  # 获取项目名字
        Online_time = request.POST.get("Online_time")
        Online_step = request.POST.get("Online_step")
        Branch_status = request.POST.get("Branch_status")
        Influence = request.POST.get("Influence")
        Rollback_name = request.POST.get("Rollback_name")
        Rd_qz = request.POST.get("Rd_qz")
        staff = request.POST.getlist("version")  # 获取html页面选择的负责人
        test = request.POST.getlist("test")  # 获取html页面选择的负责人
        op = request.POST.getlist("op")  # 获取html页面选择的负责人
        staff_str = ' '.join(staff)
        test_str = ' '.join(test)
        op_str = ' '.join(op)
        print(staff,test,op)
        email1 = rbac_model.UserInfo.objects.filter(username=staff_str).values('email').first()  # 获取员工email地址
        email2 = rbac_model.UserInfo.objects.filter(username=test_str).values('email').first()  # 获取员工email地址
        email3 = rbac_model.UserInfo.objects.filter(username=op_str).values('email').first()  # 获取员工email地址
        id_dict = rbac_model.UserInfo.objects.filter(username=staff_str).values('id').first()  # 获取员工id
        id = id_dict['id']  # 对应选择人的id
        email1 = json.dumps(email1['email'])  # 员工的邮箱
        email2 = json.dumps(email2['email'])  # 员工的邮箱
        email3 = json.dumps(email3['email'])  # 员工的邮箱

        # 给这个邮箱地址发送一封邮件，告诉他有任务要处理
        my_user = Mail(email1, email3, email2)
        # my_user = Mail("huningfei@p2peye.com","825536458@qq.com","huningfei@126.com") # 实例化
        my_user.mail()  # 发送邮件

        # Op_qz = request.POST.get("Op_qz")
        # Test_qz = request.POST.get("Test_qz")
        # Ui_qz = request.POST.get("Ui_qz")
        # Pm_qz = request.POST.get("Pm_qz")
        # Zj_qz = request.POST.get("Zj_qz")
        # Rallback_result = request.POST.get("Online_step")

        soup = BeautifulSoup(Online_step, "html.parser")

        # 把提交的内容包含有script的标签清洗掉
        for i in soup.find_all("script"):
            # 遍历所有的script标签，删除掉
            i.decompost()

        with transaction.atomic():
            # 先创建一条上线列表
            report_obj = models.Onlinelist.objects.create(
                Online_project=request.POST.get("Online_project"),
                Online_time=request.POST.get("Online_time"),
                Rd_qz=request.POST.get("Rd_qz"),
                Op_qz=request.POST.get("Op_qz"),
                Test_qz=request.POST.get("Test_qz"), # 测试
                Zj_qz=request.POST.get("Zj_qz"), #项目负责人
                # Rallback_result=request.POST.get("Rallback_result"),
                Rollback_name=request.POST.get("Rollback_name"),

            )
            # 创建一条上线单详情
            models.Onlinedetails.objects.create(
                Online_step=soup.prettify(),  # 格式化完整的html内容
                Branch_status=request.POST.get("Branch_status"),
                Influence=request.POST.get("Influence"),
                staff_id=id,  # 关联员工表
                details_id=report_obj.id  # 关联上线单列表
            )
            return redirect("/online/list/")
        # url=request.get_full_path()
        # print(url)
        # staff = models.UserInfo.objects.all()
    project = rbac_model.UserInfo.objects.filter(jobs='项目负责人')  # 只列出项目负责人的名字
    test = rbac_model.UserInfo.objects.filter(jobs='测试')  # 只列出项目负责人的名字
    op = rbac_model.UserInfo.objects.filter(jobs='运维')  # 只列出项目负责人的名字

    # staff_list = request.POST.getlist("version")
    return render(request, "dev/dev_add_online.html", {'all_staff': project, "all_test": test, "all_op": op})


def online_edit(request, report_id):
    """
    编辑上线单详情页面
    :param request:
    :param report_id:
    :return:
    """
    if request.method == "POST":
        online_obj=models.Onlinelist.objects.filter(id=report_id)
        new_online_project = request.POST.get("Online_project"),
        new_online_time = request.POST.get("Online_time"),
        print(new_online_project)
        new_op_qz = request.POST.get("Op_qz"),
        # new_ui_qz = request.POST.get("Ui_qz"),
        # new_pm_qz = request.POST.get("Pm_qz"),
        new_zj_qz = request.POST.get("Zj_qz"),
        print(new_op_qz,new_zj_qz)
        Rd_qz = request.POST.get("Rd_qz")
        new_rallback_result = request.POST.get("Rallback_result"),
        new_rollback_name = request.POST.get("Rollback_name"),
        new_branch_status = request.POST.get("Branch_status"),
        new_influence = request.POST.get("Influence"),
        new_Test_qz = request.POST.get("Test_qz")

        new_online_step = request.POST.get("Online_step")
        soup = BeautifulSoup(new_online_step, "html.parser")
        staff = request.POST.getlist("project")  # 获取html页面选择的负责人的id
        test = request.POST.getlist("test")
        op = request.POST.getlist("op")
        project_dict=rbac_model.UserInfo.objects.filter(id=staff).values('username').first()
        test_dict=rbac_model.UserInfo.objects.filter(id=test).values('username').first()
        op_dict=rbac_model.UserInfo.objects.filter(id=op).values('username').first()
        project_name=project_dict['username']
        test_name=test_dict['username']
        op_name=op_dict['username']
        # online_obj.=project_name
        # staff = models.Staff.objects.filter(jobs='项目负责人').values('id').first()
        # id=staff['id']
        staff_str = ' '.join(staff)
        op_str = ' '.join(op)
        test_str = ' '.join(test)
        print(project_name,test_name,op_name)

        # email_dict = rbac_model.UserInfo.objects.filter(id=staff_str).values('email').first()  # 获取员工email地址
        email1 = rbac_model.UserInfo.objects.filter(id=staff_str).values('email').first()  # 获取员工email地址
        email2 = rbac_model.UserInfo.objects.filter(id=test_str).values('email').first()  # 获取员工email地址
        email3 = rbac_model.UserInfo.objects.filter(id=op_str).values('email').first()  # 获取员工email地址
        id_dict = rbac_model.UserInfo.objects.filter(id=staff_str).values('id').first()  # 获取员工id
        id = id_dict['id']
        email1 = json.dumps(email1['email'])  # 员工的邮箱
        email2 = json.dumps(email2['email'])  # 员工的邮箱
        email3 = json.dumps(email3['email'])  # 员工的邮箱

        # 给这个邮箱地址发送一封邮件，告诉他有任务要处理
        my_user = Mail(email2,email1,email3)  # 实例化
        my_user.mail()  # 发送邮件

        # 通过前端页面选择人的姓名去获得相应的email地址
        # email_dict = models.Staff.objects.filter(name=staff_str).values('email').first()
        # print(email_dict)
        # 给这个邮箱地址发送一封邮件，告诉他有任务要处理
        # 把提交的内容包含有script的标签清洗掉
        for i in soup.find_all("script"):
            # 遍历所有的script标签，删除掉
            i.decompost()
        with transaction.atomic():
            report_obj = models.Onlinelist.objects.filter(id=report_id).update(
                Online_project=request.POST.get("Online_project"),
                Online_time=request.POST.get("Online_time"),
                Rd_qz=request.POST.get("Rd_qz"),
                Op_qz=op_name,
                Test_qz=test_name,

                Zj_qz=project_name,
                Rallback_result=request.POST.get("Rallback_result"),
                Rollback_name=request.POST.get("Rollback_name"),

            )
            # 创建一条故障总结详情记录,当你用了.first的时候不能用.update了，queeyset才可以用.update
            models.Onlinedetails.objects.filter(details_id=report_id).update(
                Branch_status=request.POST.get("Branch_status"),
                Influence=request.POST.get("Influence"),
                Online_step=soup.prettify(),  # 格式化完整的html内容
                details_id=report_id,
                staff_id=id,
            )

        return redirect("/online/list/")

    report_obj = models.Onlinelist.objects.filter(id=report_id).first()

    staff = rbac_model.UserInfo.objects.filter(jobs='项目负责人').values('username')

    test = rbac_model.UserInfo.objects.filter(jobs='测试').values("username")  # 只列出项目负责人的名字

    op = rbac_model.UserInfo.objects.filter(jobs='运维').values("username")  # 只列出项目负责人的名字


    return render(request, "dev/dev_edit_online.html",
                  {'report': report_obj, 'all_staff': staff, "all_test": test, "all_op": op})



def online_del(request, report_id):
    with transaction.atomic():
        models.Onlinelist.objects.filter(id=report_id).delete()
        # 创建一条故障总结详情记录
        models.Onlinedetails.objects.filter(details_id=report_id).delete()
    return redirect("/online/list/")


def project_online_edit(request, report_id):
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
                models.Onlinelist.objects.filter(id=report_id).update(status=8)  # 更改状态否决上线
            except Exception as e:
                print(e)
        else:  # 通过审核之后更新状态
            models.Onlinelist.objects.filter(id=report_id).update(status=2)  # 更改状态
        return redirect("/online/list/")
    report_obj = models.Onlinelist.objects.filter(id=report_id).first()
    staff = rbac_model.UserInfo.objects.filter(jobs='项目负责人')
    return render(request, "online/project_edit_online.html", {'report': report_obj, 'all_staff': staff})


def test_online_edit(request, report_id):
    """
    测试审核编辑上线单
    :param request:
    :param report_id:
    :return:
    """
    if request.method == "POST":
        url = request.get_full_path()
        print(url)

        new_test_qz = request.POST.get("Test_qz"),  # 测试签字
        report_obj = models.Onlinelist.objects.filter(id=report_id).update(

            Test_qz=request.POST.get("Test_qz"),

        )
        cs = models.Onlinelist.objects.filter(id=report_id).values('Test_qz').first()  # 判断项目负责人是否签字是一个字典格式
        is_null = cs['Test_qz'].strip()  # 获取项目负责人是否签字是字符串格式

        if is_null == 'None':  # 如果测试没有签字则发送邮件告知rd,没有通过审核
            try:

                user = request.POST.get("Rd_qz")  # 获取申请人的用户名
                rd_email_dict = rbac_model.UserInfo.objects.filter(username=user).values(
                    'email').first()  # 根据这个用户名去获取邮箱
                rd_email = rd_email_dict['email']
                my_user = Test_mail(rd_email)  # 实例化
                my_user.testmail()  # 发送邮件
                models.Onlinelist.objects.filter(id=report_id).update(status=8)  # 更改状态否决上线
            except Exception as e:
                print(e)
        else:  # 通过审核之后更新状态
            models.Onlinelist.objects.filter(id=report_id).update(status=3)  # 更改状态
        return redirect("/online/list/")
    report_obj = models.Onlinelist.objects.filter(id=report_id).first()
    # staff = models.UserInfo.objects.filter(jobs='项目负责人')
    return render(request, "online/test_edit_online.html", {'report': report_obj, })


def op_online_edit(request, report_id):
    """
    运维审核编辑上线单
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
                models.Onlinelist.objects.filter(id=report_id).update(status=8)  # 更改状态否决上线
            except Exception as e:
                print(e)
        else:  # 通过审核之后更新状态
            models.Onlinelist.objects.filter(id=report_id).update(status=4)  # 更改状态
        return redirect("/online/list/")
    report_obj = models.Onlinelist.objects.filter(id=report_id).first()

    return render(request, "online/op_edit_online.html", {'report': report_obj, })


def pm_online_edit(request, report_id):
    """
    产品审核编辑上线单
    :param request:
    :param report_id:
    :return:
    """
    if request.method == "POST":
        url = request.get_full_path()
        print(url)

        new_Pm_qz = request.POST.get("Pm_qz"),
        report_obj = models.Onlinelist.objects.filter(id=report_id).update(

            Pm_qz=request.POST.get("Pm_qz"),

        )
        op = models.Onlinelist.objects.filter(id=report_id).values('Pm_qz').first()
        is_null = op['Pm_qz']  #

        if is_null == 'None':  # 如果没有签字则发送邮件告知rd,没有通过审核
            try:

                user = request.POST.get("Rd_qz")  # 获取申请人的用户名
                rd_email_dict = rbac_model.UserInfo.objects.filter(username=user).values(
                    'email').first()  # 根据这个用户名去获取邮箱
                rd_email = rd_email_dict['email']
                my_user = Pm_mail(rd_email)  # 实例化
                my_user.pmmail()  # 发送邮件
                models.Onlinelist.objects.filter(id=report_id).update(status=8)  # 更改状态否决上线
            except Exception as e:
                print(e)
        else:  # 通过审核之后更新状态
            models.Onlinelist.objects.filter(id=report_id).update(status=9)  # 更改状态
        return redirect("/online/list/")
    report_obj = models.Onlinelist.objects.filter(id=report_id).first()

    return render(request, "online/pm_edit_online.html", {'report': report_obj, })
