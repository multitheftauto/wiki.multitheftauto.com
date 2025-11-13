addEventHandler("onResourceStart",resourceRoot,function()
     if setJetpackWeaponEnabled("31",true) then
          outputChatBox(getWeaponNameFromID(31).." is now enabled for jetpacks!")
     end
end)