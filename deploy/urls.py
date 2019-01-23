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
from web.views import account
from web.views import project
from web.views import depart
from web.views import host
from web.views import user
from web.views import deploy
from web.views import script
from web.views import file

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^login/$', account.login, name='login'),
    # 注销
    url(r'^logout/$',account.logout),
    url(r'^check/code/$', account.check_code, name='check_code'),  # 验证码路径

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
    # 发布任务
    url(r'^deploy/list/(?P<project_id>\d+)/$', deploy.deploy_list, name='deploy_list'),
    # 添加发布任务
    url(r'^deploy/add/(?P<project_id>\d+)/$', deploy.deploy_add, name='deploy_add'),
    url(r'^deploy/edit/(?P<project_id>\d+)/(?P<nid>\d+)/$', deploy.deploy_edit, name='deploy_edit'),
    url(r'^deploy/del/(?P<project_id>\d+)/(?P<nid>\d+)/$', deploy.deploy_del, name='deploy_del'),
    # url(r'^deploy/rollback/(?P<project_id>\d+)/(?P<nid>\d+)/$', deploy.deploy_rollback, name='deploy_rollback'),



    # 拉代码
    url(r'^deploy/fetch/(?P<project_id>\d+)/(?P<deploy_id>\d+)/$', deploy.deploy_fetch, name='deploy_fetch'),
    # 上传代码
    url(r'^deploy/push/(?P<project_id>\d+)/(?P<deploy_id>\d+)/$', deploy.deploy_push, name='deploy_push'),


    # url(r'^deploy/rollback_list/(?P<project_id>\d+)/$', deploy.deploy_rollback_list, name='deploy_rollback_list'),
    # 回滚
    # url(r'^deploy/rollback/(?P<project_id>\d+)/(?P<deploy_id>\d+)/$', deploy.deploy_rollback, name='deploy_rollback'),
    url(r'^deploy/rollback/(?P<project_id>\d+)/$', deploy.deploy_rollback, name='deploy_rollback'),

    # script
    url(r'^script/list/$',script.script_list,name='script_list'),
    url(r'^script/add/$',script.script_add,name='script_add'),
    url(r'^script/edit/(\d+)/$',script.script_edit,name='script_edit'),
    url(r'^script/del/(\d+)/$',script.script_del,name='script_del'),

    # file_url
    url(r'^file/list/$', file.file_list, name='file_list'),
    url(r'^file/add/$', file.file_add, name='file_add'),
    url(r'^file/edit/(\d+)/$', file.file_edit, name='file_edit'),
    url(r'^file/del/(\d+)/$', file.file_del, name='file_del'),
]
