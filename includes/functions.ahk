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
	SetKeyDelay, %keyMDelay%, %keyMDuration%
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

openStyleMenu() {
	if (vipState) {
		Send {Down 4}
	} else {
		Send {Down 3}
	}
	Send {Enter}
}

reloadConfig() {
	loadConfig()
	MsgBox, 64, %macroTitle% %macroVersion%, Config Reloaded!, 1
}

exitScript(path) {
	WinClose, %path% ahk_class AutoHotkey
}
