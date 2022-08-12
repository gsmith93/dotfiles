# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

# add clangd to path
PATH="$HOME/.local/share/nvim/lsp_servers/clangd/clangd/bin:$PATH"
PATH="$HOME/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin:$PATH"

export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

alias vim="nvim"
alias vi="nvim"

# git for .dotfiles
alias config="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
