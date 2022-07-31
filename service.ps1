$DOT_FILES_DIR="$HOME\Code\repository\.dotfiles\windows"

pip freeze > "$DOT_FILES_DIR\requirements.txt"							# python packages
scoop list > "$DOT_FILES_DIR\scoop_list.txt"							# scoop packages
winget list > "$DOT_FILES_DIR\winget.txt"							# installed apps

Copy-Item -Path "$HOME\.config\powershell.ps1" -Destination "$DOT_FILES_DIR\profile.ps1"	# powershell profile
Copy-Item -Path "$HOME\theme.omp.json" -Destination "$DOT_FILES_DIR\theme.omp.json"		# oh-my-posh theme
Copy-Item -Path "$HOME\pgp" -Destination "$DOT_FILES_DIR\pgp"                           	# pgp
Copy-Item -Path "$HOME\.gitconfig" -Destination "$DOT_FILES_DIR\.gitconfig"             	# .gitconfig