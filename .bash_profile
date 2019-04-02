if [[ -f "$HOME/.bashrc" ]]; then
    source "$HOME/.bashrc"
fi

if [[ -f "$HOME/.bash_prompt" ]]; then
    source "$HOME/.bash_prompt"
fi

alias ls="command ls -laGF"
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'
alias df="df -H"
alias du="du -h"

function assume-role() { eval $( $(which assume-role) $@); }

export EDITOR='vi';
export GREP_OPTIONS='--color=auto';
export LANG=en
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_GITHUB_API=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS=--require-sha

if [[ -f "$HOME/.bash_profile_private" ]]; then
    source "$HOME/.bash_profile_private"
fi
