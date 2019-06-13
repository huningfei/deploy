from django.shortcuts import render, HttpResponse, redirect
from django.urls import reverse
from django.conf import settings
from web import models
from web.utils.check_code import gen_check_code
from io import BytesIO
from django.contrib import auth
##########rbac权限需要导入
from rbac import models as rbac_model # 导入rbac里面的用户表
# 导入权限初始化
from rbac.service.permission import init_permission
# from api.modelform import ApiModelForm, ApplicationModelForm
import requests
from functools import wraps

def login(request):
    """
    用户登录
    :param request:
    :return:
    """
    import random
    data = random.randint(1000, 9999)

    if request.method == 'GET':

        return render(request, 'login.html', {'data': data})
    #
    # next_url = request.POST.get("next")
    # print(next_url)

    code = request.POST.get('code') # 获取网页上面显示的验证码
    check_code = request.session.get('check_code') # 用户输入的验证码
    print('ddddddddddddddd')
    if not code:
        return render(request, 'login.html', {'error': '请输入验证码'})
    if code.upper() != check_code.upper():
        return render(request, 'login.html', {'error': '验证码错误'})
    user = request.POST.get('username')
    pwd = request.POST.get('password')

    # user_object = models.UserInfo.objects.filter(username=user, password=pwd).first()
    user_object = rbac_model.UserInfo.objects.filter(username=user, password=pwd).first()

    # user_object=auth.authenticate(request, username=user, password=pwd)

    if not user_object:
        return render(request, 'login.html', {'error': '用户名或密码错误'})
    request.session['user_id'] = user_object.id  # 登录成功之后将用户信息保存到session里面
    # print('sessin', user_object)

    init_permission(user_object, request)
    return redirect(reverse('online_list'))
    # return redirect('/online/list/')


# 引用gen_check_code,生成验证码

# def login(request):
#     import random
#     data = random.randint(1000, 9999)
#     if request.method == "GET":
#         return render(request, "login.html",{'data': data})
#     else:
#         ode = request.POST.get('code')  # 获取网页上面显示的验证码
#         check_code = request.session.get('check_code') # 用户输入的验证码
#         next_url = request.GET.get("next")
#         print(next_url)
#         if not code:
#             return render(request, 'login.html', {'error': '请输入验证码'})
#         if code.upper() != check_code.upper():
#             return render(request, 'login.html', {'error': '验证码错误'})
#         user = request.POST.get("username")
#         pwd = request.POST.get("password")
#         # user_obj = auth.authenticate(request, username=username, password=pwd)
#         user_obj = models.UserInfo.objects.filter(username=user, password=pwd).first()
#         if user_obj:
#             auth.login(request, user_obj)  # # 给该次请求设置了session数据，并在响应中回写cookie
#             if next_url:
#                 return redirect(next_url)
#             else:
#                 return redirect(reverse('project_list'))
#         else:
#             return render(request, "login.html", {"error_msg": "用户名或密码错误"})



def check_code(request):
    img, code = gen_check_code()
    obj = BytesIO()
    print(obj.getvalue())
    img.save(obj, format='png')
    request.session['check_code'] = code  # 将验证码保存到session里面
    return HttpResponse(obj.getvalue())


def logout(request):
    auth.logout(request)

    return redirect("/login/")


