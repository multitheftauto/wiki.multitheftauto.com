addEventHandler ("onClientResourceStart", resourceRoot,
function()
    setTimer(function()
                if isElementInWater( localPlayer ) then
                    setElementHealth( localPlayer, 0 )
                 end
             end,
             3000, 0 )
end
)