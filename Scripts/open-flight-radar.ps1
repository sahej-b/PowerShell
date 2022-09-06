﻿<#
.SYNOPSIS
	Opens FlightRadar24
.DESCRIPTION
	This PowerShell script launches the Web browser with the FlightRadar24 website.
.EXAMPLE
	PS> ./open-flight-radar
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz | License: CC0
#>

& "$PSScriptRoot/open-default-browser.ps1" "https://www.flightradar24.com"
exit 0 # success
