from django import forms
from web.forms.base import BootStrapModelForm
from web import models

class DeployModelForm(BootStrapModelForm):
    class Meta:
        model = models.Deploy
        fields = ['branch','script','file']
        widgets={"file":forms.widgets.Textarea}

    def __init__(self, *args, **kwargs):
        super(DeployModelForm, self).__init__(*args, **kwargs)
        self.fields['file'].required = False


class DeployPushForm(forms.Form):
    hosts = forms.MultipleChoiceField(
        label='选择主机',
        choices=[(1,'1.1.1.1'),(2,'1.1.1.2')],
        widget=forms.CheckboxSelectMultiple()
    )

    def __init__(self,project_object, *args,**kwargs):
        super(DeployPushForm,self).__init__(*args,**kwargs)
        self.fields['hosts'].choices = project_object.hosts.all().values_list('id','hostname')
