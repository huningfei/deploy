from django.forms import ModelForm
from web.forms.base import BootStrapModelForm
from web import models

class OnlineModelForm(BootStrapModelForm):
    class Meta:
        model = models.Onlinedetails
        fields = "__all__"