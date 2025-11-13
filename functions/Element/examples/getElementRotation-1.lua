function onPlayerTargeted ( targetElem )
    if ( isElement(targetElem) and getElementType (targetElem) == "player" ) then
        local x,y,z = getElementRotation ( targetElem )
        outputChatBox ( "Target player rotation: " .. x .. " " .. y .. " " .. z )
    end
end
addEventHandler ( "onClientPlayerTarget", root, onPlayerTargeted )