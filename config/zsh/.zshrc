# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Homebrew (early so later tools see brew paths)
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Grok CLI completions; must be on fpath before oh-my-zsh runs compinit
if [[ -d "$HOME/.grok/completions/zsh" ]]; then
  fpath=("$HOME/.grok/completions/zsh" $fpath)
fi

# Which plugins would you like to load?
# Keep a single syntax highlighter, and load it last.
plugins=(
  git
  zsh-autosuggestions
  zsh-completions
  fast-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=4'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

export GOPATH=$HOME/go

# fzf
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

export PATH="$HOME/dotfiles/scripts:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.grok/bin:$PATH"

# Google Cloud SDK; completion is lazy-loaded on first use to keep startup fast
if [[ -f '/Users/sankalp/google-cloud-sdk/path.zsh.inc' ]]; then
  . '/Users/sankalp/google-cloud-sdk/path.zsh.inc'
fi
if [[ -f '/Users/sankalp/google-cloud-sdk/completion.zsh.inc' ]]; then
  gcloud() {
    unfunction gcloud
    . '/Users/sankalp/google-cloud-sdk/completion.zsh.inc'
    gcloud "$@"
  }
fi

eval "$(mise activate zsh)"
eval "$(direnv hook zsh)"
