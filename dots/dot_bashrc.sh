
# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
    color_prompt=
  fi
fi

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm* | rxvt*)
  PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
  ;;
*) ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'

fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

####EXPORTS
eval "$(zoxide init bash)"
#eval "$(pyenv virtualenv-init -)"
#eval "$(pyenv init -)"
#export PATH="/home/luid/.local/bin:$PATH"
#command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Created by `pipx` on 2025-06-26 14:04:53
export PATH="$PATH:/home/luid/.local/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
alias n='nvim'
#eval "$(/usr/bin/rbenv init - bash)"
#export PATH="./bin:/home/luid/.nvm/versions/node/v22.17.0/bin:/home/luid/.pyenv/shims:/home/luid/.pyenv/bin:/home/luid/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin:/home/luid/.local/bin:/home/luid/.local/bin"
#set +h
alias r='./bin/rails'
alias g='git'
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gcad='git commit -a --amend'
#alias ls='eza -lh --group-directories-first --icons'
alias ls='eza --group-directories-first --icons'
alias lt='eza --tree --level=1 --icons --git'
#alias ff="fzf --preview 'batcat --style=numbers --color=always {}'"
alias bat='batcat'
export PATH="/home/luid/.nodenv/versions/20.11.1/bin:$PATH"
export EDITOR=nvim

#branch_name() {
#  #local BRANCH_ERROR_NAME="$(time)_branch_name.txt"
#  #git branch --show-current 2>
#  if [ $? -ne 0 ]; then
#    CURRENT_BRANCH="/"
#  else
#    CURRENT_BRANCH=$(git branch --show-current)
#  fi
#}

#PS1+="${YELLOW}($(git branch --show-current 2>/dev/null))${RESET} $ "

YELLOW='\[\033[1;33m\]'
RESET='\[\033[0m\]'

git_branch_name() {
  local YELLOW='\[\033[1;33m\]'
  local BLUE='\[\033[0;34m\]'
  local RESET='\[\033[0m\]'

  local prompt_path="${BLUE}\u@\h:\w${RESET}"
  local git_info=""
  local branch_name=$(git branch --show-current 2>/dev/null)

  if [ -n "$branch_name" ]; then
    git_info="${YELLOW}($branch_name)${RESET}"
  else
    git_info="${YELLOW}()${RESET}"
  fi

  PS1="${prompt_path} ${git_info} \$ "

}
git_branch_name

httpcats() {
  google-chrome "https://http.cat/$1"
}

PROMPT_COMMAND=git_branch_name

#rvm export
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"


### para reverter tudo
#gsettings set org.gnome.desktop.input-sources xkb-options "[]"
### swap caps lock to esc
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"
## ver as configs
#gsettings get org.gnome.desktop.input-sources xkb-options
