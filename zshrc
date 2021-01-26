# Basic .zshrc

setopt prompt_subst
autoload -Uz vcs_info

zstyle ':vcs_info:git:*' formats '%F{cyan}(%b)%f'
zstyle ':vcs_info:git*' actionformats '%F{cyan}(%b|%a)%f'

# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}

PROMPT=$'\n%n '"%B%F{242}%2~%f%b "$'$(vcs_info_wrapper)'$'\n'"%(?.%F{green}➜.%F{red}➜)%f "

# -G on mac for color

alias ls='ls -G'

alias ll='ls -alF'
