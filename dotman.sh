#!/bin/bash

logo() {
	# print dotman logo
	printf "${BOLD}${FG_SKYBLUE}%s\n" ""
	printf "%s\n" "      _       _                         "
	printf "%s\n" "     | |     | |                        "
	printf "%s\n" "   __| | ___ | |_ _ __ ___   __ _ _ __  "
	printf "%s\n" "  / _\` |/ _ \| __| \`_ ' _ \ / _' | '_ \ "
	printf "%s\n" " | (_| | (_) | |_| | | | | | (_| | | | |"
	printf "%s\n" "  \__,_|\___/ \__|_| |_| |_|\__,_|_| |_|"
	printf "${RESET}\n%s" ""
}

initial_page() {
	clear
	logo
	while :
	do
		echo -e "\n[1] Update Dotfiles"
		echo -e "[q/Q] Quit Session"
		
		# Default choice is [1]
		read -p "Select an option? [1]: " -n 1 -r USER_INPUT
		
		# See Parameter Expansion
		USER_INPUT=${USER_INPUT:-1}
		case $USER_INPUT in
			[1]* ) update_dotfiles;;
			[q/Q]* ) exit;;
			* )     printf "\n%s\n\n" "Invalid Input, Try Again";;
		esac	
	done
}

update_dotfiles() {
	/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.config/fish/config.fish
	
	/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.config/starship.toml
	
	/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.config/awesome/rc.lua

	/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.config/nvim/init.vim
	/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.config/nvim/colors/onehalfdark.vim

	/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.config/vifm/vifmrc
	/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.config/vifm/colors/Default.vifm

	/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.config/htop/htoprc
	
	/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.config/termite/config
	
	/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/dotman.sh



  /usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME commit -m "Update dotfiles"
}

initial_page
