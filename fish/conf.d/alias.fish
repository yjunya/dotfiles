# general
alias sudo="sudo "
alias ls="exa --icons"
alias ll="exa -ahl --icons --git"
alias la="exa -ahl --icons --git"
alias tree="exa --tree --icons --git-ignore"
alias rm="trash"
function mkcd
	mkdir $argv
	cd $argv
end

# vim
alias v="nvim"
alias vi="nvim"
alias vim="nvim"

# local
alias gp="pwd | pbcopy"
alias pp="cd (pbpaste)"
alias c="clear"
alias bk="cd .."
alias main="cd ~/main"
alias dotfiles="cd ~/main/dotfiles"
alias desk="cd ~/Desktop"
alias down="cd ~/Downloads"
