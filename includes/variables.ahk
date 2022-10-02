;
; Copyright (C) 2017 MacMailler
; GitHub: https://github.com/MacMailler/QuickMacro
;

; Main
Global macroTitle := "GTAO Macro"
Global macroVersion := "2.0"
Global gameTitle := "Grand Theft Auto V"
Global hotkeyState := "OFF"

; Delay
Global menuDelay := 24
Global keyMDelay := 36
Global keyMDuration := 36

; Anti-AFK
Global afkState := false
Global afkTime := 10 ; in minutes

; Diamond Casino Heist
Global diamondCasinoHeistMode := false

; Interaction Menu search area
Global interactionMenuArea := {}
interactionMenuArea.x := A_ScreenWidth / 64.05
interactionMenuArea.y := A_ScreenHeight / 9.4
interactionMenuArea.x2 := A_ScreenWidth / 4.15
interactionMenuArea.y2 := A_ScreenHeight / 2.5
