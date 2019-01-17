from django.forms import ModelForm
from web.forms.base import BootStrapModelForm
from web import models

class ScriptModelForm(BootStrapModelForm):
    class Meta:
        model = models.Script
        fields = "__all__"