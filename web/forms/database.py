from django.forms import ModelForm
from web.forms.base import BootStrapModelForm
from web import models

class DatabasetModelForm(BootStrapModelForm):
    class Meta:
        model = models.Sqlcredential
        fields = "__all__"

    def __init__(self, *args, **kwargs):
        super(DatabasetModelForm, self).__init__(*args, **kwargs)

        self.fields['Development_qz'].required = False
        self.fields['Project_qz'].required = False
        self.fields['Technical_qz'].required = False
        self.fields['op_qz'].required = False
        self.fields['Project_confirm_qz'].required = False
        # name = forms.CharField(min_length=4, label="用户名", error_messages={"required": "该字段不能为空"},
        #                        widget=widgets.TextInput(attrs={"class": "form-control"}))

