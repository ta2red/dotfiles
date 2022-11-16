# Vim like
bindkey -v

# 自動保管
autoload -U compinit; compinit

# set auto cd
setopt auto_cd

# cd　履歴保存
setopt auto_pushd

# pushd　から使ったディレクトリを削除
setopt pushd_ignore_dups

# 拡張glob有効
setopt extended_glob

# history から使ったコマンドを削除
setopt hist_ignore_all_dups

# spaceで履歴に載せない
setopt hist_ignore_space

# path補完
zstyle ':completion:*:default' menu select=1

# /によって削除が止まる Ctrl + W
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
 
# alias
alias ...='cd ../..'
alias ....='cd ../../..'
