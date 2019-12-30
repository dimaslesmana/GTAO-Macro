;
; Copyright (C) 2017 MacMailler
; GitHub: https://github.com/MacMailler/QuickMacro
;
; Modified by kezoura (https://github.com/kezoura)
;

Global SettingsFile := "config.ini"

loadConf() {
	IfExist, %SettingsFile%
	{
		IniRead, menuDelay, %SettingsFile%, Delays, MenuDelay
		IniRead, keyMDelay, %SettingsFile%, Delays, KeyMDelay
		IniRead, keyMDuration, %SettingsFile%, Delays, KeyMDuration
		
		IniRead, Eat_EgoChaser_Key, %SettingsFile%, Hotkeys, Eat_EgoChaser_Key
		IniRead, Eat_Meteorite_Key, %SettingsFile%, Hotkeys, Eat_Meteorite_Key
		IniRead, Eat_eCola_Key, %SettingsFile%, Hotkeys, Eat_eCola_Key
		IniRead, Eat_PsQs_Key, %SettingsFile%, Hotkeys, Eat_PsQs_Key
		IniRead, Armor_Key, %SettingsFile%, Hotkeys, Armor_Key
		IniRead, Buy_Ammo_Key, %SettingsFile%, Hotkeys, Buy_Ammo_Key
		IniRead, Toggle_Ceo_Key, %SettingsFile%, Hotkeys, Toggle_Ceo_Key
		IniRead, Outfit_Fix_Key, %SettingsFile%, Hotkeys, Outfit_Fix_Key

		IniRead, Armor_Type, %SettingsFile%, Misc, Armor_Type
	} else {
		MsgBox, 48, Warning, No config detected!`nUpon this prompt, the config file will be created.
		IniWrite, %menuDelay%, %SettingsFile%, Delays, MenuDelay
		IniWrite, %keyMDelay%, %SettingsFile%, Delays, KeyMDelay
		IniWrite, %keyMDuration%, %SettingsFile%, Delays, KeyMDuration
		
		IniWrite, %Eat_EgoChaser_Key%, %SettingsFile%, Hotkeys, Eat_EgoChaser_Key
		IniWrite, %Eat_Meteorite_Key%, %SettingsFile%, Hotkeys, Eat_Meteorite_Key
		IniWrite, %Eat_eCola_Key%, %SettingsFile%, Hotkeys, Eat_eCola_Key
		IniWrite, %Eat_PsQs_Key%, %SettingsFile%, Hotkeys, Eat_PsQs_Key
		IniWrite, %Armor_Key%, %SettingsFile%, Hotkeys, Armor_Key
		IniWrite, %Buy_Ammo_Key%, %SettingsFile%, Hotkeys, Buy_Ammo_Key
		IniWrite, %Toggle_Ceo_Key%, %SettingsFile%, Hotkeys, Toggle_Ceo_Key
		IniWrite, %Outfit_Fix_Key%, %SettingsFile%, Hotkeys, Outfit_Fix_Key

		IniWrite, %Armor_Type%, %SettingsFile%, Misc, Armor_Type
	}
}
