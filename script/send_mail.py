#!/usr/bin/env python
# coding:utf-8
'''
Created on 2019年5月27日
@author: 宋家斌
此脚本主要用于发送邮件，可以携带附件使用方法如下：
python mail.py 收件人邮箱  邮件标题 邮件内容 邮件附件
没有附件可以不写：
无附件示例：
python mail.py songjiabin@p2peye.com 周报 2019年05月27日第一周周报

有附件示例：
python mail.py songjiabin@p2peye.com 周报 2019年05月27日第一周周报  D:\songjiabin_zhoubao.zip
'''

import smtplib, time, sys, os
from email.mime.text import MIMEText  # 引入smtplib和MIMEText
from email.mime.multipart import MIMEMultipart

time_info = time.strftime('%Y-%m-%d', time.localtime(time.time()))


def sm(receiver, title, body, filepath):  # 定义sm函数，并定义三个傎，此三个值分别是receiver：收件人地址， title：邮件抬头。 body：邮件内容。
    host = 'smtp.exmail.qq.com'  # 发送邮箱SMTP服务器。
    port = 25  # 端口号
    sender = 'yunwei@p2peye.com'  # 发送邮箱地址。
    pwd = 'sRdFuoIJi9JpDX67'  # 发送邮箱密码。
    filename = os.path.split(filepath)[1]

    msg = MIMEMultipart()
    # 构造附件1，传送当前目录下的 附件文件
    if filepath != 'none':
        file = MIMEText(open(filepath, 'rb').read(), 'base64', 'utf-8')
        file["Content-Type"] = 'application/octet-stream'
        # 这里的filename可以任意写，写什么名字，邮件中显示什么名字
        file["Content-Disposition"] = 'attachment; filename=%s' % filename
        msg.attach(file)  # 将邮件附件添加到信息函数里。
    else:
        pass

    content = MIMEText(body, 'html', 'utf-8')  # body:文件内容，html:文件格式，utf-8:指定文字编码。
    msg.attach(content)  # 将邮件内容添加到信息函数里。
    msg['subject'] = title
    msg['from'] = sender
    msg['to'] = receiver

    s = smtplib.SMTP(host, port)  # 连接邮箱。
    s.login(sender, pwd)  # 登录账号密码
    s.sendmail(sender, receiver, msg.as_string())  # 发送邮件。

    print('The mail named %s to %s is sended successly.date:%s' % (title, receiver, time_info))


if __name__ == '__main__':
    reciver = sys.argv[1]  # 收件人
    title = sys.argv[2]  # 邮件抬头
    body = sys.argv[3]  # 邮件内容
    try:
        filepath = sys.argv[4]  # 附件路径
    except (IndexError):
        filepath = 'none'
    sm(reciver, title, body, filepath)



