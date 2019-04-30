from django.template import Library
from django.conf import settings

register = Library()

@register.filter

def permission(name,request):
    '''
    用于权限颗粒度的控制，按钮显示与不显示
    :param name:
    :param request:
    :return:
    '''
    if name in request.session.get(settings.RBAC_PERMISSION_SESSION_KEY):  # 如果在里面就返回true
        return True



@register.inclusion_tag('rbac/menu.html')
def get_menu(request):
    """
    动态生成二级菜单
    :param request:
    :return:
    """
    menu_dict = request.session.get(settings.RBAC_MENU_SESSION_KEY)
    """
    {
        1: {
            'title': '用户管理',
            'icon': 'fa-clipboard',
            'class':'',
            'children': [
                {'title': '用户列表', 'url': '/app01/user/', 'name': 'user_list','class':'active'}
            ]
        },
        2: {
            'title': '商品管理',
            'icon': 'fa-clipboard',
            'class':'hide',
            'children': [
                {'title': '订单列表', 'url': '/app01/order/', 'name': 'order'},
                {'title': '个人中心', 'url': '/app01/certer/', 'name': 'center'}
            ]
        }
    }
    """
    for k,v in menu_dict.items():
        for child in v['children']:
            name = child['name']
            if request.default_selected_menu_name == name:
                child['class'] = 'active'
                v['class'] = ''
                
    return {'menus': list(menu_dict.values()) }