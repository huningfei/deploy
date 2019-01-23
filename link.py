#!/usr/bin/python
# -*- coding: UTF-8 -*-

import os

src = '/home/yx/code'
dst = '/home/yx/servie'

# 创建软链接
os.symlink(src, dst)

print("软链接创建成功")
