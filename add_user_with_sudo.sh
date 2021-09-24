#!/bin/bash
sudo useradd -d /home/devin -s /bin/bash -m devin
sudo passwd devin
sudo usermod -aG sudo devin
