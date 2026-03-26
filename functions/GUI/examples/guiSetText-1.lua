-- create an empty label
local myLabel = guiCreateLabel(0, 0, 1, 1, "", true)
local timer

function addLabelOnClick(button, state, absoluteX, absoluteY, worldX, worldY, worldZ, clickedElement)
    -- if an element was clicked on screen
    if (clickedElement) then
        -- retrieve the element type
        local elementType = getElementType(clickedElement)
        -- change the label text to that element type
        guiSetText(myLabel, elementType)
        -- and place it in the position of where the element is
        guiSetPosition(myLabel, absoluteX, absoluteY, true)
        -- hide the text by passing an empty string 5 seconds later
        if (not isTimer(timer)) then
            setTimer(guiSetText, 5000, 1, myLabel, "")
        else
            resetTimer(timer)
        end
    end
end
addEventHandler("onClientClick", root, addLabelOnClick)
