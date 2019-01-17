from django.forms import ModelForm
from web.forms.base import BootStrapModelForm
from web import models

class HostModelForm(BootStrapModelForm):
    class Meta:
        model = models.Host
        fields = "__all__"