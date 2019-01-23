from django.forms import ModelForm
from web.forms.base import BootStrapModelForm
from web import models


class ProjectModelForm(BootStrapModelForm):
    class Meta:
        model = models.Project
        fields = "__all__"

    def __init__(self, *args, **kwargs):
        super(ProjectModelForm, self).__init__(*args, **kwargs)
        self.fields['private'].widget.attrs['class'] = ''  # 让是否为私有去除样式
