if status is-interactive
  # Commands to run in interactive sessions can go here
	eval (/opt/homebrew/bin/brew shellenv)
  starship init fish | source
  mise activate fish | source
  mise hook-env -s fish | source

  set -x GOPATH $HOME/go
  set -x PATH $PATH $GOPATH/bin
end
