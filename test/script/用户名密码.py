import paramiko
a='index.php,hu.html'
# 创建SSH对象
ssh = paramiko.SSHClient()
# 允许连接不在know_hosts文件中的主机
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
# 连接服务器
ssh.connect(hostname='192.168.10.227', port=22, username='root', password='123')
# 执行命令
stdin, stdout, stderr = ssh.exec_command('echo {0} >  /home/yx/include.list'.format(a))
stdin, stdout, stderr = ssh.exec_command('cat /home/yx/include.list')
# 获取命令结果
result = stdout.read().decode()

print(result)
# 关闭连接
# ssh.close()

