# prompt
setopt prompt_subst
autoload -Uz vcs_info
autoload -Uz compinit && compinit

# run `compaudit | xargs chmod g-w` to remove compinit warnings https://github.com/zsh-users/zsh-completions/issues/433#issuecomment-619321054

zstyle ':vcs_info:git:*' formats '%F{cyan}(%b)%f'
zstyle ':vcs_info:git*' actionformats '%F{cyan}(%b|%a)%f'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu yes select

# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}

# cotyhamilton ~
# ➜
PROMPT=$'\n%n '"%B%F{242}%2~%f%b "$'$(vcs_info_wrapper)'$'\n'"%(?.%F{green}➜.%F{red}➜)%f "

# history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# aliases
alias ll='ls -lha'
alias k=kubectl
alias tf=terraform

if ls --color=auto &>/dev/null; then
	alias ls='ls -p --color=auto'
else
	alias ls='ls -p -G'
fi

# environment
export EDITOR=vim
export VISUAL="$EDITOR"

# https://github.com/tj/n
export N_PRESERVE_NPM=1
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# https://github.com/denoland/deno
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
