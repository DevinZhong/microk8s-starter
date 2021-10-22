#!/bin/bash

# 创建本地目录
mkdir -p $HOME/games/Terraria/Worlds
# 运行容器
sudo docker run -it -p 7777:7777 --rm -v $HOME/games/Terraria/Worlds:/root/.local/share/Terraria/Worlds --name="tshock" ryshe/terraria:latest

# detach 容器
# Ctrl+P then Ctrl+Q