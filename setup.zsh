#!/bin/zsh

setup_config() {
	echo $2
	if [[ -e "$2" ]]; then
		if read -q "choice?$2, would you like to replace it? [y/Y]"; then
			rm "$2"
			mkdir -p $(dirname "$2") && ln -s "$1" "$2"
		fi
		echo
	else
		rm "$2" # rm in case of broken symlinks
		mkdir -p $(dirname "$2") && ln -s "$1" "$2"
	fi
}

setup_config "$PWD/zsh/zshrc" "$HOME/.zshrc"
setup_config "$PWD/i3/i3.conf" "$HOME/.config/i3/config"
setup_config "$PWD/i3/i3status.conf" "$HOME/.config/i3status/config"
