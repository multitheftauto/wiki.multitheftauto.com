local weapons = {
    31,
    34,
    33,
}

addEventHandler("onResourceStart",resourceRoot,function()
    for i,v in ipairs(weapons) do
        if setJetpackWeaponEnabled(v,true) then
            outputChatBox(getWeaponNameFromID(v).." is now enabled for jetpacks!")
        end
    end
end
)