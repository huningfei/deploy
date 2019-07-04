#!/usr/bin/env python
# -*- coding:utf-8 -*-
"""
1. 解压缩
2. 软连接
3. 杀掉原进程
4. 启动程序
"""
import os
import sys
import shutil
from subprocess import check_output, check_call, CalledProcessError
from zipfile import ZipFile

CODE_BASE_PATH = "/data/deploy/codes/"
WEB_BASE_PATH = "/data/web_root"


def unpack_zipfile(project_name, version, file_name):
    """
    解压文件
    例如：
        /data/deploy/codes/dbhot/v1/dbhot20181207030727.zip
        /data/deploy/codes/dbhot/v1/dbhot20181207030727

        类似于：
            unzip -d /data/codes/dbhot/v1/dbhot20181207030727 /data/codes/dbhot/v1/dbhot20181207030727.zip
    :return:
    """

    zip_file_path = os.path.join(CODE_BASE_PATH, project_name, version, file_name)
    web_file_path = os.path.join(CODE_BASE_PATH, project_name, version, file_name.split('.')[0])
    tar = ZipFile(zip_file_path, 'r')
    tar.extractall(path=web_file_path)
    tar.close()
    return web_file_path


def link(web_file_path, project_name):
    """
    软链接
    :return:
    """
    if not os.path.exists(WEB_BASE_PATH):
        os.makedirs(WEB_BASE_PATH)

    link_path = os.path.join(WEB_BASE_PATH, project_name)
    if os.path.exists(link_path):
        os.remove(link_path)

    os.symlink(web_file_path, link_path)
    return link_path


def kill_origin_process(match_key):
    """
    获取指定进程PID
    :param name:
    :return:
    """

    check_command = "ps -ef |grep '%s' | grep -v grep | awk '{print $2}' " % (match_key)
    check_status = check_output(check_command, shell=True)
    if check_status:
        command = "ps -ef |grep '%s' | grep -v grep | awk '{print $2}' | xargs kill -9" % (match_key)
        check_call(command, shell=True)


def start_service(project_name, start_command):
    """
    启动服务
    :return:
    """
    command = "%s >/dev/null 2>&1 & " % (start_command,)
    web_file_path = os.path.join(WEB_BASE_PATH, project_name)
    # 启动
    check_call(command, shell=True, cwd=web_file_path)
    return True


def run():
    project_name = sys.argv[1]
    version = sys.argv[2]
    file_name = sys.argv[3]

    web_file_path = unpack_zipfile(project_name, version, file_name)

    link_path = link(web_file_path, project_name)

    kill_status = kill_origin_process('python3 manage.py runserver 0.0.0.0:8001')

    start_status = start_service(project_name, 'python3 manage.py runserver 0.0.0.0:8001')


if __name__ == '__main__':
    run()