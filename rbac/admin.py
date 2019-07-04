from django.contrib import admin
from rbac import models




admin.site.register(models.Menu)
# admin.site.register(models.Permission)
admin.site.register(models.Role)
# admin.site.register(models.UserInfo)

# 自定义一个权限管理类
class PermissionAdmin(admin.ModelAdmin):
    list_display = ["title","name","url","menu","parent"]
    list_editable = ["url","menu","parent"]
admin.site.register(models.Permission,PermissionAdmin)


class UserinfoAdmin(admin.ModelAdmin):
    list_display = ["username", ("password"), "email", "wechat_user","jobs",]
    list_editable = ["password","wechat_user","email"]
    search_fields = ['username']
    list_filter = ('username', 'email')
admin.site.register(models.UserInfo,UserinfoAdmin)
