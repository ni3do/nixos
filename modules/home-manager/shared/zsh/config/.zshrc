export TERM="xterm-256color"
export ZSH="$HOME/.config/zsh"

# Environment
export LANG=en_US.UTF-8
export VISUAL="nvim"
export EDITOR="$VISUAL"

export PATH="$PATH:$HOME/neovim/bin"

# Antigen
source "$ZSH/plugins/antigen.zsh"

antigen bundle git
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle hadenlabs/zsh-starship

antigen apply

# micromamba Activation
eval "$(micromamba shell hook --shell zsh)"

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# TODO: check this
bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down

# MAN
export MANPAGER="nvim +Man!"

# BAT
export BAT_THEME=tokyonight_night

# TODO: revisit fzf config
# FZF 
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

export FZF_COMPLETION_OPTS='--border --info=inline'
export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --highlight-line \
  --info=inline-right \
  --ansi \
  --layout=reverse \
  --border=none
  --color=bg+:#283457 \
  --color=bg:#16161e \
  --color=border:#27a1b9 \
  --color=fg:#c0caf5 \
  --color=gutter:#16161e \
  --color=header:#ff9e64 \
  --color=hl+:#2ac3de \
  --color=hl:#2ac3de \
  --color=info:#545c7e \
  --color=marker:#ff007c \
  --color=pointer:#ff007c \
  --color=prompt:#2ac3de \
  --color=query:#c0caf5:regular \
  --color=scrollbar:#27a1b9 \
  --color=separator:#ff9e64 \
  --color=spinner:#ff007c \
"

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200'  "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"                          "$@" ;;
    ssh)          fzf --preview 'dig {}'                                    "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview"                 "$@" ;;
  esac
}

source <(fzf --zsh)

## Aliases ##
alias -- ..='cd ..'
alias -- home='cd ~'
alias -- x=exit
alias -- helpskhd='cat ~/.config/skhd/skhdrc'
alias -- helpyabai='cat ~/.config/yabai/yabairc'
alias -- mm=micromamba
alias visudo="sudo -E visudo"
# Default app improvements
alias -- cat=bat
alias -- htop=btop
alias -- ls="eza --icons=always"
alias -- vi=nvim
# Git aliases
alias -- add='git add'
alias -- commit='git commit'
alias -- gaa='git add .'
alias -- gac='git add .; git commit -m '\''auto-commit'\''; git push'
alias -- gacpp='git add .; git commit -m '\''auto-commit'\''; git push; ssh disco-world '\''cd /itet-stor/siwachte/net_scratch/fingnn && git pull'\'''
alias -- gdiff='git diff HEAD'
alias -- gss='git status --short'
alias -- log='git log --color --graph --pretty=format:'\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --abbrev-commit'
alias -- pull='git pull'
alias -- push='git push'
alias -- stat='git status'
alias -- vdiff='git difftool HEAD'
