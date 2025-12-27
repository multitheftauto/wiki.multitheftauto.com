-- specify the getBlipAttachedTo function
function getBlipAttachedTo(thePlayer)
    local blips = Element.getAllByType("blip")
    for k, theBlip in ipairs(blips) do
        if theBlip:getAttachedTo() == thePlayer then
            return theBlip
        end
    end
    return false
end

function clearVisibilityWasted(totalammo, killer, killerweapon, bodypart) -- when a player dies
    getBlipAttachedTo(source):clearVisibility() -- clear any visiblity settings of his blip
end
addEventHandler("onPlayerWasted", root, clearVisibilityWasted) -- add an event handler for onPlayerWasted
