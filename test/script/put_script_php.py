#!/usr/bin/env python
# -*- coding:utf-8 -*-
"""
1. 解压缩到指定目录

"""
import os
import sys
import shutil
from zipfile import ZipFile

CODE_BASE_PATH = "/home/yx/codes/"  # 代码存放目录

WEB_BASE_PATH = "/home/yx/sites"   # 代码解压目录



def unpack_zipfile(project_name, time, file_name):
    """
    解压文件
    例如：
        /home/yx/codes/XbLib/20190114022956/XbLib20190114104327.zip
        /home/yx/codes/XbLib/20190114022956/XbLib20190114104327

        类似于：
            unzip -d /data/codes/dbhot/v1/dbhot20181207030727 /data/codes/dbhot/v1/dbhot20181207030727.zip
    :return:
    python3 /home/yx/script/XbLib/20190114094613/XbLib20190114094613.py XbLib 20190114094613 XbLib20190114094613.zip
    """

    zip_file_path = os.path.join(CODE_BASE_PATH, project_name, time, file_name)
    web_file_path = os.path.join(CODE_BASE_PATH, project_name, time, file_name.split('.')[0]) # 解压路径
    print(web_file_path)
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

def run():
    project_name = sys.argv[1]
    time = sys.argv[2]
    file_name = sys.argv[3]

    web_file_path = unpack_zipfile(project_name, time, file_name)
    link_path = link(web_file_path, project_name)



if __name__ == '__main__':
    run()