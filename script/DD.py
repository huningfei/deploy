import traceback
def File():
    """
    上传更新的文件

    :return:

    """
    print('aaaa')
    status = False
    try:

        private_key = paramiko.RSAKey(file_obj=StringIO(request.user.server_private_key))  # 获取用户私钥
        transport = paramiko.Transport((host_object.hostname, host_object.ssh_port))  # 主机名和端口号
        transport.connect(username=request.user.server_name, pkey=private_key)  # 用户名和私钥
        # 用户远程上传下载文件
        sftp = paramiko.SFTPClient.from_transport(transport)
        # 远程执行命令
        ssh = paramiko.SSHClient()
        ssh._transport = transport
        # 创建文件储存目录
        pull_time = deploy_object.time.strftime('%Y%m%d%H%M%S')

        code_file_path = os.path.join(cwd_path, deploy_object.uid)
        print(code_file_path)
        target_folder_path = '/home/yx/file/%s/%s/' % (
            deploy_object.project.title, pull_time)  # /home/yx/file/dbhot/pull_time

        stdin, stdout, stderr = ssh.exec_command('mkdir -p %s' % target_folder_path)
        stdout.read()
        # 上传数据库里面的脚本内容到服务器

        script_file_name = deploy_object.file.title  # 更新文件的名字，
        print(script_file_name)
        # 脚本的绝对路径
        target_file_path = os.path.join(target_folder_path,
                                        script_file_name)  # /home/yx/file/dbhot/v4.0 +脚本名字
        file_object = sftp.open(target_file_path, mode='w')  # 在指定目录下打开一个文件，然后写入
        file_object.write(deploy_object.file.filename)  # 把数据库里面的脚本内容拿到，表名.字段名
    except Exception as e:
        print('ok')
    return status


status = File()

