--[[

Skills to upgrade:

24 = Max Player Health
69 = Weapon Type Pistol Skill
70 = Weapon Type Pistol Silenced Skill
71 = Weapon Type Desert Eagle Skill
72 = Weapon Type Shotgun Skill
73 = Weapon Type Sawn off Shotgun Skill
74 = Weapon Type Spas 12 Shotgun Skill
76 = Weapon Type MP5 Skill
77 = Weapon Type AK47 Skill
78 = Weapon Type M4 Skill
79 = Weapon Type Sniper Rifle Skill

--]]

addCommandHandler("upgradeskills", function(thePlayer)
   -- Set every stat to 1000 (the maximum value)
   for _, stat in ipairs({ 24, 69, 70, 71, 72, 73, 74, 76, 77, 78, 79 }) do
      setPedStat(thePlayer, stat, 1000)
      outputChatBox("Your game stats upgraded to maximum!", thePlayer, 0, 255, 0, false)
   end
      -- Set player health to the maximum, as changing the stat keeps the current one
      if (isPedDead (thePlayer) ~= true) then
      setElementHealth(thePlayer, 100 + (getPedStat(ped, 24) - 569) / 4.31 return math.max(1, maxhealth))
      -- Tell the player what we did
      outputChatBox("And your health upgraded to maximum!", thePlayer, 0, 255, 0, false)
      else
      outputChatBox("Your health can't be restored because you are already dead!", thePlayer, 0, 255, 0, false)
   end
end)