#!/usr/bin/env python
# -*- coding:utf-8 -*-
"""
1. 停掉原来的服务
2. 删除软连接
3. 重新做新版本的软连接
4. 启动新的程序
"""
import os
import sys
import shutil
from subprocess import check_output, check_call, CalledProcessError
from zipfile import ZipFile

CODE_BASE_PATH = "/home/yx/codes/"
WEB_BASE_PATH = "/home/yx/server/"



def kill_origin_process(match_key):
    """
    停掉原来的服务
    :param name:
    :return:
    """

    check_command = "ps -ef |grep '%s' | grep -v grep | awk '{print $2}' " % (match_key)
    check_status = check_output(check_command, shell=True)
    if check_status:
        command = "ps -ef |grep '%s' | grep -v grep | awk '{print $2}' | xargs kill -9" % (match_key)
        check_call(command, shell=True)


def link(project_name, version, file_name):
    """
    软链接
    :return:

    """

    web_file_path = os.path.join(CODE_BASE_PATH, project_name, version, file_name.split('.')[0]) # 代码所在的路径

    link_path = os.path.join(WEB_BASE_PATH, project_name) # 代码所运行的目录
    if os.path.exists(link_path):
        os.remove(link_path)  # 移除原来的软连接

    os.symlink(web_file_path, link_path) # 重新做软连接
    return link_path






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

    # web_file_path = unpack_zipfile(project_name, version, file_name)
    kill_status = kill_origin_process('python3 manage.py runserver 0.0.0.0:8001')

    link_path = link(project_name, version, file_name)


    start_status = start_service(project_name, 'python3 manage.py runserver 0.0.0.0:8001')


if __name__ == '__main__':
    run()