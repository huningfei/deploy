import os
import sys

CODE_BASE_PATH = "/home/yx/codes/"  # 代码存放目录

WEB_BASE_PATH = "/home/yx/sites"   # 代码解压目录



def link(project_name, pull_time, file_name):
    """
    做软连接
    :param project_name: 项目名：eg XbLib
    :param pull_time: 代码所存放的目录，根据拉取代码的时间命名eg:20190114022956跟CODE_BASE_PATH目录拼接
    :param file_name: 代码的名字  eg：XbLib20190114022956
    :return:
    """

    web_file_path = os.path.join(CODE_BASE_PATH, project_name, pull_time, file_name)  # 代码所在的路径

    link_path = os.path.join(WEB_BASE_PATH, project_name)  # 代码所运行的目录
    if os.path.exists(link_path):
        os.remove(link_path)  # 移除原来的软连接

    os.symlink(web_file_path, link_path)  # 重新做软连接
    return link_path


def run():
    project_name = sys.argv[1]
    pull_time = sys.argv[2]
    file_name = sys.argv[3]

    link_path = link(project_name, pull_time, file_name)


if __name__ == '__main__':
    run()
