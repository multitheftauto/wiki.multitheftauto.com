local myLabel = guiCreateLabel  ( 0, 0, 1, 1, "", true )

function addLabelOnClick ( button, state, absoluteX, absoluteY, worldX, worldY, worldZ, clickedElement )
        --if an element was clicked on screen
        if ( clickedElement ) then
                --retreive the element type
                local elementType = getElementType ( clickedElement )
                --change the label text to that element type
                guiSetText ( myLabel, elementType )
                --and place it in the position of where the element is
                guiSetPosition ( myLabel, absoluteX, absoluteY, false )
                --hide the text by passing an empty string 5 seconds later
                setTimer ( guiSetText, 5000, 1, myLabel, "" )
        end
end
addEventHandler ( "onClientClick", root, addLabelOnClick )