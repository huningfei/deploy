"""
    pip3 install paramiko
    管理工具：
        - saltstack
            - salt-ssh
            - agent（RPC）
        - ansible
            - ssh
        - fabric
            - 给开发提供接口
"""

# ################# 基于paramiko远程连接服务器并执行命令【用户名密码】 #################
"""
import paramiko
# 创建SSH对象
ssh = paramiko.SSHClient()
# 允许连接不在know_hosts文件中的主机
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
# 连接服务器
ssh.connect(hostname='192.168.16.175', port=22, username='root', password='123')
# 执行命令
stdin, stdout, stderr = ssh.exec_command('df')
# 获取命令结果
result = stdout.read()
# 关闭连接
ssh.close()
print(result)
"""
# ################# 基于paramiko远程连接服务器并执行命令【秘钥】 #################
"""
import paramiko
private_key = paramiko.RSAKey.from_private_key_file('本地私钥') # 前提要把公钥推送到服务器
# 创建SSH对象
ssh = paramiko.SSHClient()
# 允许连接不在know_hosts文件中的主机
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
# 连接服务器
ssh.connect(hostname='c1.salt.com', port=22, username='用户名', pkey=private_key)
# 执行命令
stdin, stdout, stderr = ssh.exec_command('df')
# 获取命令结果
result = stdout.read()
# 关闭连接
ssh.close()

"""

# ################# 基于paramiko远程连接服务器并上传下载文件【用户名密码】 #################
# """
# import paramiko
# transport = paramiko.Transport(('192.168.16.175', 22,))
# transport.connect(username='root', password='123')
# sftp = paramiko.SFTPClient.from_transport(transport)
# # 将location.py 上传至服务器 /tmp/test.py
# sftp.put(r'D:\s22\s22day25\x1.py', '/data/x1.py')
# # 将remove_path 下载到本地 local_path
# # sftp.get('/data/x1.py', r'D:\s22\s22day25\x2.py')
# transport.close()
# """
# ################# 基于paramiko远程连接服务器并上传下载文件【秘钥】 #################
"""
import paramiko
private_key = paramiko.RSAKey.from_private_key_file('/home/auto/.ssh/id_rsa')
transport = paramiko.Transport(('hostname', 22))
transport.connect(username='wupeiqi', pkey=private_key)

sftp = paramiko.SFTPClient.from_transport(transport)
# 将location.py 上传至服务器 /tmp/test.py
sftp.put('/tmp/location.py', '/tmp/test.py')
# 将remove_path 下载到本地 local_path
sftp.get('remove_path', 'local_path')
transport.close()
"""

# ################################# 基于秘钥字符串 ########################
import paramiko
from io import StringIO
key_str = """-----BEGIN OPENSSH PRIVATE KEY-----
b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAABFwAAAAdzc2gtcn
NhAAAAAwEAAQAAAQEAu9eD27Jm60xcucHDNkkN1ja72jmOPJJtSjR5qFoX4aS7QaVIm6cN
aRAYkMh4KTZHNkwbD0DH/fMAjhUlVIsIHjkoWbrBi0JiXRO/BHmZ3Whq7UrkFjsGbFa6Cy
w/zdCai8o3KeM+z3MS/TNkUE7aR66rGjiOTXLm6OFYlLxECHjz3yFqZ24Zx9O/n4myDaOs
1KY6rwblfLzaWuhw53z7Of2K+0kq2jgfsJdHKjkBsGPKbY/LD9w82ausoKrlMRPzSrU/fV
3/5HVn0wA7NPfXUZQe2ph35rWIKhQQJTvhqNCz64U6ujti1k9RQYnDS6K0jqPq3vAVOkw2
OVuOLQM9vwAAA9AM+B+bDPgfmwAAAAdzc2gtcnNhAAABAQC714PbsmbrTFy5wcM2SQ3WNr
vaOY48km1KNHmoWhfhpLtBpUibpw1pEBiQyHgpNkc2TBsPQMf98wCOFSVUiwgeOShZusGL
QmJdE78EeZndaGrtSuQWOwZsVroLLD/N0JqLyjcp4z7PcxL9M2RQTtpHrqsaOI5Ncubo4V
iUvEQIePPfIWpnbhnH07+fibINo6zUpjqvBuV8vNpa6HDnfPs5/Yr7SSraOB+wl0cqOQGw
Y8ptj8sP3DzZq6ygquUxE/NKtT99Xf/kdWfTADs099dRlB7amHfmtYgqFBAlO+Go0LPrhT
q6O2LWT1FBicNLorSOo+re8BU6TDY5W44tAz2/AAAAAwEAAQAAAQAjBxxKkqkIhbPg29YI
QHU5FfnPxt3UQ8XniYOKNkqvxCU7J5QzmmIwzlSWYxutK7b51BVTsdPZckAPPrg4XLjF0g
jJOr8utdFb4/vB3N8pX3hZCZcg4h7fgwisXrMDMTwwhyPkRsEGtEG9P6EcLKgdp9+2Qwee
P6f5k1QOYFEbdwi7ro3vtUBsR+URexLopnLtzoAmZqm8Bx1pBF75FNWYgjwKj0iSBawsOV
T89C4UFKmXjli9EII4+ubp+jeD+9oKZU2Esul2SrkSGqgIC1XWEQvjNuMKL/ilud61Z8Fc
nXomoJGk7bS0Y2nWGY+JylQur/uXqiEC/SZM8rgsg1eRAAAAgFkKDQqNLaOM0rAdHCA9he
1mUO+W3O1/7hu1IqiaC6R/hCKheXY9GTf+pomz6WoJ3nnplPtcJJ1Aw0BhOulDh9uHmAtz
5dgDXeX/WBovVpNmkjkiLYOQQS085wjekLjep2WtlcKHRSBg1xqABEdsEOSDNlPHhwUDWY
bD8Ygz5n0FAAAAgQDlqYOgXwPZuRvwwWuj6nu85S+5mCGTsGnTgL+Kq46YQJrxwNJEls1O
MQH7lfOYl4rngidi8TJdcPJUF5WP9QPc4UsnpxAIOGKAyycwN5Ttj04xGqLglsMU6DAEgI
ZZjdyUIkJ0WjPyvbZyfswHc/3DAuftR0um6Kduk/bVj/xuNwAAAIEA0WI6htk8unwZdU8b
Anmuzm9WtO/KZipnJe+CiLxX/W8n5FnA13JwfbXZA6Op//9sHNW/1esQh9aMpV+ldnQG6X
leiCho8c112eEUYm5eqcwvDhECmBtTm8Fd42W7JoYai//AVC36X9FffXgzkkEOHytUi7U5
4KXu6D0IRu0ZKLkAAAAUaHVuaW5nZmVpQHAycGV5ZS5jb20BAgMEBQYH
-----END OPENSSH PRIVATE KEY-----
"""
file_obj=StringIO(key_str)
private_key = paramiko.RSAKey()
transport = paramiko.Transport(('192.168.7.32', 22))
transport.connect(username='root', pkey=private_key)

ssh = paramiko.SSHClient()
ssh._transport = transport

stdin, stdout, stderr = ssh.exec_command('df')
result = stdout.read()

transport.close()

print(result)
