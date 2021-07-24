;
; Copyright (C) 2017 MacMailler
; GitHub: https://github.com/MacMailler/QuickMacro
;

main() {
	if (!WinExist(gameTitle)) {
		MsgBox, 16, Error, %gameTitle% is not running!
		return
	}

	hotkeyState := (hotkeyState == "ON") ? "OFF" : "ON"
	refreshTrayMenu()
	setHotkeyState(hotkeyState)

	if (hotkeyState == "ON") {
		SoundBeep, 800
	} else {
		SoundBeep, 450
	}
}

setHotkeyState(state) {
	Hotkey, IfWinActive, %gameTitle%
	Hotkey, %Armor_Key%, armorLabel, %state%
	Hotkey, %Eat_EgoChaser_Key%, snack1Label, %state%
	Hotkey, %Eat_Meteorite_Key%, snack2Label, %state%
	Hotkey, %Eat_eCola_Key%, snack3Label, %state%
	Hotkey, %Eat_PsQs_Key%, snack4Label, %state%
	Hotkey, %Buy_Ammo_Key%, ammoLabel, %state%
	Hotkey, %Toggle_Ceo_Key%, toggleCeoLabel, %state%
	Hotkey, %Outfit_Fix_Key%, outfitFixLabel, %state%
}

openInteractionMenu() {
	setkeydelay, %keyMDelay%, %keyMDuration%
	Send {SC032}
	Sleep, %menuDelay%
}

closeInteractionMenu() {
	Sleep, %menuDelay%
	Send {SC032}
}

openInventoryMenu() {
	if (vipState) {
		Send {Down 3}
	} else {
		Send {Down 2}
	}
	Send {Enter}
}

openStyleMenu() {
	if (vipState) {
		Send {Down 4}
	} else {
		Send {Down 3}
	}
	Send {Enter}
}

openArmorMenu() {
	openInteractionMenu()
	openInventoryMenu()
	Send {Down 3}{Enter}
}

openSnacksMenu() {
	openInteractionMenu()
	openInventoryMenu()
	Send {Down 4}{Enter}
}

openAmmoMenu() {
	openInteractionMenu()
	openInventoryMenu()
	Send {Down 5}{Enter}
}

toggleCeo() {
	vipState := !vipState
	refreshTrayMenu()

	if (vipState) {
		SoundPlay, %A_ScriptDir%\assets\vip-enabled.mp3, Wait
	} else {
		SoundPlay, %A_ScriptDir%\assets\vip-disabled.mp3, Wait
	}
}

toggleCrosshair() {
	crosshairState := !crosshairState
	refreshTrayMenu()

	if (crosshairState) {
		Gui, Crosshair: Show
		WinActivate, %gameTitle%
	} else {
		Gui, Crosshair: Hide
	}
}

getItem(itemName) {
	switch itemName
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
		case "BuyAmmo":
			openAmmoMenu()
			Send {Up}{Enter}
			closeInteractionMenu()
			return
	}
}

outfitFix() {
	openInteractionMenu()
	openStyleMenu()
	Send {Down 3}{Enter}
	closeInteractionMenu()
}

toggleAFK() {
	afkState := !afkState
	refreshTrayMenu()

	if (afkState) {
		antiAFK()
	}

	refreshTrayMenu()
}

emptySession() {
	suspendGTA5()
	MsgBox, 64, %macroTitle% %macroVersion%, Done!, 1
	WinActivate, %gameTitle%
}

reloadConfig() {
	loadConfig()
	MsgBox, 64, %macroTitle% %macroVersion%, Config Reloaded!, 1
}
