#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source
s() {
	[[ -f "$1" ]] && source "$1"
}
s /usr/share/git/completion/git-completion.bash
s /usr/share/git/completion/git-prompt.sh
unset s

# Aliases
alias ls='ls --color=auto -h'
alias cls='ls --color=always -h'
alias grep='grep --color=auto'
alias cgrep='grep --color=always'
alias diff='diff --color=auto'
alias cdiff='diff --color=always'
alias pacman='pacman --color=auto'
alias cpacman='pacman --color=always'
alias less='less -R'

alias cp='cp -i'
alias mv='mv -i'

alias lsl='ls -l'
alias lsa='ls -A'
alias lsla='ls -lA'

alias hp='mkdir -p .hyprland/ && exec Hyprland > .hyprland/hypr.log'
alias bemenu='bemenu --fn "JetBrains Mono"'
alias bemenu-run='bemenu-run --fn "JetBrains Mono"'


# Functions
loadocaml() {
	eval $(opam env)
}

cdr() {
	rm -f ~/.chooseddir
	 # The target path must be a relative path from current directory.
	ranger --choosedir ~/.chooseddir

	if [ -f ~/.chooseddir ]; then
		cd $(cat ~/.chooseddir)
		rm ~/.chooseddir
	fi
}

e() {
	pgrep neovide >/dev/null
	if [ $? -eq 0 ] && [ -S ~/.sockets/nvim ]; then
		nvim --server ~/.sockets/nvim --remote $(realpath $@)
	else
		hyprctl --batch "dispatch workspace 1; dispatch exec neovide -- --listen ~/.sockets/nvim $(realpath $@)"
	fi
}
et() {
	pgrep neovide >/dev/null
	if [ $? -eq 0 ] && [ -S ~/.sockets/nvim ]; then
		nvim --server ~/.sockets/nvim --remote-tab $(realpath $@)
	else
		hyprctl --batch "dispatch workspace 1; dispatch exec neovide -- --listen ~/.sockets/nvim $(realpath $@)"
	fi
}

# Prompt
if [[ $XDG_SESSION_TYPE = "wayland" ]]; then
	prompt_command() { export PS1="$(~/.config/scripts/prompt)"; }
	PROMPT_COMMAND=prompt_command
else
	PS1='[\u@\h \W]\$ '
	PROMPT_COMMAND=''
fi
