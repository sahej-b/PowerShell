# Define the path to your wallpaper image
$wallpaperPath = "https://raw.githubusercontent.com/sahej-b/PowerShell/refs/heads/main/scripts/wallpaper.ps1"

# Set the wallpaper style (0: Fill, 1: Fit, 2: Stretch, 3: Tile, 4: Center, 5: Span)
$wallpaperStyle = 2

# Update registry keys in HKCU (no admin rights required)
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\' -Name WallPaper -Value $wallpaperPath
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\' -Name WallpaperStyle -Value $wallpaperStyle
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\' -Name TileWallPaper -Value 0

# Refresh the desktop to apply the changes
Add-Type -TypeDefinition @"
    using System;
    using System.Runtime.InteropServices;
    public class Wallpaper {
        [DllImport("user32.dll", CharSet=CharSet.Auto)]
        public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
    }
"@

# Corrected call to SystemParametersInfo (note the changes)
[Wallpaper]::SystemParametersInfo(0x0014, 0, $wallpaperPath, 0x0001 | 0x0002)
