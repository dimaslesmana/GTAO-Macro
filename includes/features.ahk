;-------------------------------------------------------------------;
; Armor
getArmor(name) {
  switch name
  {
    case "SuperLightArmor":
			openArmorMenu()
			Send {Enter}
			closeInteractionMenu()
			return
		case "LightArmor":
			openArmorMenu()
			Send {Down 1}{Enter}
			closeInteractionMenu()
			return
		case "StandardArmor":
			openArmorMenu()
			Send {Down 2}{Enter}
			closeInteractionMenu()
			return
		case "HeavyArmor":
			openArmorMenu()
			Send {Down 3}{Enter}
			closeInteractionMenu()
			return
		case "SuperHeavyArmor":
			openArmorMenu()
			Send {Down 4}{Enter}
			closeInteractionMenu()
			return
  }
}

;-------------------------------------------------------------------;
; Snacks
getSnack(name) {
  switch name
	{
		case "EatEgoChaser":
			openSnacksMenu()
			Send {Down 1}{Enter}
			closeInteractionMenu()
			return
		case "EatMeteorite":
			openSnacksMenu()
			Send {Down 2}{Enter}
			closeInteractionMenu()
			return
		case "EateCola":
			openSnacksMenu()
			Send {Down 3}{Enter}
			closeInteractionMenu()
			return
		case "EatPsQs":
			openSnacksMenu()
			Send {Enter}
			closeInteractionMenu()
			return
	}
}

;-------------------------------------------------------------------;
; Items
getItem(name) {
	switch name
	{
		case "BuyAmmo":
			openAmmoMenu()
			Send {Up}{Enter}
			closeInteractionMenu()
			return
	}
}

;-------------------------------------------------------------------;
; Outfit fix
outfitFix() {
	openInteractionMenu()
	openStyleMenu()
	Send {Down 3}{Enter}
	closeInteractionMenu()
}

;-------------------------------------------------------------------;
; Anti-AFK
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

toggleAFK() {
	afkState := !afkState
	refreshTrayMenu()

	if (afkState) {
		antiAFK()
	}

	refreshTrayMenu()
}

;-------------------------------------------------------------------;
; Empty session
emptySession() {
  Process_Suspend("GTA5.exe")
  Sleep, 10000
  Process_Resume("GTA5.exe")
  MsgBox, 64, %macroTitle% %macroVersion%, Done!, 1
  WinActivate, %gameTitle%
}

;-------------------------------------------------------------------;
; Diamond Casino Heist
toggleDiamondCasinoHeistMode() {
  scriptPath := A_ScriptDir "\features\diamond_casino\diamond_casino.ahk"
  diamondCasinoHeistMode := !diamondCasinoHeistMode

  if (diamondCasinoHeistMode) {
    Run %scriptPath%,, Hide
  } else {
    exitScript(scriptPath)
  }

  refreshTrayMenu()
}

;-------------------------------------------------------------------;
; Others
toggleCeo() {
	vipState := !vipState
	refreshTrayMenu()

	if (vipState) {
		SoundPlay, %A_ScriptDir%\assets\vip-enabled.mp3, Wait
	} else {
		SoundPlay, %A_ScriptDir%\assets\vip-disabled.mp3, Wait
	}
}
