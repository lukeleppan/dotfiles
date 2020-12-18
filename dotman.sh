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
}

update_dotfiles() {
	echo -e "\n\nPulling from Origin"
	/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME pull > /dev/null 2>&1	

	echo -e "\nAdding fish dotfile"
	/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.config/fish/config.fish > /dev/null 2>&1
	echo -e "Adding starship dotfile"
	/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.config/starship.toml > /dev/null 2>&1

	echo -e "Adding awesome dotfile"
	/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.config/awesome/rc.lua > /dev/null 2>&1

	echo -e "Adding nvim dotfile"
	/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.config/nvim/init.vim > /dev/null 2>&1
	echo -e "Adding onehalfdark dotfile"
	/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.config/nvim/colors/onehalfdark.vim > /dev/null 2>&1

	echo -e "Adding vifm dotfile"
	/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.config/vifm/vifmrc > /dev/null 2>&1
	echo -e "Adding vifm color dotfile"
	/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.config/vifm/colors/Default.vifm > /dev/null 2>&1

	echo -e "Adding htop dotfile"
	/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.config/htop/htoprc > /dev/null 2>&1

	echo -e "Adding termite dotfile"
	/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.config/termite/config > /dev/null 2>&1
	
	echo -e "Adding README.md"
	/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/README.md > /dev/null 2>&1

	echo -e "Adding dotman.sh"
	/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/dotman.sh > /dev/null 2>&1


	echo -e "\nCommitting...\n"
  /usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME commit -m "Update dotfiles" > /dev/null 2>&1

	echo -e "Pushing...\n"
	/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME push origin master > /dev/null 2>&1 
}

initial_page
