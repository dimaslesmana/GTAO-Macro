;
; Copyright (C) 2017 MacMailler
; GitHub: https://github.com/MacMailler/QuickMacro
;

Global ConfigFile := "config.ini"

loadConfig() {
  IfExist, %ConfigFile%
  {
    IniRead, menuDelay, %ConfigFile%, Delays, MenuDelay
    IniRead, keyMDelay, %ConfigFile%, Delays, KeyMDelay
    IniRead, keyMDuration, %ConfigFile%, Delays, KeyMDuration

    IniRead, Eat_EgoChaser_Key, %ConfigFile%, Hotkeys, Eat_EgoChaser_Key
    IniRead, Eat_Meteorite_Key, %ConfigFile%, Hotkeys, Eat_Meteorite_Key
    IniRead, Eat_eCola_Key, %ConfigFile%, Hotkeys, Eat_eCola_Key
    IniRead, Eat_PsQs_Key, %ConfigFile%, Hotkeys, Eat_PsQs_Key
    IniRead, Armor_Key, %ConfigFile%, Hotkeys, Armor_Key
    IniRead, Buy_Ammo_Key, %ConfigFile%, Hotkeys, Buy_Ammo_Key
    IniRead, Outfit_Fix_Key, %ConfigFile%, Hotkeys, Outfit_Fix_Key

    IniRead, Armor_Type, %ConfigFile%, Misc, Armor_Type
  } else {
    MsgBox, 48, Warning, Configuration file does not exist!`nUpon this prompt, the config file will be created.
    IniWrite, %menuDelay%, %ConfigFile%, Delays, MenuDelay
    IniWrite, %keyMDelay%, %ConfigFile%, Delays, KeyMDelay
    IniWrite, %keyMDuration%, %ConfigFile%, Delays, KeyMDuration

    IniWrite, %Eat_EgoChaser_Key%, %ConfigFile%, Hotkeys, Eat_EgoChaser_Key
    IniWrite, %Eat_Meteorite_Key%, %ConfigFile%, Hotkeys, Eat_Meteorite_Key
    IniWrite, %Eat_eCola_Key%, %ConfigFile%, Hotkeys, Eat_eCola_Key
    IniWrite, %Eat_PsQs_Key%, %ConfigFile%, Hotkeys, Eat_PsQs_Key
    IniWrite, %Armor_Key%, %ConfigFile%, Hotkeys, Armor_Key
    IniWrite, %Buy_Ammo_Key%, %ConfigFile%, Hotkeys, Buy_Ammo_Key
    IniWrite, %Outfit_Fix_Key%, %ConfigFile%, Hotkeys, Outfit_Fix_Key

    IniWrite, %Armor_Type%, %ConfigFile%, Misc, Armor_Type
  }
}
