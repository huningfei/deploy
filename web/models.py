from django.db import models


class UserInfo(models.Model):
    """
    用户表
    """
    username = models.CharField(verbose_name='用户名', max_length=32)
    password = models.CharField(verbose_name='密码', max_length=64)

    server_name = models.CharField(verbose_name='SSH用户名', max_length=32)
    server_private_key = models.TextField(verbose_name='SSH私钥')

    git_name = models.CharField(verbose_name='git用户名', max_length=32)
    git_pwd = models.CharField(verbose_name='git密码', max_length=32)


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
    depart = models.ForeignKey(verbose_name='部门', to='Department')
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
    project = models.ForeignKey(verbose_name='项目', to='Project')
    version = models.CharField(verbose_name='版本', max_length=32)
    uid = models.CharField(verbose_name='上线文件包名称', max_length=32, null=True, blank=True)
    status_choice = (
        (1, '未获取'),
        (2, '待发布'),
        (3, '已发布'),
        (4, '已回滚'),
    )
    status = models.IntegerField(verbose_name='状态', choices=status_choice, default=1)
    script = models.ForeignKey(verbose_name='script', to='Script', null=True, blank=True)


class DeployRecord(models.Model):
    """
    服务器部署记录
    """
    deploy = models.ForeignKey(verbose_name='部署任务', to='Deploy')
    host = models.ForeignKey(verbose_name='主机', to='Host')
    host_version = models.CharField(verbose_name='版本', max_length=32,null=True)

    status_choice = (
        (1, '发布中'),
        (2, '成功'),
        (3, '失败'),
    )
    status = models.IntegerField(verbose_name='状态', choices=status_choice, default=1)
    deploy_time = models.DateTimeField(verbose_name='部署时间', auto_now_add=True)

    log = models.TextField(verbose_name='日志')

class RollbackRecord(models.Model):
    """
    服务器部署记录
    """
    deploy = models.ForeignKey(verbose_name='部署任务', to='Deploy')
    host = models.ForeignKey(verbose_name='主机', to='Host')
    host_version = models.CharField(verbose_name='版本', max_length=32,null=True)

    status_choice = (
        (1, '发布中'),
        (2, '成功'),
        (3, '失败'),
    )
    status = models.IntegerField(verbose_name='状态', choices=status_choice, default=1)
    deploy_time = models.DateTimeField(verbose_name='部署时间', auto_now_add=True)

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
