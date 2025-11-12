function onPlayerTarget ( targetElem )
    -- if the targeted object is a haystack (an object with model ID 3374) remove it from the game
    if getElementType ( targetElem ) == "object" and getElementModel ( targetElem ) == 3374 then
        destroyElement ( targetElem )
    end
end
addEventHandler ( "onPlayerTarget", root, onPlayerTarget )    -- add above function as handler for targeting event