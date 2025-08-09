set -o vi
alias trs='tmux rename-session'
export VISUAL=nvim
export EDITOR="$VISUAL"
export GIT_EDITOR="$VISUAL"
export ZK_NOTEBOOK_DIR=~./pdrive_notes
alias trs='tmux rename-session'
eval "$(starship init bash)"
export PATH=$PATH:/usr/local/go/bin:/home/kyle/go/bin
