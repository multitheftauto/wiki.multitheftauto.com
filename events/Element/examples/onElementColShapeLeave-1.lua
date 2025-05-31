colArea = createColCircle( 1400.0, -700.0, 5.0 ) -- create the colshape

function elementColShapeLeave( colShapeLeft )
    if colShapeLeft == colArea then -- if element left the created colshape
        outputChatBox( getElementType( source ) .. " left the colCircle!" ) -- print the type of the element to chatbox
    end
end
addEventHandler( "onElementColShapeLeave", getRootElement(), elementColShapeLeave ) -- add a handler function for the event