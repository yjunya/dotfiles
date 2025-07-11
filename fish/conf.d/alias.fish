# general
alias sudo="sudo "
alias ls="eza --icons"
alias ll="eza -ahl --icons --git"
alias la="eza -ahl --icons --git"
alias tree="eza --tree --icons --git-ignore"
alias rm="trash"
alias ip="ipconfig getifaddr en0"
alias tk="task"

function mkcd
	mkdir $argv
	cd $argv
end

function loop
  while true
    eval $argv
  end
end


alias parselog="pbpaste | sed 's/\\t/\n    /g' | sed 's/\\n/\n/g'"

# vim
alias v="nvim"
alias vi="nvim"
alias vim="nvim"

# local
alias gp="pwd | pbcopy"
alias pp="cd (pbpaste)"
alias dd="clear"
alias c="cursor ."
alias bk="cd .."
alias main="cd ~/main"
alias dot="cd ~/main/dotfiles"
alias capture="cd ~/ScreenCapture/"
alias open-capture="open ~/ScreenCapture/"
alias desk="cd ~/Desktop"
alias open-desk="open ~/Desktop/"
alias down="cd ~/Downloads"
alias open-down="open ~/Downloads/"
alias s="set -x"
alias touch-taskfile='echo -e "version: \'3\'\\ntasks:\\n  run:\\n    cmds:\\n      - echo \\"Hello, World!\\"" > Taskfile.yml'
