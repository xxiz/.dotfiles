# initalize modules
Import-Module PSReadLine    # auto complete engine
Import-Module Terminal-Icons # icons for the terminal
oh-my-posh init pwsh --config $env:POSH_THEMES_PATH/bubbles.mod.omp.json | Invoke-Expression  # terminal prompt customization
$env:PYTHONIOENCODING="utf-8"   # fix encoding issue (thefuck)
Invoke-Expression "$(thefuck --alias)"  # auto correct engine for invalid commands

# configure modules
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -HistoryNoDuplicates
Set-PSReadLineOption -PredictionViewStyle ListView

$env:Path += ";SomeRandomPath"

# open editors in current directory
function codeCurr {code.cmd .}
function vimCurr {vim .	}
function mpvCurr {mpv .	}
function expCurr{explorer .}

# media download helpers 
# function ddrama {bash $HOME/dra-cla -dq 1080p -p $pwd}
# function danime {ani-cli -dq 720p -p $pwd}

Set-Alias c. codeCurr
Set-Alias v. vimCurr
Set-Alias m. mpvCurr
Set-Alias e. expCurr
# Set-Alias kdrama ddrama
Set-Alias g git
Set-Alias l ls
# Set-Alias anime danime

# neofetch clone (minimal)
$cimSession = New-CimSession
$m = Get-CimInstance -ClassName Win32_OperatingSystem -Property TotalVisibleMemorySize,FreePhysicalMemory -CimSession $cimSession
$total = $m.TotalVisibleMemorySize / 1mb
$used = ($m.TotalVisibleMemorySize - $m.FreePhysicalMemory) / 1mb
$usage = [math]::floor(($used / $total * 100))
$gpu = wmic path win32_VideoController get name | grep NVIDIA
$uptime = $(switch (Get-Uptime) {
    ({ $PSItem.Days -eq 1 }) { '1d' }
    ({ $PSItem.Days -gt 1 }) { "$($PSItem.Days)d" }
    ({ $PSItem.Hours -eq 1 }) { '1hr' }
    ({ $PSItem.Hours -gt 1 }) { "$($PSItem.Hours)hr" }
    ({ $PSItem.Minutes -eq 1 }) { '1m' }
    ({ $PSItem.Minutes -gt 1 }) { "$($PSItem.Minutes)m" }
}) -join ' '
Write-Host (Get-CimInstance -ClassName Win32_Processor -Property Name -CimSession $cimSession).Name
Write-Host $gpu
Write-Host "PowerShell v$($PSVersionTable.PSVersion)"
Write-Host $uptime
Write-Host "$usage% @ " "$($used.ToString("#.##")) GiB / $($total.ToString("#.##")) GiB"
