#!/bin/bash

# 编辑 /etc/ssh/sshd_config，允许密码登录：
# PasswordAuthentication yes
# 重启 sshd 服务：
# service sshd restart

# 本地执行
ssh-copy-id -i ~/.ssh/id_rsa.pub way2hacker.com
