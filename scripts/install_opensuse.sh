#!/bin/bash

# パッケージリストを更新
sudo zypper -n refresh

# 必要なパッケージを更新
sudo zypper -n up

# 開発ツールをインストール
sudo zypper -n install git vim zsh tmux

# zshをデフォルトのシェルに設定
chsh -s /bin/zsh

# シンボリックリンク
sh ./link.sh


# ryeのインストール
curl -sSf https://rye-up.com/get | RYE_INSTALL_OPTION="--yes" bash

# rustupのインストール
curl https://sh.rustup.rs -sSf | sh
