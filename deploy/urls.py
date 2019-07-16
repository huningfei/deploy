"""deploy URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from web.views import accounts
from web.views import project
from web.views import depart
from web.views import host
from web.views import user
from web.views import deploy
from web.views import script
# from web.views import online
from web.views import database
from web.views import online_detail

from web import views
# from web import urls as online_urls  # 二级路由

urlpatterns = [
    url(r'^$', accounts.login),
    url(r'^admin/', admin.site.urls),
    url(r'^login/$', accounts.login, name='login'),

    # url(r'^accounts/login/$', accounts.login, name='login'),
    # 注销
    url(r'^logout/$', accounts.logout),
    url(r'^check/code/$', accounts.check_code, name='check_code'),  # 验证码路径

    # 部门url
    url(r'^depart/list/$', depart.depart_list, name='depart_list'),
    url(r'^depart/add/$', depart.depart_add, name='depart_add'),
    url(r'^depart/edit/(\d+)/$', depart.depart_edit, name='depart_edit'),
    url(r'^depart/del/(\d+)/$', depart.depart_del, name='depart_del'),
    # host主机
    url(r'^host/list/$', host.host_list, name='host_list'),
    url(r'^host/add/$', host.host_add, name='host_add'),
    url(r'^host/edit/(\d+)/$', host.host_edit, name='host_edit'),
    url(r'^host/del/(\d+)/$', host.host_del, name='host_del'),
    # 用户列表
    url(r'^user/list/$', user.user_list, name='user_list'),
    url(r'^user/add/$', user.user_add, name='user_add'),
    url(r'^user/edit/(\d+)/$', user.user_edit, name='user_edit'),
    url(r'^user/del/(\d+)/$', user.user_del, name='user_del'),
    # 项目
    url(r'^project/list/$', project.project_list, name='project_list'),
    url(r'^project/add/$', project.project_add, name='project_add'),
    url(r'^project/edit/(\d+)/$', project.project_edit, name='project_edit'),
    url(r'^project/del/(\d+)/$', project.project_del, name='project_del'),
    # 搜索
    url(r'^search', project.search, name='search'),
    # 发布任务
    url(r'^deploy/list/(?P<project_id>\d+)/$', deploy.deploy_list, name='deploy_list'),
    # 添加发布任务
    url(r'^deploy/add/(?P<project_id>\d+)/$', deploy.deploy_add, name='deploy_add'),
    # url(r'^deploy/add/(?P<project_id>\d+)/$',views.deploy.deploy_add.as_view(),deploy.deploy_add, name='deploy_add'),

    url(r'^deploy/edit/(?P<project_id>\d+)/(?P<nid>\d+)/$', deploy.deploy_edit, name='deploy_edit'),
    url(r'^deploy/del/(?P<project_id>\d+)/(?P<nid>\d+)/$', deploy.deploy_del, name='deploy_del'),
    # url(r'^deploy/rollback/(?P<project_id>\d+)/(?P<nid>\d+)/$', deploy.deploy_rollback, name='deploy_rollback'),
    # 拉代码
    url(r'^deploy/fetch/(?P<project_id>\d+)/(?P<deploy_id>\d+)/$', deploy.deploy_fetch, name='deploy_fetch'),
    # 上传代码
    url(r'^deploy/push/(?P<project_id>\d+)/(?P<deploy_id>\d+)/$', deploy.deploy_push, name='deploy_push'),


    # url(r'^deploy/rollback_list/(?P<project_id>\d+)/$', deploy.deploy_rollback_list, name='deploy_rollback_list'),
    # 回滚
    url(r'^deploy/rollback/(?P<project_id>\d+)/(?P<deploy_id>\d+)/$', deploy.deploy_rollback, name='deploy_rollback'),
    # url(r'^deploy/rollback/(?P<project_id>\d+)/$', deploy.deploy_rollback, name='deploy_rollback'),

    # script
    url(r'^script/list/$',script.script_list,name='script_list'),
    url(r'^script/add/$',script.script_add,name='script_add'),
    url(r'^script/edit/(\d+)/$',script.script_edit,name='script_edit'),
    url(r'^script/del/(\d+)/$',script.script_del,name='script_del'),

    # 上线单列表
    url(r'^online/list/$', online_detail.online_list, name='online_list'),
    # 查看上线单详情
    url(r'^online/details/(\d+)/$', online_detail.online_detail,name="online_detail"),
    # 开发编辑上线单
    url(r'^online/edit/(\d+)/$', online_detail.online_edit,name="online_edit"),
    # 项目负责人审核上线单
    url(r'^project/online/edit/(\d+)/$', online_detail.project_online_edit,name="project_online_edit"),
    # 测试审核上线单
    url(r'^test/online/edit/(\d+)/$', online_detail.test_online_edit,name="test_online_edit"),
    # 运维审核上线单
    url(r'^op/online/edit/(\d+)/$', online_detail.op_online_edit,name="op_online_edit"),
    # 产品审核上线单
    url(r'^pm/online/edit/(\d+)/$', online_detail.pm_online_edit,name="pm_online_edit"),
    # 删除上线单
    url(r'^online/del/(\d+)/$', online_detail.online_del,name="online_del"),
    # 添加上线单
    url(r'^online/add/$', online_detail.online_add,name="online_add"),
    #数据库列表
    url(r'^database/list/$', database.database_list, name='database_list'),
    # 添加数据库修改申请单
    url(r'^database/add/$', database.database_add,name="database_add"),

    # 查看数据库申请单详情
    url(r'^database/details/(\d+)/$', database.database_detail,name="database_detail"),
    # 开发编辑数据库申请单
    url(r'^database/edit/(\d+)/$', database.database_edit, name="database_edit"),
    # 项目负责人审核数据库申请单
    url(r'^project_database/edit/(\d+)/$', database.project_database_edit, name="project_database_edit"),
    # 运维审核数据库申请单
    url(r'^op_database/edit/(\d+)/$', database.op_database_edit, name="op_database_edit"),
    # 项目负责人编辑数据库申请单
    url(r'^pm_database/edit/(\d+)/$', database.pm_database_edit, name="pm_database_edit"),
    # 删除数据库申请单
    url(r'^database/del/(\d+)/$', database.database_del,name="database_del"),


]
