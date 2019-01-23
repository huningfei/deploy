from django.shortcuts import render, HttpResponse, redirect
from django.urls import reverse
from web import models
from web.utils.check_code import gen_check_code
from io import BytesIO
from django.contrib import auth


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

    code = request.POST.get('code') # 获取网页上面显示的验证码
    check_code = request.session.get('check_code') # 用户输入的验证码
    if not code:
        return render(request, 'login.html', {'error': '请输入验证码'})
    if code.upper() != check_code.upper():
        return render(request, 'login.html', {'error': '验证码错误'})
    user = request.POST.get('username')
    pwd = request.POST.get('password')
    user_object = models.UserInfo.objects.filter(username=user, password=pwd).first()
    if not user_object:
        return render(request, 'login.html', {'error': '用户名或密码错误'})
    request.session['user_id'] = user_object.id  # 登录成功之后将用户信息保存到session里面
    return redirect(reverse('project_list'))


# 引用gen_check_code,生成验证码
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

