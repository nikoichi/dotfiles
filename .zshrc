# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="crunch"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
plugins+=(zsh-nvm)
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
eval "$(rbenv init -)"

#エイリアス設定---------------------------------------------------
alias al='alias'
alias h='history'
alias ls='ls -G'
# alias man='/usr/local/bin/jman' #manコマンドで常にjmanを起動
alias v='vim'
alias vi='vim'
alias vv='vim ~/.vimrc'
alias vz='vim ~/.zshrc'
alias ctags="`brew --prefix`/bin/ctags"

#グローバルエイリアス@@@@@@@@@@@@@@@@@@@@@@
alias -g G='| grep'
alias -g P='| peco'
alias -g T='| tail'

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


#rails関連+++++++++++++++++++++++++++++++++++++++++++++
alias be='bundle exec'
alias r='bundle exec rails'
alias rake='bin/rake'
alias rspec='bin/rspec'
alias rc='bundle exec rails c'
alias rg='bundle exec rails g'
alias rs='bundle exec rails s'
alias rr='bin/rake routes'
alias rdm='bin/rake db:migrate'
alias rdms='bin/rake db:migrate:status'
alias rdr='bin/rake db:rollback'

#+++++++++++++++++++++++++++++++++++++++++++++++++++++

#Git関連~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gbd='git branch -d'
alias gbm='git branch -m'  #現在のブランチ名の変更。ブランチを指定する際は、後ろに「<古いブランチ名> <新しいブランチ名>」を記載。
alias gbmer='git branch --merged'  #マージ済のブランチ一覧表示。
alias gbmerd="git branch --merged | grep -vE '^\*|master$|release$|develop$' | xargs -I % git branch -d %"  #マージ済のブランチ一括削除。

alias gco='git checkout'
alias gcob='git checkout -b'
alias gcod='git checkout develop'
alias gcom='git checkout master'
alias gcost='git checkout staging'
alias gcosn='git checkout sandbox'

alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gcm='git commit -m'
alias gcm1='git commit -m 一旦コミット'

alias gd='git diff' #ワーキングツリー（現在の作業状態）からインデックス（add済み）の差分＝編集中でaddしていないもの
alias gdh='git diff HEAD' #ワーキングツリー（現在の作業状態）からHEAD（前回のコミット）の差分
alias gdh1='git diff HEAD^..HEAD' #HEAD（前回のコミット）からHEAD^（前々回のコミット）の差分
alias gdh2='git diff HEAD^^..HEAD^' #HEAD（前々回のコミット）からHEAD^（前々々回のコミット）の差分
alias gds='git diff --stat' #ワーキングツリー（現在の作業状態）からインデックス（add済み）の差分（＝編集中でaddしていないもの）のファイル名などのステータスのみ
alias gdhs='git diff HEAD --stat' #ワーキングツリー（現在の作業状態）からHEAD（前回のコミット）の差分のファイル名などのステータスのみ
alias gdh1s='git diff HEAD^..HEAD --stat' #HEAD（前回のコミット）からHEAD^（前々回のコミット）の差分のファイル名などのステータスのみ
alias gdh2s='git diff HEAD^^..HEAD^ --stat' #HEAD（前々回のコミット）からHEAD^（前々々回のコミット）の差分のファイル名などのステータスのみ
alias gdc='git diff --cached' #インデックス（add済み）とHEAD(前回のコミット)の差分
alias gdm='git diff master...$(git_current_branch)' #現在のブランチとブランチ分岐前の差分
alias gdms='git diff master...$(git_current_branch) --stat' #ファイル名などのステータスのみ。
alias gf='git fetch'
alias gfu='git fetch upstream'

alias gg='git grep -n'
alias gl="git log --decorate"
alias glf="git log --decorate --first-parent"
alias glfp="git log --decorate --first-parent -p"
alias glg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias glga="git log --graph --all --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias glp="git log --decorate -p"
alias gm='git merge'

alias gpl='git pull'
alias gplom='git pull origin master'
# alias gplud='git pull upstream develop'
# alias gplum='git pull upstream master'
# alias gplust='git pull upstream staging'
# alias gplusn='git pull upstream sandbox'
# alias gplrud='git pull --rebase upstream develop'
alias gps='git push'
alias gpsoc='git push origin $(git_current_branch)'
alias gpsod='git push origin develop'
alias gpsom='git push origin master'

alias gr='git reset'
alias gr1='git reset HEAD' #git add の取り消し
alias gr1='git reset HEAD^'
alias gs='git status'
alias gsh='git show'
alias gst='git stash'
alias gstp='git stash pop'

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#---------------------------------------------------------------end

#関数設定----------------------------------------------------------
#pecoを使って便利にcdする関数
function cdP {
    local dir="$( find . -maxdepth 1 -type d | sed -e 's;\./;;' | peco )"
    if [ ! -z "$dir" ] ; then
        cd "$dir"
    fi
}
#---------------------------------------------------------------end
setopt nonomatch

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#autojumpの設定------------------------------
[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

#Shell Integration(shellの統合)を常用するための記載
source ~/.iterm2_shell_integration.`basename $SHELL`
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
