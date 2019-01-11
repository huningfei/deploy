import paramiko
key_file=r"C:\Users\Administrator\Desktop\id_rsa"

private_key = paramiko.RSAKey.from_private_key_file(key_file)

# 创建SSH对象
ssh = paramiko.SSHClient()
# 允许连接不在know_hosts文件中的主机
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
# 连接服务器
ssh.connect(hostname='192.168.7.29', port=22, username='yx', pkey=private_key)
# 执行命令
stdin, stdout, stderr = ssh.exec_command('ls /home/yx/deploy/codes/dbhot')
# 获取命令结果
result = stdout.read().decode()

print(result)
