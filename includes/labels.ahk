;
; Copyright (C) 2017 MacMailler
; GitHub: https://github.com/MacMailler/QuickMacro
;

; CEO abilities
toggleCeoLabel:
  toggleCeo()
return

; Armor lists
armorLabel:
  switch Armor_Type
  {
    case "armor1":
      getItem("SuperLightArmor")
      return
    case "armor2":
      getItem("LightArmor")
      return
    case "armor3":
      getItem("StandardArmor")
      return
    case "armor4":
      getItem("HeavyArmor")
      return
    case "armor5":
      getItem("SuperHeavyArmor")
      return
    default:
      getItem("SuperHeavyArmor")
      return
  }

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
  main()
return

reloadConfigLabel:
  reloadConfig()
return

exitLabel:
  ExitApp
return
