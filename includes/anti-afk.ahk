antiAFK() {
    WinGet, PID, pid, %GameTitle%
    GTAPid := pid
    Ticks := A_TickCount

    while (pid > 0 && afk = true && !GetKeyState("W")) {
        if (A_TickCount - Ticks > afk_time * 60000) {
            WinGet, PID, pid, A
            if (GTAPid != pid) {
                WinActivate, %GameTitle%
                Sleep 2000
            }
            Send {%afk_key% down}
            Sleep 10
            Send {%afk_key% up}
            Ticks := A_TickCount
        }
        WinGet, PID, pid, %GameTitle%
    }
    if (afk = true) {
        afk := !afk
        Menu, Tray, Rename, Anti-AFK: [ON], Anti-AFK: [OFF]
    }
    MsgBox, 64, %Title% %version%, Anti-AFK Disabled!, 1
    WinActivate, %GameTitle%
}
