if status is-interactive
  # Commands to run in interactive sessions can go here
	eval (/opt/homebrew/bin/brew shellenv)
  starship init fish | source
  rtx activate fish | source
  rtx hook-env -s fish | source

  set -x GOPATH $HOME/go
  set -x PATH $PATH $GOPATH/bin
end
