;
; Copyright (C) 2017 MacMailler
; GitHub: https://github.com/MacMailler/QuickMacro
;
; Modified by kezoura (https://github.com/kezoura)
;

; CEO abilities
toggleCeoLabel:
	toggleCeo()
return

; Armor lists
armorLabel:
	if(Armor_Type = "armor1") {
		getItem("SuperLightArmor")
	}
	else if(Armor_Type = "armor2") {
		getItem("LightArmor")
	}
	else if(Armor_Type = "armor3") {
		getItem("StandardArmor")
	}
	else if(Armor_Type = "armor4") {
		getItem("HeavyArmor")
	} 
	else if(Armor_Type = "armor5") {
		getItem("SuperHeavyArmor")
}
return

; Player items
snack1Label:
	getItem("EatEgoChaser")
return

snack2Label:
	getItem("EatMeteorite")
return

snack3Label:
	getItem("EateCola")
return

snack4Label:
	getitem("EatPsQs")
return

ammoLabel:
	getItem("BuyAmmo")
return

; Others
outfitFixLabel:
	outfitFix()
return

emptySessionLabel:
	emptySession()
return

crosshairLabel:
	toggleCrosshair()
return

antiAFKLabel:
	toggleAFK()
return

; Main
activateLabel:
	init()
return

exitLabel:
	ExitApp
return
