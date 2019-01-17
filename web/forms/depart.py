# ModelForm有两大功能
#   1. 生成HTMl标签
#   2. 表单校验

from django.forms import ModelForm
from web.forms.base import BootStrapModelForm
from web import models

class DepartModelForm(BootStrapModelForm):
    class Meta:
        model = models.Department
        fields = "__all__"