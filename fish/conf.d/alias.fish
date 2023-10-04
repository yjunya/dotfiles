# general
alias sudo="sudo "
alias ls="exa --icons"
alias ll="exa -ahl --icons --git"
alias la="exa -ahl --icons --git"
alias tree="exa --tree --icons --git-ignore"
alias rm="trash"
alias ip="ipconfig getifaddr en0"
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
alias dot="cd ~/main/dotfiles"
alias capture="cd ~/ScreenCapture/"
alias open-capture="open ~/ScreenCapture/"
alias desk="cd ~/Desktop"
alias open-desk="open ~/Desktop/"
alias down="cd ~/Downloads"
alias open-down="open ~/Downloads/"

# dena
alias pococha="cd ~/main/works/01_pococha/01_code/"
