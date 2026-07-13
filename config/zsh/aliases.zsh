# -------
# Aliases
# -------

# kubernetes & infrastructure
alias k="kubectl"
alias kc="kubectl config"
alias kx="kubectx"
alias kn="kubens"
alias kpod="kubectl get pods | grep_pod"

grep_pod(){
  grep "$1" | awk '{print $1}'
}

grep_copy_pod(){
  grep "$1" | awk '{print $1}' | pbcopy
}

kexec(){
    # kexec <pod-pattern> [-c <container>] [cmd...]
    local pod
    pod=$(kpod "$1")
    # multiple replicas can match; let fzf pick one
    [[ $(echo "$pod" | wc -l) -gt 1 ]] && pod=$(echo "$pod" | fzf --layout=reverse)
    if [[ "$2" == "-c" ]]; then
        local container="$3"
        if [[ -z "$4" ]]; then
            kubectl exec -it "$pod" -c "$container" -- /bin/bash
        else
            kubectl exec -it "$pod" -c "$container" -- "${@:4}"
        fi
        return
    fi
    kubectl exec -it "$pod" -- /bin/bash
}

# Python and Jupyter
alias jl="jupyter lab"
alias p="python3"
alias ipy="ipython"
alias actvenv="source venv/bin/activate"
alias actenv="source env/bin/activate"

# if linux then use xdg-open
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    alias open="xdg-open"
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'
fi

# GIT AND GITHUB
alias g="git"
alias ga="git add"
alias gc="git commit"
alias gpf="git push -f"
alias gpo="git push origin"
alias gpfo="git push -f origin"
alias gs="git status"
alias gp="git push"
alias gf="git fetch"
alias gbr='git checkout $(git branch | fzf --layout=reverse) 2> /dev/null'

# fuzzy search command history (strip the ": <timestamp>:<elapsed>;" prefix, newest first)
alias hgrep='sed "s/^: [0-9]*:[0-9]*;//" ~/.zsh_history | fzf --tac'

# copy command output via pipe
alias -g P='| pbcopy'

# Django
alias d="python3 manage.py"
alias dr="python3 manage.py runserver"
alias dmm="python3 manage.py makemigrations"
alias dm="python3 manage.py migrate"
alias dmmm="python3 manage.py makemigrations && python3 manage.py migrate"
alias dt="python3 manage.py test"
alias ds="python3 manage.py shell"

#openwisp
alias o="python3 tests/manage.py"
alias or="python3 tests/manage.py runserver"
alias ommm="python3 tests/manage.py makemigrations && python3 tests/manage.py migrate"
alias pie="pip install -e ."

#javascript and node
alias n="node"
alias y="yarn"
alias ys="yarn start"

#hackerrank
alias hr="cd ~/dev/hr"

#gitlab
alias gl="cd ~/dev/gl"
alias personal="cd ~/dev/personal"

if [ -x "$(command -v eza)" ]; then
    # brew install eza
    alias ls="eza --icons"
    alias la="eza --long --icons --all --group"
fi

# nvim
alias oldvim="vim"
alias vi="nvim"
alias vim="nvim"
alias dev="cd ~/dev"

# utilities
print_submodules_in_dir () {
    for x in $(find $1 -type d) ; do
        if [ -d "${x}/.git" ] ; then
            cd "${x}"
            origin="$(git config --get remote.origin.url)"
            cd - 1>/dev/null
            echo git submodule add "${origin}" "${x}"
        fi
    done
}

alias ghtoken="gh auth token | pbcopy"
alias dive="docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -e DOCKER_API_VERSION=1.37 wagoodman/dive:latest"

# Function to manage AI prompts
prompts() {
  local prompt_dir="$HOME/dotfiles/prompts"

  if [ -z "$1" ]; then
    if ! command -v fzf &> /dev/null; then
      echo "Available prompts in $prompt_dir:"
      ls "$prompt_dir"
      return
    fi
    
    local selected_prompt=$(ls "$prompt_dir" | fzf --height 40% --layout=reverse --border --prompt="Select AI Prompt > ")
    
    if [ -n "$selected_prompt" ]; then
      cat "$prompt_dir/$selected_prompt" | pbcopy
      echo "✅ Prompt '$selected_prompt' copied to clipboard!"
    fi
    return
  fi

  local prompt_file="$prompt_dir/$1"
  
  # Check if file exists exactly as typed, or try adding .md extension
  if [ ! -f "$prompt_file" ] && [ -f "$prompt_file.md" ]; then
    prompt_file="$prompt_file.md"
  fi

  if [ -f "$prompt_file" ]; then
    cat "$prompt_file" | pbcopy
    echo "✅ Prompt '$(basename "$prompt_file")' copied to clipboard!"
  else
    echo "❌ Prompt not found: $1"
    echo "Available prompts:"
    ls "$prompt_dir"
  fi
}

alias c="claude --dangerously-skip-permissions"
