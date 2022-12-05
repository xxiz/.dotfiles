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
