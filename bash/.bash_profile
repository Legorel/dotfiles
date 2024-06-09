#
# ~/.bash_profile
#

p() {
	export PATH="$PATH:$1"
}
p ~/.bin
p ~/opt/android-sdk/cmdline-tools/latest/bin
p ~/opt/android-sdk/build-tools/34.0.0
p ~/opt/logseq
p ~/opt/godot
unset p

export EDITOR='nvim'

[[ -f ~/.bashrc ]] && . ~/.bashrc

# hp is an alias to Hyprland and writes to a log file.
[[ "$(fgconsole)" -eq 1 ]] && hp
