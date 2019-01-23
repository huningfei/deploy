from django.forms import ModelForm
from web.forms.base import BootStrapModelForm
from web import models

class FileModelForm(BootStrapModelForm):
    class Meta:
        model = models.File
        fields = "__all__"