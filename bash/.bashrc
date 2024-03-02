#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

s() {
	[[ -f "$1" ]] && source "$1"
}
s /usr/share/git/completion/git-completion.bash
s /usr/share/git/completion/git-prompt.sh
unset s


alias ls='ls --color=auto -h'
alias cls='ls --color=always -h'
alias grep='grep --color=auto'
alias cgrep='grep --color=always'
alias diff='diff --color=auto'
alias cdiff='diff --color=always'
alias cpacman='pacman --color=always'
alias less='less -R'

alias lsl='ls -l'
alias lsa='ls -A'
alias lsla='ls -lA'

alias hp='exec Hyprland > .hyprland/hypr.log'
alias e='neovide'


loadocaml() {
	eval $(opam env)
}



if [[ $XDG_SESSION_TYPE != "wayland" ]]; then
	PS1='[\u@\h \W]\$ '
	PROMPT_COMMAND=''
else
	prompt_command() { export PS1="$(~/.config/scripts/prompt)"; }
	PROMPT_COMMAND=prompt_command
fi
