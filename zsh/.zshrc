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

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

eval "$(starship init zsh)"

source <(fzf --zsh)

export EDITOR=nvim

# pnpm
export PNPM_HOME="/home/remy/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

