colArea = createColCircle( 1400.0, -700.0, 5.0 ) -- create the colshape

function elementColShapeHit( colShapeHit )
    if colShapeHit == colArea then -- if element entered the created colshape
        outputChatBox( getElementType( source ) .. " entered the colCircle!" ) -- print the type of the element to chatbox
    end
end
addEventHandler( "onElementColShapeHit", root, elementColShapeHit ) -- add a handler function for the event