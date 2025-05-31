function onClientColShapeLeave( theElement, matchingDimension )
    if ( theElement == localPlayer ) then  -- Checks whether the leaving element is the local player
        outputChatBox( "Out." )  --Outputs.
    end
end
addEventHandler("onClientColShapeLeave", root, onClientColShapeLeave)