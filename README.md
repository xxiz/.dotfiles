# .dotfiles
These configuration files let me rice, and customize my operating system to my prefrences. It also includes packages, and configurations for other tools which I use on a daily basis.

## Overview
- **OS** - [Windows 11](https://www.microsoft.com/en-ca/software-download/windows11) & [Arch](https://archlinux.org/)
- **Desktop Environment** - [KDE Plasma](https://kde.org/plasma-desktop/)
- **Text Editor** - [Visual Studio Code](https://code.visualstudio.com/) & [vim](https://www.vim.org/)
- **Terminal** - [Terminal](https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701) & [Alacritty](https://github.com/alacritty/alacritty)
- **Shells**
  - [bash](https://www.gnu.org/software/bash/)
  - [pwsh](https://github.com/PowerShell/PowerShell)
- **Shell Prompt** - [Oh My Posh](https://ohmyposh.dev/)
- **Package Managers**
  - [pacman](https://wiki.archlinux.org/title/pacman) (Arch Repos)
  - [yay](https://github.com/Jguer/yay) (AUR)
  - [scoop](https://scoop.sh/) (Windows)
- **File Managers**
  - [Dolphin](https://apps.kde.org/dolphin/)
  - [File Explorer](https://en.wikipedia.org/wiki/File_Explorer)

## Installation (Windows)
## Prerequisites
- [pwsh](https://apps.microsoft.com/store/detail/powershell/9MZ1SNWT0N5D)
- [Terminal](https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701)

## Installation
Run the installation script through pwsh by
```pwsh
irm "raw.githubusercontent.com/xxiz/.dotfiles/main/setup.ps1" | iex
```
> Note: If this is your first time running a remote script you have to update your execution policy by running<br>
> `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser`
