;Moves the active window from one monitor to the other. Similar to JumpWin.exe, but that stopped working for me for some reason.
;Based on Thalon's code at http://www.autohotkey.com/forum/topic19440.html  [Jon Aquino 2008-09-17]
;based on JonathanAquino at https://autohotkey.com/board/topic/32874-moving-the-active-window-from-one-monitor-to-the-other/

leftMonitorWidth = 3440
leftMonitorHeight = 1440
rightMonitorWidth = 1920
rightMonitorHeight = 1080

^!q::    ;Default hotkey is Ctrl+Alt+Q
activeWindow := WinActive("A")
if activeWindow = 0
{
    return
}
WinGet, minMax, MinMax, ahk_id %activeWindow%

WinGetPos, x, y, width, height, ahk_id %activeWindow%

if (x < leftMonitorWidth-10) ;-10 cause WinGetPos returns size without border
{
	newX := leftMonitorWidth
	newWidth := rightMonitorWidth
	newHeight := rightMonitorHeight
}
else
{
	newX := 0
	newWidth := leftMonitorWidth
	newHeight := leftMonitorHeight
}

WinMove, ahk_id %activeWindow%, , %newX%, %y%, %newWidth%, %newHeight%
WinMaximize, ahk_id %activeWindow%
WinActivate ahk_id %activeWindow%   ;Needed - otherwise another window may overlap it
return
