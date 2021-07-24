;
; Copyright (C) 2017 MacMailler
; GitHub: https://github.com/MacMailler/QuickMacro
;

initTrayMenu() {
  Menu, Tray, Tip, GTAO Macro: %hotkeyState%`nVIP Mode: Disabled

  Menu, Tray, NoStandard
  Menu, Tray, Add, Activate, activateLabel
  Menu, Tray, Add, Empty Session, emptySessionLabel
  Menu, Tray, Add, Crosshair: [OFF], crosshairLabel
  Menu, Tray, Add, Anti-AFK: [OFF], antiAFKLabel
  Menu, Tray, Add, Reload Config, reloadConfigLabel
  Menu, Tray, Add, Exit, exitLabel
}

refreshTrayMenu() {
  Menu, Tray, Tip, % "GTAO Macro: " hotkeyState "`nVIP Mode: " . (vipState ? "Enabled" : "Disabled")
  Menu, Tray, DeleteAll
  Menu, Tray, Add, % (hotkeyState == "ON") ? "Deactivate" : "Activate", activateLabel
  Menu, Tray, Add, Empty Session, emptySessionLabel
  Menu, Tray, Add, % "Crosshair: " . (crosshairState ? "[ON]" : "[OFF]"), crosshairLabel
  Menu, Tray, Add, % "Anti-AFK: " . (afkState ? "[ON]" : "[OFF]"), antiAFKLabel
  Menu, Tray, Add, Reload Config, reloadConfigLabel
  Menu, Tray, Add, Exit, exitLabel
}
