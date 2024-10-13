try {
	(New-Object -ComObject Shell.Application).NameSpace(0x0a).Items() | Select-Object Name,Size,Path
	exit 0 # success
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
