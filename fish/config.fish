if status is-interactive
  # Commands to run in interactive sessions can go here
  set -x LANG en_US.UTF-8
  set -x LC_ALL en_US.UTF-8
	eval (/opt/homebrew/bin/brew shellenv)
  starship init fish | source
  mise activate fish | source
  mise hook-env -s fish | source
  mise complete -s fish | source

  set -x PATH $PATH $HOME/go/bin
end
