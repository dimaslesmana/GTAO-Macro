;
; Copyright (C) 2017 MacMailler
; GitHub: https://github.com/MacMailler/QuickMacro
;

;-------------------------------------------------------------------;
; Armor
armorLabel:
  switch Armor_Type
  {
    case "armor1":
      getArmor("SuperLightArmor")
      return
    case "armor2":
      getArmor("LightArmor")
      return
    case "armor3":
      getArmor("StandardArmor")
      return
    case "armor4":
      getArmor("HeavyArmor")
      return
    case "armor5":
      getArmor("SuperHeavyArmor")
      return
    default:
      getArmor("SuperHeavyArmor")
      return
  }

;-------------------------------------------------------------------;
; Snacks
snack1Label:
  getSnack("EatEgoChaser")
return

snack2Label:
  getSnack("EatMeteorite")
return

snack3Label:
  getSnack("EateCola")
return

snack4Label:
  getSnack("EatPsQs")
return

;-------------------------------------------------------------------;
; Items
ammoLabel:
  getItem("BuyAmmo")
return

;-------------------------------------------------------------------;
; Diamond Casino Heist
diamondCasinoHeistLabel:
  toggleDiamondCasinoHeistMode()
return

;-------------------------------------------------------------------;
; Others
outfitFixLabel:
  outfitFix()
return

emptySessionLabel:
  emptySession()
return

antiAFKLabel:
  toggleAFK()
return

;-------------------------------------------------------------------;
; Main
activateLabel:
  main()
return

reloadConfigLabel:
  reloadConfig()
return

exitLabel:
  ExitApp
return
