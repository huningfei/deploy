from django.forms import ModelForm
from web.forms.base import BootStrapModelForm
from web import models
from django import forms

class UserModelForm(BootStrapModelForm):
    class Meta:
        model = models.UserInfo
        # fields = "__all__"
        fields = ['username','password','server_name','server_private_key','git_name','git_pwd','jobs','email' ]

        #
        widgets={
            "password": forms.widgets.PasswordInput(attrs={"class": "form-c1"},render_value=True),
            "git_pwd": forms.widgets.PasswordInput(render_value=True),

        }