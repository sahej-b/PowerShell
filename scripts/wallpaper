$wallpaperPath = "https://raw.githubusercontent.com/sahej-b/PowerShell/refs/heads/main/WIN_20230727_14_06_03_Pro%20(2).jpg"

# (0: Fill, 1: Fit, 2: Stretch, 3: Tile, 4: Center, 5: Span)
$wallpaperStyle = 2

Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\' -Name WallPaper -Value $wallpaperPath
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\' -Name WallpaperStyle -Value $wallpaperStyle
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop\' -Name TileWallPaper -Value 0

Add-Type -TypeDefinition @"
    using System;
    using System.Runtime.InteropServices;
    public class Wallpaper {
        [DllImport("user32.dll", CharSet=CharSet.Auto)]
        public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
    }
"@

[Wallpaper]::SystemParametersInfo(0x0014, 0, $wallpaperPath, 0x01 | 0x02)
