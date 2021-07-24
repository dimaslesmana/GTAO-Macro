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

#NoEnv
#InstallKeybdHook
#SingleInstance force

#Include %A_ScriptDir%\includes\variables.ahk

MsgBox, 64, %macroTitle% v%macroVersion%, Welcome!, 1

#Include %A_ScriptDir%\includes\keys.ahk
#Include %A_ScriptDir%\includes\configuration.ahk
#Include %A_ScriptDir%\includes\tray.ahk
#Include %A_ScriptDir%\includes\crosshair.ahk
#Include %A_ScriptDir%\includes\anti_afk.ahk
#include %A_ScriptDir%\includes\process_suspend.ahk
#Include %A_ScriptDir%\includes\empty_session.ahk

loadConfig()
initTrayMenu()

End::
  if WinActive(gameTitle)
    main()
return

#Include %A_ScriptDir%\includes\labels.ahk
#Include %A_ScriptDir%\includes\functions.ahk