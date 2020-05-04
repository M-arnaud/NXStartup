if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$args[0]`"" -Verb RunAs; exit }
cmd /c Pause | Out-Null
Set-Location "$args[0]"
cmd /c Pause | Out-Null
$QUELLE=$args[0]
$ZIEL=$args[1]
$STOP=$args[2]
 
$FILES = Get-ChildItem -Path $QUELLE -File -Recurse -Exclude "*.prt"

# Modul für New-Symlink
# Install-Module Pscx -Scope CurrentUser -AllowClobber

foreach($file in $FILES) 
{
    Write-Output $file
	$sourcepath = $file.DirectoryName
	$filename = $file.Name
	$targetpath = $sourcepath.Replace($QUELLE, $ZIEL)
	$sourcefile = Join-Path $sourcepath $filename
	$targetfile = Join-Path $targetpath $filename

    Write-Output $filename
    Write-Output $sourcefile
    Write-Output $targetfile
    Write-Output $targetpath

    if( -Not (Test-Path -Path $targetpath ) ) 
    {
        New-Item -ItemType directory -Path $targetpath
    }
    New-Symlink -LiteralPath $targetfile -TargetPath $sourcefile -Verbose -ErrorAction Ignore
}

Get-Process | Out-File -FilePath $STOP
