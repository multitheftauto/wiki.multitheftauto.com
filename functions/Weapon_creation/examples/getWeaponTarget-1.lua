local col = createColSphere(1647.33984375,1785.03125,10.671875,8) -- Create col sphere near to LV hospital
local weapon = createWeapon ("m4",1647.33984375,1785.03125,10.671875) -- Create the weapon

function onClientColShapeHit(element, matchDim )
   if (element == getLocalPlayer()) then  -- Checks whether the entering element is the local player 
     if weapon then -- if the weapon exist then
        setWeaponTarget (weapon,element,8) -- Set the weapon target to the localPlayer 
        local target = getWeaponTarget (weapon) -- get weapon target
          if target and isElement(target) and getElementType(target) == "player" then 
            outputChatBox("The target of the custom weapon: "..getPlayerName(target)) -- output to the chatbox
          end 
       end 
    end 
end
addEventHandler("onClientColShapeHit",col,onClientColShapeHit)