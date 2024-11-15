# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/remy/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


alias v="nvim"
alias vi="nvim"
alias vim="nvim"

alias ls="eza -a --icons=always --color=always"
alias ll="eza -lah --icons=always --color=always"
alias tree="eza --tree --icons=always --color=always"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."


eval "$(zoxide init --cmd cd zsh)"

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

source <(fzf --zsh)
eval "$(starship init zsh)"
