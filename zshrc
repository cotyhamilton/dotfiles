# Basic .zshrc

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

PROMPT=$'\n%n '"%B%F{242}%2~%f%b "$'$(vcs_info_wrapper)'$'\n'"%(?.%F{green}➜.%F{red}➜)%f "

# -G is for color on mac
alias ls='ls -G'

alias ll='ls -alF'

# n package for managing node versions
# ---
# preserves version of npm while switching versions of node
# ignore and get latest npm by `n --no-preserve lts`
export N_PRESERVE_NPM=1

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
