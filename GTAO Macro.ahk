;
; Copyright (C) 2017 MacMailler
; GitHub: https://github.com/MacMailler/QuickMacro
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

SetWorkingDir %A_ScriptDir%
DetectHiddenWindows, On
ListLines Off
CoordMode ToolTip, Screen
CoordMode Mouse, Screen
CoordMode Pixel, Screen
SetBatchLines -1
SetControlDelay 1
SetWinDelay 0
SetMouseDelay -1
SendMode Event

#NoEnv
#InstallKeybdHook
#SingleInstance force
#WinActivateForce

#Include %A_ScriptDir%\includes\variables.ahk
#Include %A_ScriptDir%\includes\keys.ahk
#Include %A_ScriptDir%\includes\configuration.ahk
#Include %A_ScriptDir%\includes\tray.ahk
#include %A_ScriptDir%\includes\process_suspend.ahk

loadConfig()
initTrayMenu()

MsgBox, 64, %macroTitle% v%macroVersion%, Welcome!, 1

End::
  if WinActive(gameTitle)
    main()
return

#include %A_ScriptDir%\features\features.ahk
#Include %A_ScriptDir%\includes\labels.ahk
#Include %A_ScriptDir%\includes\functions.ahk