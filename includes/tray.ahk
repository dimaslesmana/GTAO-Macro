;
; Copyright (C) 2017 MacMailler
; GitHub: https://github.com/MacMailler/QuickMacro
;

initTrayMenu() {
  Menu, Tray, Tip, % "GTAO Macro: " hotkeyState

  Menu, Tray, NoStandard
  Menu, Tray, Add, % (hotkeyState == "ON") ? "Deactivate" : "Activate", activateLabel
  Menu, Tray, Add, Empty Session, emptySessionLabel
  Menu, Tray, Add, % "Anti-AFK: " . (afkState ? "[ON]" : "[OFF]"), antiAFKLabel
  Menu, Tray, Add, % "Diamond Casino Heist Mode: " . (diamondCasinoHeistMode ? "[ON]" : "[OFF]"), diamondCasinoHeistLabel
  Menu, Tray, Add, Reload Config, reloadConfigLabel
  Menu, Tray, Add, Exit, exitLabel
}

refreshTrayMenu() {
  Menu, Tray, Tip, % "GTAO Macro: " hotkeyState
  Menu, Tray, DeleteAll
  Menu, Tray, Add, % (hotkeyState == "ON") ? "Deactivate" : "Activate", activateLabel
  Menu, Tray, Add, Empty Session, emptySessionLabel
  Menu, Tray, Add, % "Anti-AFK: " . (afkState ? "[ON]" : "[OFF]"), antiAFKLabel
  Menu, Tray, Add, % "Diamond Casino Heist Mode: " . (diamondCasinoHeistMode ? "[ON]" : "[OFF]"), diamondCasinoHeistLabel
  Menu, Tray, Add, Reload Config, reloadConfigLabel
  Menu, Tray, Add, Exit, exitLabel
}
