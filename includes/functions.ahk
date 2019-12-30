;
; Copyright (C) 2017 MacMailler
; GitHub: https://github.com/MacMailler/QuickMacro
;
; Modified by kezoura (https://github.com/kezoura)
;

init() {
	ceo_status = Disabled
	if (WinExist(GameTitle)) {
		hotkeyState := hotkeyState = "ON" ? "OFF" : "ON"
		if (playerState = 0) {
			Menu, Tray, Tip,GTAO Macro: %hotkeyState%`nVIP Mode: Disabled
		} else { 
			Menu, Tray, Tip,GTAO Macro: %hotkeyState%`nVIP Mode: Enabled
		}
		setHotkeyState(hotkeyState)
		
		if (hotkeyState = "ON") {
			Menu, Tray, Rename, Activate, Deactivate
			SoundBeep, 800	
		} else{
			Menu, Tray, Rename, Deactivate, Activate
			SoundBeep, 450
		}
	} else {
		msgbox, 16, Error, GTA V is not running!
	}
}
	
setHotkeyState(t) {
	Hotkey, IfWinActive, %GameTitle%
	Hotkey, %Armor_Key%, armorLabel, %t%
	Hotkey, %Eat_EgoChaser_Key%, snack1Label, %t%
	Hotkey, %Eat_Meteorite_Key%, snack2Label, %t%
	Hotkey, %Eat_eCola_Key%, snack3Label, %t%
	Hotkey, %Eat_PsQs_Key%, snack4Label, %t%
	Hotkey, %Buy_Ammo_Key%, ammoLabel, %t%
	Hotkey, %Toggle_Ceo_Key%, toggleCeoLabel, %t%
	Hotkey, %Outfit_Fix_Key%, outfitFixLabel, %t%
}

openM() {
	setkeydelay, %keyMDelay%, %keyMDuration%
	Send {SC032}
	sleep, %menuDelay%
}

openInventory() {
	if(playerState = 0) {
		Send {Down 2}
	} else {
		Send {Down 3}
	}
}

openStyle() {
	if(playerState = 0) {
		Send {Down 3}
	} else {
		Send {Down 4}
	}
}

toggleCeo() {
	if (playerState = 0) {
		playerState := 1
		ceo_status = Enabled
		Menu, Tray, Tip,GTAO Macro: %hotkeyState%`nVIP Mode: %ceo_status%
		SoundPlay, %A_ScriptDir%\assets\vip-enabled.mp3, Wait
	} else {
		playerState := 0
		ceo_status = Disabled
		Menu, Tray, Tip,GTAO Macro: %hotkeyState%`nVIP Mode: %ceo_status%
		SoundPlay, %A_ScriptDir%\assets\vip-disabled.mp3, Wait
	}
}

toggleCrosshair() {
	if(crossHairT = false) {
		Gui, Crosshair: Show
		Menu, Tray, Rename, Crosshair: [OFF], Crosshair: [ON]
		WinActivate, ahk_class %GameTitle%
	} else {
		Gui, Crosshair: Hide
		Menu, Tray, Rename, Crosshair: [ON], Crosshair: [OFF]
	}
	crossHairT := !crossHairT
}

getItem(i) {
	openM()
	openInventory()
	if (i = "SuperLightArmor") {
		Send {Enter}
		Send {Down}{Enter}{Enter}
	}
	else if(i = "LightArmor") {
		Send {Enter}
		Send {Down}{Enter}{Down 1}{Enter}
	}
	else if(i = "StandardArmor") {
		Send {Enter}
		Send {Down}{Enter}{Down 2}{Enter}
	}
	else if(i = "HeavyArmor") {
		Send {Enter}
		Send {Down}{Enter}{Down 3}{Enter}
	}
	else if(i = "SuperHeavyArmor") {
		Send {Enter}
		Send {Down}{Enter}{Up 3}{Enter}
	}
	else if(i = "EatEgoChaser") {
		Send {Enter}
		Send {Down 2}{Enter}{Down 1}{Enter}
	}
	else if(i = "EatMeteorite") {
		Send {Enter}
		Send {Down 2}{Enter}{Down 2}{Enter}
	}
	else if(i = "EateCola") {
		Send {Enter}
		Send {Down 2}{Enter}{Down 3}{Enter}
	}
	else if(i = "EatPsQs") {
		Send {Enter}
		Send {Down 2}{Enter}{Enter}
	}
	else if(i = "BuyAmmo") {
		Send {Enter}
		Send {Down 3}{Enter}{Up}{Enter}
	}
	Send {SC032}
}

outfitFix() {
	openM()
	openStyle()
	Send {Enter}{Down 3}{Enter}
	Send {SC032}
}

toggleAFK() {
	if (afk = false) {
		MsgBox, 64, %Title% %version%, Anti-AFK Enabled!`nYou can disable it by pressing [W] on the keyboard., 5
		Menu, Tray, Rename, Anti-AFK: [OFF], Anti-AFK: [ON]
		WinActivate, %GameTitle%
	} else {
		Menu, Tray, Rename, Anti-AFK: [ON], Anti-AFK: [OFF]
	}
	afk := !afk
	if (afk = true) {
		antiAFK()
	}
}

emptySession() {
	suspendProcess()
	MsgBox, 64, %Title% %version%, Session cleared!, 1
}
