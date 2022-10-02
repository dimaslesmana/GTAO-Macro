;
; Credits:
; https://www.reddit.com/r/gtaglitches/comments/ha4un0/i_made_a_fingerprintscanner_automatic_solver_tool/
; https://www.reddit.com/r/gtaglitches/comments/hd52z1/improved_fingerprint_solver/
;

; RUN AS ADMIN
Loop, %0% {
  param := %A_Index%
  params .= A_Space . param
}

ShellExecute := A_IsUnicode ? "shell32\ShellExecute":"shell32\ShellExecuteA"

IF NOT A_IsAdmin {
  If A_IsCompiled
    DllCall(ShellExecute, uint, 0, str, "RunAs", str, A_ScriptFullPath, str, params , str, A_WorkingDir, int, 1)
  Else
    DllCall(ShellExecute, uint, 0, str, "RunAs", str, A_AhkPath, str, """" . A_ScriptFullPath . """" . A_Space . params, str, A_WorkingDir, int, 1)
  ExitApp
}
; END RUN AS ADMIN

ListLines Off
CoordMode ToolTip, Screen
CoordMode Mouse, Screen
CoordMode Pixel, Screen
SetTitleMatchMode 2
SetControlDelay 1
SetWinDelay 0
SetKeyDelay -1
SetMouseDelay -1
SetBatchLines -1

SendMode Event

Menu, Tray, Tip, GTAO: Diamond Casino Heist Helper
gameTitle := "Grand Theft Auto V"

;-------------------------------------------------------------------;
; Set search area
global area := {}

area.x := A_ScreenWidth / 4.2
area.y := A_ScreenHeight / 4.25
area.x2 := A_ScreenWidth / 2.55
area.y2 := A_ScreenHeight / 1.29

CD := GCD(A_ScreenWidth, A_ScreenHeight)
XRatio := Round(A_ScreenWidth / CD)
YRatio := Round(A_ScreenHeight / CD)

if (XRatio / YRatio >= 4) {
  ScreenWidthCalc := Round(A_ScreenWidth / 3)

  XK1 := (ScreenWidthCalc / 6) + ScreenWidthCalc
  XK2 := (ScreenWidthCalc - (ScreenWidthCalc / 3)) + ScreenWidthCalc

  X := (ScreenWidthCalc / 2) + ScreenWidthCalc
  Z := (ScreenWidthCalc - (ScreenWidthCalc / 4)) + ScreenWidthCalc
} else {
  ScreenWidthCalc := A_ScreenWidth

  XK1 := A_ScreenWidth / 6
  XK2 := A_ScreenWidth - (A_ScreenWidth / 3)

  X := A_ScreenWidth / 2
  Z := A_ScreenWidth - (A_ScreenWidth / 4)
}

YK1 := A_ScreenHeight / 6
YK2 := A_ScreenHeight - (A_ScreenHeight / 6)

Y := A_ScreenHeight / 6

GCD(a, b) {
    while b
      b := Mod(a | 0x0, a := b)
		return a
}

isFileExist() {
	if (!FileExist(A_ScriptDir "\" A_ScreenWidth "x" A_ScreenHeight "\1.bmp")) {
		return false
	}
	return true
}

clearTooltips() {
	n := 0
	Loop 7
	{
		n := n+1
		Tooltip,,,,%n%
	}
}

if (!WinExist(gameTitle)) {
	MsgBox, 16, Error, %gameTitle% is not running!
	return
}

if (!isFileExist()) {
	ToolTip Unsupported resolution!, 0, 0
	Sleep 4000
	ToolTip Exiting script, 0, 21, 2
	Sleep 4000
	Exitapp
}

Loop
{
	if (WinActive(gameTitle)) {
		path := A_ScriptDir "\" A_ScreenWidth "x" A_ScreenHeight
		ImageSearch,,, %X%, 0, %Z%, %Y%, % "*transBlack *50 " path . "\print.bmp"

		if (ErrorLevel = 0) {
			ToolTip Hack: Fingerprint Scanner, 0, 0, 7
			fingerprint()
		} else {
			ImageSearch,,, %X%, 0, %Z%, %Y%, % "*transBlack *50 " path . "\keypad.bmp"

			if (ErrorLevel = 0) {
				ToolTip Hack: Keypad Cracker, 0, 0, 7
				keypad(XK1, YK1, XK2, YK2, ScreenWidthCalc)
			} else {
				clearTooltips()
			}
		}
	} else {
		clearTooltips()
	}
}
return

;-------------------------------------------------------------------;
; Fingerprint Scanner
fingerprint() {
	moveCursor("reset")

	Loop 16
	{
		matches += matchSingleFingerprint(A_Index)
	}

	if (matches == 0) {
		Send {Tab}
	} else if (matches < 4) {
		moveCursor({ x: 1, y: 1}, false)
	} else {
		Sleep 10
		Send {Tab}
	}
}

matchSingleFingerprint(n) {
	position := {}
	fingerprintImage := A_ScriptDir "\" A_ScreenWidth "x" A_ScreenHeight "\" n ".bmp"
	ImageSearch foundX, foundY, % area.x, % area.y, % area.x2, % area.y2, *transBlack *50 %fingerprintImage%

	if (ErrorLevel = 0) {
		position.x := (foundX - area.x) // ((area.x2 - area.x) / 2) + 1
		position.y := (foundY - area.y) // ((area.y2 - area.y) / 4) + 1
		moveCursor(position)
		return true
	}
}

moveCursor(position, click := true) {
	static currentPosition

	if (position == "reset") {
		currentPosition := { x: 1, y: 1 }
		return
	}

	x := position.x - currentPosition.x
	y := position.y - currentPosition.y

	Loop % abs(x)
	{
		if (x > 0) {
			Send {D}
		} else {
			Send {A}
		}

		Sleep 10
	}

	Loop % abs(y)
	{
		if (y > 0) {
			Send {S}
		} else {
			Send {W}
		}

		Sleep 10
	}

	if (click) {
		Send {Enter}
	}

	currentPosition := position
}

;-------------------------------------------------------------------;
; Keypad Cracker
keypad(XK1, YK1, XK2, YK2, ScreenWidthCalc) {
	n := 0
	Loop 6
	{
		n := n+1
		imagePlaceholderPath := A_ScriptDir "\" A_ScreenWidth "x" A_ScreenHeight "\key.bmp"
		ImageSearch, FoundX, FoundY, %XK1%, %YK1%, %XK2%, %YK2%, *transBlack *180 %imagePlaceholderPath%
		if (ErrorLevel = 0) {
			Tooltip, Match%n%, FoundX, FoundY, %n%
		}
	}
}
