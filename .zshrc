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

if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS: Use -G for color
  alias ls='ls -G'
  alias ll='ls -alFG'
else
  # Linux: Use --color=auto for color
  alias ls='ls --color=auto'
  alias ll='ls -alF --color=auto'
fi

# https://github.com/tj/n
export N_PRESERVE_NPM=1
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# https://github.com/denoland/deno
export DENO_INSTALL="/Users/cotyhamilton/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# https://kubernetes.io/docs/reference/kubectl/generated/kubectl_completion/
source <(kubectl completion zsh)
alias k=kubectl
