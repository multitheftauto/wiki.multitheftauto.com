local function testWeaponState()
    local weapon = createWeapon("m4", getElementPosition(localPlayer)) -- Create the weapon
    outputChatBox("The weapon that has just been created state is " .. getWeaponState(weapon) .. ".") -- Tell the player its state
end
addEventHandler("onClientResourceStart", resourceRoot, testWeaponState)