antiAFK() {
  MsgBox, 64, %macroTitle% %macroVersion%, Anti-AFK Enabled!`nYou can disable it by pressing [A] on the keyboard., 5
  WinActivate, %gameTitle%
  WinGet, PID, pid, %gameTitle%
  gtaPid := pid
  ticks := A_TickCount
  isKeyPressed := false

  while (pid > 0 && afkState) {
    if GetKeyState("A") {
      isKeyPressed := true
      break
    }

    if (A_TickCount - ticks > afkTime * 60000) {
      WinGet, PID, pid, A

      if (pid != gtaPid) {
        WinActivate, %gameTitle%
        Sleep 10000
      }

      Send {Z down}
      Sleep 10
      Send {Z up}
      ticks := A_TickCount
    }

    WinGet, PID, pid, %gameTitle%
  }

  if (isKeyPressed)
    afkState := !afkState

  MsgBox, 64, %macroTitle% %macroVersion%, Anti-AFK Disabled!, 1
  WinActivate, %gameTitle%
}
