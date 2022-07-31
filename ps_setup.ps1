
# Install Scoop
iwr -useb get.scoop.sh | ie 

# Prompt Powershell Installation
Start-Process https://apps.microsoft.com/store/detail/powershell/9MZ1SNWT0N5D?hl=en-ca&gl=CA

# Install package maangers & ui stuff
scoop install vim winget oh-my-posh curl
Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck
Install-Module -Name  Terminal-icons -Repository PSGallery -Force
Install-Module -Name z -Force
Install-Module -Name touch -Scope CurrentUser -Force
winget install -e --id Git.Git

# Add profile to env
echo ". $env:USERPROFILE\.config\powershell\profile.ps1" > $PROFILE.CurrentUserCurrentHost

# Create profile
mkdir "$HOME/.config/powershell/"
Copy-Item -Path "./windows/profile.ps1" -Destination "$HOME\.config\powershell\profile.ps1"

# 
