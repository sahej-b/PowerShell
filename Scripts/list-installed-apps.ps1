﻿<#
.SYNOPSIS
	Lists the installed apps
.DESCRIPTION
	This PowerShell script lists the installed apps (from Windows Store or snaps).
.EXAMPLE
	PS> ./list-installed-apps
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz | License: CC0
#>

try {
	if ($IsLinux) {
		& snap list
	} else {
		Get-AppxPackage | Select-Object Name,Version | Format-Table -autoSize
	}
	exit 0 # success
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
