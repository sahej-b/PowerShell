param([string]$file = "")

try {
	if ($file -eq "" ) { $file = Read-Host "Enter the filename" }

	$Result = get-filehash $file -algorithm SHA256

	"✅ SHA256 hash is: $($Result.Hash)"
	exit 0 # success
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
