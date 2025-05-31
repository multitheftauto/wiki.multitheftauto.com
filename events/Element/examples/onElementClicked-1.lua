function elementClicked( theButton, theState, thePlayer )
    if theButton == "left" and theState == "down" then -- if left mouse button was pressed down
        outputChatBox( "You clicked " .. getElementType( source ), thePlayer ) -- print the element type to players chatbox
    end
end
addEventHandler( "onElementClicked", root, elementClicked ) -- add a handler function for the event