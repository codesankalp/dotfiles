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
    # after > $4 is present use it as arguments
    if [[ "$2" == "-c" ]]; then
    if [[ "$4" == "" ]]; then
        echo "kubectl exec -it $(kpod "$1") -c "$3" -- /bin/bash"
        kubectl exec -it $(kpod "$1") -c "$3" -- /bin/bash
        return
    fi
        echo "kubectl exec -it $(kpod "$1") -c "$3" -- $4 $5 $6 $7 $8 $9"
        kubectl exec -it $(kpod "$1") -c "$3" -- $4 $5 $6 $7 $8 $9
        return
    fi
    kubectl exec -it $(kpod "$1") -- /bin/bash
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

# fuzzy search command history
alias hgrep='cat ~/.zsh_history | fzf'

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

if [ -x "$(command -v colorls)" ]; then
    # sudo gem install colorls
    alias ls="colorls"
    alias la="colorls -al"
fi

if [ -x "$(command -v exa)" ]; then
    # brew install exa
    alias ls="exa"
    alias la="exa --long --all --group"
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

alias ghtoken="cat ~/.ghtoken | pbcopy"
alias dive="docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -e DOCKER_API_VERSION=1.37 wagoodman/dive:latest"

