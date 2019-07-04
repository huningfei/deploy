#!/usr/bin/python3
####################
#coding:utf-8   #强制使用utf-8编码格式
import smtplib  #加载smtplib模块
from email.mime.text import MIMEText
from email.utils import formataddr
my_sender='825536458@qq.com' #发件人邮箱账号，为了后面易于维护，所以写成了变量
# my_user='huningfei@p2peye.com' #收件人邮箱账号，为了后面易于维护，所以写成了变量
class Mail:
    def __init__(self,*args):
        self.my_user=args
        # print(self.my_user)
    def mail(self):
        # msg=MIMEText('hello','plain','utf-8')
        # msg['From']=formataddr('')
        msg=MIMEText('<html><h1><a href="http://192.168.4.167:80/online/list/">你有新的任务要审核</a></h1></html>', 'html', 'utf-8')
        msg['From']=formataddr(["网贷天眼",my_sender])   #括号里的对应发件人邮箱昵称、发件人邮箱账号
        # msg['To']=formataddr(["project",','.join(self.my_user)])   #括号里的对应收件人邮箱昵称、收件人邮箱账号
        msg['To']=formataddr(["project",''.join(self.my_user)])   #括号里的对应收件人邮箱昵称、收件人邮箱账号
        msg['Subject']="你有新的任务要处理" #邮件的主题，也可以说是标题

        server=smtplib.SMTP("smtp.qq.com",25)  #发件人邮箱中的SMTP服务器，端口是25
        server.login(my_sender,"dpbuacfowzqabcef")    #括号中对应的是发件人邮箱账号、smtp的授权密码
        server.sendmail(my_sender,self.my_user,msg.as_string())   #括号中对应的是发件人邮箱账号、收件人邮箱账号、发送邮件
        server.quit()   #这句是关闭连接的意思


class Project_mail:
    """
    项目负责人角色发送邮件
    """
    def __init__(self,my_user):
        self.my_user=my_user

    def projectmail(self):
        msg = MIMEText('你的申请没有通过，请和项目负责人沟通', 'plain', 'utf-8')
        msg['From']=formataddr(["网贷天眼",my_sender])   #括号里的对应发件人邮箱昵称、发件人邮箱账号
        msg['To']=formataddr(["项目负责人",self.my_user])   #括号里的对应收件人邮箱昵称、收件人邮箱账号
        msg['Subject']="你有新的任务要处理" #邮件的主题，也可以说是标题

        server=smtplib.SMTP("smtp.qq.com",25)  #发件人邮箱中的SMTP服务器，端口是25
        server.login(my_sender,"dpbuacfowzqabcef")    #括号中对应的是发件人邮箱账号、smtp的授权密码
        server.sendmail(my_sender,[self.my_user,],msg.as_string())   #括号中对应的是发件人邮箱账号、收件人邮箱账号、发送邮件
        server.quit()   #这句是关闭连接的意思

class Test_mail:
    """
    测试角色发送邮件
    """
    def __init__(self,my_user):
        self.my_user=my_user

    def testmail(self):
        msg = MIMEText('你的申请没有通过，请和测试沟通', 'plain', 'utf-8')
        msg['From']=formataddr(["网贷天眼",my_sender])   #括号里的对应发件人邮箱昵称、发件人邮箱账号
        msg['To']=formataddr(["项目负责人",self.my_user])   #括号里的对应收件人邮箱昵称、收件人邮箱账号
        msg['Subject']="你有新的任务要处理" #邮件的主题，也可以说是标题

        server=smtplib.SMTP("smtp.qq.com",25)  #发件人邮箱中的SMTP服务器，端口是25
        server.login(my_sender,"dpbuacfowzqabcef")    #括号中对应的是发件人邮箱账号、smtp的授权密码
        server.sendmail(my_sender,[self.my_user,],msg.as_string())   #括号中对应的是发件人邮箱账号、收件人邮箱账号、发送邮件
        server.quit()   #这句是关闭连接的意思

class Op_mail:
    """
    运维角色发送邮件
    """
    def __init__(self,my_user):
        self.my_user=my_user

    def opmail(self):
        msg = MIMEText('你的申请没有通过，请和运维沟通', 'plain', 'utf-8')
        msg['From']=formataddr(["网贷天眼",my_sender])   #括号里的对应发件人邮箱昵称、发件人邮箱账号
        msg['To']=formataddr(["项目负责人",self.my_user])   #括号里的对应收件人邮箱昵称、收件人邮箱账号
        msg['Subject']="你有新的任务要处理" #邮件的主题，也可以说是标题

        server=smtplib.SMTP("smtp.qq.com",25)  #发件人邮箱中的SMTP服务器，端口是25
        server.login(my_sender,"dpbuacfowzqabcef")    #括号中对应的是发件人邮箱账号、smtp的授权密码
        server.sendmail(my_sender,[self.my_user,],msg.as_string())   #括号中对应的是发件人邮箱账号、收件人邮箱账号、发送邮件
        server.quit()   #这句是关闭连接的意思

class Pm_mail:
    """
    产品角色发送邮件
    """
    def __init__(self,my_user):
        self.my_user=my_user

    def pmmail(self):
        msg = MIMEText('你的申请没有通过，请和产品沟通', 'plain', 'utf-8')
        msg['From']=formataddr(["网贷天眼",my_sender])   #括号里的对应发件人邮箱昵称、发件人邮箱账号
        msg['To']=formataddr(["项目负责人",self.my_user])   #括号里的对应收件人邮箱昵称、收件人邮箱账号
        msg['Subject']="你有新的任务要处理" #邮件的主题，也可以说是标题

        server=smtplib.SMTP("smtp.qq.com",25)  #发件人邮箱中的SMTP服务器，端口是25
        server.login(my_sender,"dpbuacfowzqabcef")    #括号中对应的是发件人邮箱账号、smtp的授权密码
        server.sendmail(my_sender,[self.my_user,],msg.as_string())   #括号中对应的是发件人邮箱账号、收件人邮箱账号、发送邮件
        server.quit()   #这句是关闭连接的意思