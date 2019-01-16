from django import forms

class BootStrapModelForm(forms.ModelForm):
    def __init__(self,*args,**kwargs):
        super(BootStrapModelForm,self).__init__(*args,**kwargs)

        # 循环找到form中所有的字段，为每个字段你添加一个样式
        for k,v in self.fields.items():
            v.widget.attrs['class'] = 'form-control'
