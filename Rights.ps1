if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }
	
Update-Help -UICulture En-US -Force
Set-ExecutionPolicy –Scope CurrentUser –ExecutionPolicy RemoteSigned –Force
Install-Module Pscx -Scope CurrentUser -AllowClobber
