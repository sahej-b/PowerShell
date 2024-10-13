param([string]$file = "")

try {
	if ($file -eq "" ) { 
        $file = Read-Host "Enter the filename" 
    }

	$Result = get-filehash $file -algorithm SHA256

	"✅ SHA256 hash is: $($Result.Hash)"
	Read-Host -Prompt "Press Enter to close"
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	Read-Host -Prompt "An error occurred. Press Enter to close"
}
