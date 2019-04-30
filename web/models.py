from django.db import models

from django.contrib.auth.models import AbstractUser
from rbac.models import UserInfo # 从rbac里面导入用户表
class UserInfo(AbstractUser):
    """
    用户表
    """
    # username = models.CharField(verbose_name='用户名', max_length=32)
    # password = models.CharField(verbose_name='密码', max_length=64)

    server_name = models.CharField(verbose_name='SSH用户名', max_length=32,blank=True)
    server_private_key = models.TextField(verbose_name='SSH私钥',blank=True)

    git_name = models.CharField(verbose_name='git用户名', max_length=32,null=True,blank=True)
    git_pwd = models.CharField(verbose_name='git密码', max_length=32,null=True,blank=True)
    wechat_user = models.CharField(u'微信用户名', max_length=64,null=True)
    # email = models.EmailField(u'邮箱', max_length=64)
    # name = models.CharField(u'姓名', max_length=64)
    jobs = models.CharField(u'工作职位', max_length=64,null=True)
    def __str__(self):
        return self.username

    class Meta:  # 表名显示中文


        verbose_name = "员工表"
        verbose_name_plural = verbose_name  # 复数的意思，如果不加这个后面会多个s


class Host(models.Model):
    """
    主机表
    """
    hostname = models.CharField(verbose_name='主机名', max_length=32)
    ssh_port = models.IntegerField(verbose_name='SSH端口')

    # Deploy = models.ForeignKey(verbose_name='发布任务', to='Deploy',null=True)

    def __str__(self):
        return self.hostname


class Department(models.Model):
    """
    部门表
    """
    title = models.CharField(verbose_name='部门', max_length=32)

    def __str__(self):
        return self.title


class Project(models.Model):
    """
    项目表
    """
    depart = models.ForeignKey(verbose_name='部门', on_delete=models.CASCADE,to='Department')
    title = models.CharField(verbose_name='项目名称', max_length=32)
    git = models.CharField(verbose_name='仓库地址', max_length=128)
    private = models.BooleanField(verbose_name='是否私有', default=True)
    online_path = models.CharField(verbose_name='线上项目路径', max_length=128)
    hosts = models.ManyToManyField(verbose_name='关联主机', to='Host')


class Deploy(models.Model):
    """
    部署任务表
        例如：
            1       0.11
            2       1.10
            1       0.12
    """
    project = models.ForeignKey(verbose_name='项目', to='Project',on_delete=models.CASCADE)
    # version = models.CharField(verbose_name='版本', max_length=32)
    branch = models.CharField(verbose_name='分支', max_length=32,null=True)
    uid = models.CharField(verbose_name='上线文件包名称', max_length=32, null=True, blank=True)
    time = models.DateTimeField(verbose_name='拉取时间', auto_now_add=True,null=True)
    status_choice = (
        (1, '未获取'),
        (2, '待发布'),
        (3, '已发布'),

    )
    status = models.IntegerField(verbose_name='状态', choices=status_choice, default=1)
    script = models.ForeignKey(verbose_name='script', to='Script', null=True, blank=True,on_delete=models.CASCADE)


class DeployRecord(models.Model):
    """
    服务器部署记录
    """
    deploy = models.ForeignKey(verbose_name='部署任务', to='Deploy',on_delete=models.CASCADE)
    host = models.ForeignKey(verbose_name='主机', to='Host',on_delete=models.CASCADE)
    host_version = models.CharField(verbose_name='版本', max_length=32,null=True)

    status_choice = (
        (1, '发布中'),
        (2, '发布成功'),
        (3, '发布失败'),
    )
    status = models.IntegerField(verbose_name='状态', choices=status_choice, default=1)
    deploy_time = models.DateTimeField(verbose_name='发布时间', auto_now_add=True)

    log = models.TextField(verbose_name='日志')

class RollbackRecord(models.Model):
    """
    服务器回滚记录
    """
    deploy = models.ForeignKey(verbose_name='部署任务', to='Deploy',on_delete=models.CASCADE)
    host = models.ForeignKey(verbose_name='主机', to='Host',on_delete=models.CASCADE)
    host_version = models.CharField(verbose_name='版本', max_length=32,null=True)

    status_choice = (
        (1, '回滚中'),
        (2, '回滚成功'),
        (3, '回滚失败'),
    )
    status = models.IntegerField(verbose_name='状态', choices=status_choice, default=1)
    deploy_time = models.DateTimeField(verbose_name='回滚时间', auto_now_add=True)

    rollback_log = models.TextField(verbose_name='日志')

class Script(models.Model):
    """
    script
    """
    title = models.CharField(verbose_name='标题', max_length=128)
    interpreter_choices = {
        ('py', 'python3'),
        ('sh', 'bash')
    }
    interpreter = models.CharField(verbose_name='解释器', choices=interpreter_choices, default='py', max_length=16)
    code = models.TextField(verbose_name='上传脚本')
    rollback_code = models.TextField(verbose_name='回滚脚本',null=True)

    def __str__(self):
        return self.title
class Sqlcredential(models.Model):
    """
    数据库修改
    """
    database_name=models.CharField(verbose_name="修改库名",max_length=256)
    Apply_time=models.DateTimeField(verbose_name="申请日期",)
    sql_yj=models.TextField(verbose_name='SQL语句',max_length=1024)
    Rollback_name=models.CharField(verbose_name='回滚方案',max_length=128)
    Development_qz=models.CharField(verbose_name='开发签字',max_length=128)
    Project_qz=models.CharField(verbose_name='项目负责人签字',max_length=128)
    Technical_qz=models.CharField(verbose_name='技术总监签字',max_length=128)
    op_qz=models.CharField(verbose_name='运维签字',max_length=256)
    Project_confirm_qz = models.CharField(verbose_name='项目负责人确认签字', max_length=128)
    status_choices = ((1, '提交更新'),
                      (2, '负责人审核'),
                      (3, '运维操作'),
                      (4, '否决上线'),
                      (5, '回滚'),
                      (6, '流程结束'))
    status = models.IntegerField(verbose_name='状态', choices=status_choices, default=1)
    staff = models.ForeignKey(to="UserInfo", on_delete=models.CASCADE, null=True)

class Onlinedetails(models.Model):
    """
    上线单详情
    """
    # Online_project = models.CharField(verbose_name="上线项目(版本号)", max_length=256, blank=True,null=True)
    # Online_time = models.DateTimeField(verbose_name="上线日期", max_length=256, blank=True,null=True)


    Online_step = models.TextField(verbose_name="上线步骤",null=True)
    Branch_status = models.CharField(verbose_name='分支合并状态', max_length=256,null=True)
    Influence = models.CharField(verbose_name='代码修改影响点', max_length=256,null=True)
    details = models.OneToOneField(to="Onlinelist", on_delete=models.CASCADE, null=True)
    # staff = models.OneToOneField(to="Staff", on_delete=models.CASCADE)
    staff = models.ForeignKey(to="UserInfo", on_delete=models.CASCADE,null=True) #项目负责人





    class Meta:
        verbose_name = "上线单详情表"
        verbose_name_plural = verbose_name
class Onlinelist(models.Model):
    """
    上线单列表
    """
    Online_project = models.CharField(verbose_name="上线项目(版本号)", max_length=256, blank=True)
    Online_time = models.DateTimeField(verbose_name="上线日期", max_length=256, blank=True)
    Rollback_name = models.CharField(verbose_name='回滚方案', max_length=128, null=True)
    Op_qz = models.CharField(verbose_name='运维签字', max_length=256, null=True)
    Rd_qz = models.CharField(verbose_name='rd签字', max_length=256, null=True)
    Test_qz = models.CharField(verbose_name='测试签字', max_length=256, null=True)
    Ui_qz = models.CharField(verbose_name='ui签字', max_length=256, null=True)
    Pm_qz = models.CharField(verbose_name='产品签字', max_length=256, null=True)
    Zj_qz = models.CharField(verbose_name='总监签字', max_length=256, null=True)
    Rallback_result = models.CharField(verbose_name='回归结果测试产品签字', max_length=256, null=True)
    status_choices = ((1, '提交更新'),
                      (2, '负责人审核'),
                      (3, '预上线'),
                      (4, '代码上线'),
                      (5, '回归中'),
                      (6, '回归完成'),
                      (7, '回滚'),
                      (8, '否决上线'),
                      (9, '流程结束'))
    status = models.IntegerField(verbose_name='状态', choices=status_choices, default=1)
    # test = models.OneToOneField(to="UserInfo", on_delete=models.CASCADE, null=True)  # 测试
    # op = models.OneToOneField(to="UserInfo", on_delete=models.CASCADE, null=True)  # 运维
    # project = models.OneToOneField(to="UserInfo", on_delete=models.CASCADE, null=True)  # 项目负责人
    # pm=models.OneToOneField(to="UserInfo", on_delete=models.CASCADE, null=True) # 产品
    # ui=models.OneToOneField(to="UserInfo", on_delete=models.CASCADE, null=True)



# class Staff(models.Model):
#     """
#     员工详情表
#     """
#     wechat_user = models.CharField(u'微信用户名', max_length=64)
#     email = models.EmailField(u'邮箱', max_length=64)
#     name = models.CharField(u'姓名', max_length=64)
#     jobs = models.CharField(u'工作职位', max_length=64)
#     login_password = models.ForeignKey("UserInfo", on_delete=models.CASCADE,related_name="staff")
#     # Online = models.ForeignKey("Onlinelist", on_delete=models.CASCADE,null=True)
#
#     def __str__(self):  # 页面显示详细信息需要写这个
#         return self.name
#
#     class Meta:  # 表名显示中文
#         verbose_name = "staff表"
#         verbose_name_plural = verbose_name  # 复数的意思，如果不加这个后面会多个s







