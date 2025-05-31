function onClientColShapeHit( theElement, matchingDimension )
    if ( theElement == localPlayer ) then  -- Checks whether the entering element is the local player
        outputChatBox( "In." )  --Outputs.
    end
end
addEventHandler("onClientColShapeHit", root, onClientColShapeHit)