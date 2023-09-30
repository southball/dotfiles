HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000

eval "$(starship init zsh)"

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

zinit load zsh-users/zsh-autosuggestions
zinit load zsh-users/zsh-syntax-highlighting

zinit pack"binary" for fzf
zinit ice lucid \
  id-as'junegunn/fzf/shell' \
  as'null' \
  ver'0.42.0' \
  pick'shell/completion.zsh' \
  src'shell/key-bindings.zsh'
zinit load junegunn/fzf

export FZF_DEFAULT_OPTS="--height 50% --layout=reverse --border \
  --preview-window 'right:50%' \
  --bind 'ctrl-/:change-preview-window(80%|hidden|)' \
  --bind 'shift-up:preview-half-page-up,shift-down:preview-half-page-down'"

source .zshrc2
