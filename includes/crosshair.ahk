;
; Copyright (C) 2017 MacMailler
; GitHub: https://github.com/MacMailler/QuickMacro
;

Global crosshairState := false
Global crosshairWidth := 21
Global crosshairHeight := 21

Global backgroundColor := 0xff00cc

SysGet, screenW, 0
SysGet, screenH, 1

Global crosshairX := (screenW / 2) - (crosshairHeight / 2)
Global crosshairY := (screenH / 2) - (crosshairHeight / 2)

IfNotExist, %A_WorkingDir%\assets
  FileCreateDir, %A_WorkingDir%\assets

FileInstall, assets\crosshair.png, %A_WorkingDir%\assets\crosshair.png, false

Gui, Crosshair: New, +AlwaysOnTop -Border -Caption
Gui, Color, backgroundColor
Gui, Add, Picture, x0 y0 w%crosshairWidth% h%crosshairHeight%, %A_WorkingDir%\assets\crosshair.png
Gui, Show, w%crosshairWidth% h%crosshairHeight% x%crosshairX% y%crosshairY%, Crosshair
WinSet, TransColor, backgroundColor, Crosshair
Gui, Crosshair: Hide
