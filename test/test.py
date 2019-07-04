import os
import sys
import shutil
from subprocess import check_output, check_call, CalledProcessError
from zipfile import ZipFile

CODE_BASE_PATH = r"C:\Users\Administrator\Desktop\deploy\codes"
WEB_BASE_PATH = r"C:\Users\Administrator\Desktop\deploy\codes"


def unpack_zipfile(proect_name, version, file_name):
    """

    :param proect_name:
    :param version:
    :param file_name:
    :return:
    """
    zip_file_path = os.path.join(CODE_BASE_PATH, proect_name, version, file_name)
    print(zip_file_path)
    web_file_path = os.path.join(CODE_BASE_PATH, proect_name, version, file_name.split('.')[0])
    print(web_file_path)
    shutil.unpack_archive(zip_file_path, extract_dir=web_file_path, format='zip')


def run():
    project_name = sys.argv[1]
    version = sys.argv[2]
    file_name = sys.argv[3]
    unpack_zipfile(project_name, version, file_name)


if __name__ == '__main__':
    run()