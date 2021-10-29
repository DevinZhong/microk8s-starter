#!/bin/bash

# 设置 hosts
sudo tee -a /etc/hosts <<-'EOF'

# cloudflare 地址
104.19.28.207 winter-glitter.devinzhong.workers.dev
104.19.28.207 floral-dream.devinzhong.workers.dev

# 应对 github dns污染
140.82.114.4 github.com
EOF

/bin/bash -c "$(curl -fsSL https://winter-glitter.devinzhong.workers.dev/Homebrew/install/HEAD/install.sh)"

# 替换源
# brew 程序本身
git -C "$(brew --repo)" remote set-url origin https://mirrors.cloud.tencent.com/homebrew/brew.git

# 以下针对 mac OS 系统上的 Homebrew
git -C "$(brew --repo homebrew/core)" remote set-url origin https://mirrors.cloud.tencent.com/homebrew/homebrew-core.git
git -C "$(brew --repo homebrew/cask)" remote set-url origin https://mirrors.cloud.tencent.com/homebrew/homebrew-cask.git
git -C "$(brew --repo homebrew/cask-fonts)" remote set-url origin https://mirrors.cloud.tencent.com/homebrew/homebrew-cask-fonts.git
git -C "$(brew --repo homebrew/cask-drivers)" remote set-url origin https://mirrors.cloud.tencent.com/homebrew/homebrew-cask-drivers.git

echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.cloud.tencent.com/homebrew-bottles' >> ~/.bash_profile
source ~/.bash_profile

# 改回官方源
# # brew 程序本身
# git -C "$(brew --repo)" remote set-url origin https://github.com/Homebrew/brew.git

# # 以下针对 mac OS 系统上的 Homebrew
# git -C "$(brew --repo homebrew/core)" remote set-url origin https://github.com/Homebrew/homebrew-core.git
# git -C "$(brew --repo homebrew/cask)" remote set-url origin https://github.com/Homebrew/homebrew-cask.git
# git -C "$(brew --repo homebrew/cask-fonts)" remote set-url origin https://github.com/Homebrew/homebrew-cask-fonts.git
# git -C "$(brew --repo homebrew/cask-drivers)" remote set-url origin https://github.com/Homebrew/homebrew-cask-drivers.git

# # 更换后测试工作是否正常
# brew update
