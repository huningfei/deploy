import re
from django.utils.deprecation import MiddlewareMixin
from django.conf import settings
from django.shortcuts import HttpResponse,render


class RBACMiddleware(MiddlewareMixin):
    """
    用户权限校验的中间件
    """
    def process_request(self, request):
        """
        权限校验
            1. 当前请求的URL
            2. 去Session中获取当前用户拥有的所有的权限
            3. 权限校验
        :param request:
        :return:
        """
        
        current_url = request.path_info
        # 1. 白名单处理
        for valid in settings.VALID_LIST:
            if re.match(valid,current_url):
                return None
            
        # 2. 获取权限信息
        permission_dict = request.session.get(settings.RBAC_PERMISSION_SESSION_KEY)
        if not permission_dict:
            return HttpResponse('当前用户无权限信息，请重新登录！')
        """
        permission_dict = {
            'user_list': {'url': '/app01/user/', 'menu_id': 1, 'parent_name': None},
            'user_add': {'url': '/app01/user/add/', 'menu_id': None, 'parent_name': 'user_list'},
            'user_edit': {'url': '/app01/user/edit/(\\d+)', 'menu_id': None, 'parent_name': 'user_list'},
            'order': {'url': '/app01/order/', 'menu_id': 2, 'parent_name': None}
        }
        """
        
        # 3. 权限匹配
        match = False
        for k,v in permission_dict.items():
            reg = "^%s$" % v['url']
            if re.match(reg,current_url):
                # 用于以后生成菜单时候，设置默认选中的菜单。
                if v['menu_id']:
                    request.default_selected_menu_name = k
                else:
                    request.default_selected_menu_name = v['parent_name']
                match = True
                break
                
        if not match:
            # return render(request, 'login.html')
            return HttpResponse('无权访问')
