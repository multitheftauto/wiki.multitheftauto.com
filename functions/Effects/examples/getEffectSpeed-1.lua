addCommandHandler("ges", 
function (cmd)
   local x, y, z = getElementPosition(localPlayer)
   local effect = createEffect("explosion_crate", x, y, z)
   outputChatBox("The speed: " .. tostring(getEffectSpeed(effect)))
end)