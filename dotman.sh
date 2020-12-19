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
	echo -e "\n\nPulling from Origin..."
	/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME pull > /dev/null 2>&1	


	echo -e "\nAdding fish dotfiles"
	/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.config/fish/* > /dev/null 2>&1
	echo -e "Adding starship dotfiles"
	/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.config/starship.toml > /dev/null 2>&1

	echo -e "Adding awesome dotfiles"
	/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.config/awesome/* > /dev/null 2>&1
	
	echo -e "Adding ranger dotfiles"
	/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.config/ranger/* > /dev/null 2>&1

	echo -e "Adding nvim dotfiles"
	/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.config/nvim/* > /dev/null 2>&1

	echo -e "Adding vifm dotfile"
	/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.config/vifm/* > /dev/null 2>&1

	echo -e "Adding htop dotfile"
	/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.config/htop/* > /dev/null 2>&1

	echo -e "Adding termite dotfile"
	/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.config/termite/* > /dev/null 2>&1
	
	echo -e "Adding README.md"
	/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/README.md > /dev/null 2>&1

	echo -e "Adding dotman.sh"
	/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/dotman.sh > /dev/null 2>&1

	echo -e "Adding figlet font"
	/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.config/figlet/* > /dev/null 2>&1
	
	echo -e "Adding rofi dotfiles"
	/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add ~/.config/rofi/* > /dev/null 2>&1


	echo -e "\nCommitting...\n"
  /usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME commit -m "Update dotfiles" > /dev/null 2>&1

	echo -e "Pushing...\n"
	/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME push origin master > /dev/null 2>&1 
}

initial_page
