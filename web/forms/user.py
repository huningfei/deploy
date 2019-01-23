from django.forms import ModelForm
from web.forms.base import BootStrapModelForm
from web import models
from django import forms

class UserModelForm(BootStrapModelForm):
    class Meta:
        model = models.UserInfo
        fields = "__all__"

        widgets={
            "password": forms.widgets.PasswordInput(attrs={"class": "form-control"}),
            "git_pwd": forms.widgets.PasswordInput(attrs={"class": "form-control"}),

        }