#############提交日期 2019-6-13

注意：这个版本是按照分支来获取代码的，主要是针对php代码的，包括发布和回滚功能

1 如果主机未发布过，是不能回滚的，就是不能看到他的版本

2 创建项目的时候，项目的名字要和你giturl后面的那个名字一致

3 在windows上面如果点击获取代码的时候，应该会报拒绝访问，这是因为删除的命令不能在windows上面生效，需要你手动删除codes目录下面的所有代码

4 用了rbac基于角色的权限管理

5 新增了发布和回滚的时候有图标转动提醒

6 发布和回滚主要是借用rsync去实现的，把下载下来的代码拷贝到nginx对应的目录下面

7 需要在对应的用户里面配置私钥，和gitlab的用户名和密码，用于下载代码和连接主机，（项目部署到那台机器，就用那台机器的私钥，并且把这台机器的公钥，放到所有要发布机器的authorized_key文件里面




##########################需要安装的模块
PIL 就是pillow模块
requests   pip install --user requests
paramiko
bs4
#######################################
django后台用户名密码：

admin
root1234
添加用户登录django后台操作
##########################各个角色用户名密码
管理员  admin 123
开发  kf 123
项目负责人 project 123
运维  hu 123
测试  cs 123
产品 pm 123
