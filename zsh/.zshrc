# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

alias v="nvim"
alias vi="nvim"
alias vim="nvim"
# For Godot game development
alias vg="nvim --listen 127.0.0.1:55432 ."

alias ls="eza -a --icons=always --color=always"
alias ll="eza -lah --icons=always --color=always"
alias tree="eza --tree --icons=always --color=always"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

eval "$(zoxide init --cmd cd zsh)"

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export EDITOR=nvim

source /opt/homebrew/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

ZVM_VI_HIGHLIGHT_FOREGROUND=#cdd6f4
ZVM_VI_HIGHLIGHT_BACKGROUND=#45475a

zvm_after_init_commands+="source <(fzf --zsh)"

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"

eval "$(starship init zsh)"
# pnpm
export PNPM_HOME="/Users/remyfouquette/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
