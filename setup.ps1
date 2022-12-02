$admin = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if (-not $admin.IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Please run this script as administrator"
    Exit
}
Set-Location $env:USERPROFILE\Downloads

Write-Host "installing scoop.sh"
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # enable installation of scripts from the internet
Invoke-RestMethod get.scoop.sh | Invoke-Expression

Write-Host "installing git"
scoop install git

Write-Host "cloning repository"
git clone https://github.com/xxiz/.dotfiles
Set-Location .dotfiles
Copy-Item .gitconfig ~

Write-Host "installing scoop apps"
$apps = Get-Content windows\scoop_apps
foreach ($app in $apps) {
    Write-Host "installing $app"
    scoop install $app
}

Write-Host "installing powershell modules"
$modules = Get-Content windows\ps_modules
foreach ($module in $modules) {
    Write-Host "installing $module"
    Install-Module $module -Scope CurrentUser
}

Write-Host "installing pwsh profile"
New-Item "$env:USERPROFILE\Documents\WindowsPowerShell"
Copy-Item windows\Microsoft.PowerShell_profile.ps1 $env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1

Write-Host "installing user profile"
New-Item ".config\powershell\"
Copy-Item windows\profile.ps1 $env:USERPROFILE\.config\powershell\profile.ps1

Write-Host "installing python"
scoop install python

Write-Host "installing python packages"
python -m pip install --user -r windows\pip_packages

Write-Host "installing vim config"
Invoke-WebRequest -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | New-Item $HOME/vimfiles/autoload/plug.vim -Force
Copy-Item .vimrc $HOME\.vimrc
vim +PlugInstall +qall

Write-Host "installing custom scripts"
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";$env:APPDATA\scripts", "Machine")
Copy-Item windows\scripts\* $env:APPDATA\scripts\