
#PATH
source "$HOME/.rye/env"
source "$HOME/.cargo/env"


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#################################  HISTORY  #################################
# history
HISTFILE=$HOME/.zsh-history # 履歴を保存するファイル
HISTSIZE=100000             # メモリ上に保存する履歴のサイズ
SAVEHIST=1000000            # 上述のファイルに保存する履歴のサイズ

# share .zshhistory
setopt inc_append_history   # 実行時に履歴をファイルにに追加していく
setopt share_history        # 履歴を他のシェルとリアルタイム共有する

#################################  COMPLEMENT  #################################
# enable completion
autoload -Uz compinit && compinit

# 補完候補をそのまま探す -> 小文字を大文字に変えて探す -> 大文字を小文字に変えて探す
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'

### 補完方法毎にグループ化する。
zstyle ':completion:*' format '%B%F{blue}%d%f%b'
zstyle ':completion:*' group-name ''


### 補完侯補をメニューから選択する。
### select=2: 補完候補を一覧から選択する。補完候補が2つ以上なければすぐに補完する。
zstyle ':completion:*:default' menu select=2
#################################  OTHERS  #################################
# automatically change directory when dir name is typed
setopt auto_cd

# disable ctrl+s, ctrl+q
setopt no_flow_control

#zsh-init
source <(curl -sL init.zshell.dev); zzinit

zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light paulirish/git-open

zinit ice as"program" from"gh-r" mv"bat* -> bat" pick"bat/bat"
zinit light sharkdp/bat

# 以下はただのエイリアス設定
if builtin command -v bat > /dev/null; then
  alias cat="bat"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
