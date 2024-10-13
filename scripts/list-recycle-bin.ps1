try {
    (New-Object -ComObject Shell.Application).NameSpace(0x0a).Items() | Select-Object Name,Size,Path
    Read-Host -Prompt "Press Enter to close"
} catch {
    "⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
    Read-Host -Prompt "An error occurred. Press Enter to close"
}
