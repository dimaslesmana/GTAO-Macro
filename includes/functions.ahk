;
; Copyright (C) 2017 MacMailler
; GitHub: https://github.com/MacMailler/QuickMacro
;

main() {
	if (!WinExist(gameTitle)) {
		MsgBox, 16, Error, %gameTitle% is not running!
		ExitApp
	}

	result := checkAssets()
	if (result.error) {
		MsgBox, 16, Unsupported resolution, % "Missing asset! `nPath: " result.message
		ExitApp
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

checkAssets() {
	interactionMenu := ["inventory-novip.bmp", "inventory-vip.bmp", "style-novip.bmp", "style-vip.bmp", "snacks.bmp", "ammo.bmp", "body-armor.bmp"]

	for i, asset in interactionMenu {
		path := A_ScriptDir "\assets\images\interaction-menu\" A_ScreenWidth "x" A_ScreenHeight "\" asset
		if (!FileExist(path)) {
			return { error: true, message: path}
		}
	}

	return { error: false, message: "" }
}

;-------------------------------------------------------------------;
; Keybinds
setHotkeyState(state) {
	Hotkey, IfWinActive, %gameTitle%
	Hotkey, %Armor_Key%, armorLabel, %state%
	Hotkey, %Eat_EgoChaser_Key%, snack1Label, %state%
	Hotkey, %Eat_Meteorite_Key%, snack2Label, %state%
	Hotkey, %Eat_eCola_Key%, snack3Label, %state%
	Hotkey, %Eat_PsQs_Key%, snack4Label, %state%
	Hotkey, %Buy_Ammo_Key%, ammoLabel, %state%
	Hotkey, %Outfit_Fix_Key%, outfitFixLabel, %state%
}

;-------------------------------------------------------------------;
; Interaction Menu functions
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
	isOpened := false
	Loop, 20
	{
		Loop, 2
		{
			image := (A_Index == 1) ? "inventory-novip.bmp" : "inventory-vip.bmp"
			path := A_ScriptDir "\assets\images\interaction-menu\" A_ScreenWidth "x" A_ScreenHeight "\" image

			ImageSearch,,, % interactionMenuArea.x, % interactionMenuArea.y, % interactionMenuArea.x2, % interactionMenuArea.y2, *50 %path%

			if (ErrorLevel == 0) {
				Send {Enter}
				isOpened := true
				break
			}
		}

		if (isOpened)
			break

		Sleep, 10
		Send {Down}
	}

	if (!isOpened) {
		ToolTip Inventory Menu not found!, 0, 0
		Sleep 2500
		clearTooltips()
	}

	return isOpened
}

openArmorMenu() {
	openInteractionMenu()
	isInventoryOpen := openInventoryMenu()

	if (isInventoryOpen) {
		isOpened := false
		Loop, 20
		{
			image := "body-armor.bmp"
			path := A_ScriptDir "\assets\images\interaction-menu\" A_ScreenWidth "x" A_ScreenHeight "\" image

			ImageSearch,,, % interactionMenuArea.x, % interactionMenuArea.y, % interactionMenuArea.x2, % interactionMenuArea.y2, *50 %path%

			if (ErrorLevel == 0) {
				Send {Enter}
				isOpened := true
				break
			}

			Sleep, 10
			Send {Down}
		}

		if (!isOpened) {
			ToolTip Body Armor Menu not found!, 0, 0
			Sleep 2500
			clearTooltips()
		}

		return isOpened
	}

	return isInventoryOpen
}

openSnacksMenu() {
	openInteractionMenu()
	isInventoryOpen := openInventoryMenu()

	if (isInventoryOpen) {
		isOpened := false
		Loop, 20
		{
			image := "snacks.bmp"
			path := A_ScriptDir "\assets\images\interaction-menu\" A_ScreenWidth "x" A_ScreenHeight "\" image

			ImageSearch,,, % interactionMenuArea.x, % interactionMenuArea.y, % interactionMenuArea.x2, % interactionMenuArea.y2, *50 %path%

			if (ErrorLevel == 0) {
				Send {Enter}
				isOpened := true
				break
			}

			Sleep, 10
			Send {Down}
		}

		if (!isOpened) {
			ToolTip Snacks Menu not found!, 0, 0
			Sleep 2500
			clearTooltips()
		}

		return isOpened
	}

	return isInventoryOpen
}

openAmmoMenu() {
	openInteractionMenu()
	isInventoryOpen := openInventoryMenu()

	if (isInventoryOpen) {
		isOpened := false
		Loop, 20
		{
			image := "ammo.bmp"
			path := A_ScriptDir "\assets\images\interaction-menu\" A_ScreenWidth "x" A_ScreenHeight "\" image

			ImageSearch,,, % interactionMenuArea.x, % interactionMenuArea.y, % interactionMenuArea.x2, % interactionMenuArea.y2, *50 %path%

			if (ErrorLevel == 0) {
				Send {Enter}
				isOpened := true
				break
			}

			Sleep, 10
			Send {Down}
		}

		if (!isOpened) {
			ToolTip Ammo Menu not found!, 0, 0
			Sleep 2500
			clearTooltips()
		}

		return isOpened
	}

	return isInventoryOpen
}

openStyleMenu() {
	isEnterPressed := false
	Loop, 20
	{
		Loop, 2
		{
			image := (A_Index == 1) ? "style-novip.bmp" : "style-vip.bmp"
			path := A_ScriptDir "\assets\images\interaction-menu\" A_ScreenWidth "x" A_ScreenHeight "\" image

			ImageSearch,,, % interactionMenuArea.x, % interactionMenuArea.y, % interactionMenuArea.x2, % interactionMenuArea.y2, *50 %path%

			if (ErrorLevel == 0) {
				Send {Enter}
				isEnterPressed := true
				break
			}
		}

		if (isEnterPressed)
			break

		Sleep, 10
		Send {Down}
	}

	if (!isEnterPressed) {
		ToolTip Style Menu not found!, 0, 0
		Sleep 2500
		clearTooltips()
	}

	return isEnterPressed
}

;-------------------------------------------------------------------;
; Others
clearTooltips() {
	Tooltip
}

reloadConfig() {
	loadConfig()
	MsgBox, 64, %macroTitle% %macroVersion%, Config Reloaded!, 1
}

exitScript(path) {
	WinClose, %path% ahk_class AutoHotkey
}
