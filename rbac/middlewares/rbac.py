import re
from django.utils.deprecation import MiddlewareMixin
from django.conf import settings
from django.shortcuts import HttpResponse, redirect
from web import models


class RBACMiddleware(MiddlewareMixin):
    """
    用户权限校验的中间件
    """

    def process_request(self, request):
        """
        用户认证
            1. 当前请求的URL
            2. 去Session中获取当前用户拥有的所有的权限
            3. 权限校验
        :param request:
        :return:
        """

        current_url = request.path_info  # 当前浏览器请求的url
        # 1. 白名单处理
        for valid in settings.VALID_LIST:
            if re.match(valid, current_url):
                return None

        user_id = request.session.get('user_id')
        if not user_id:
            return redirect('/login/')

        user_object = models.UserInfo.objects.filter(id=user_id).first() # 获取当前登录用户的对象
        request.user=user_object


