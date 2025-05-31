function elementStartSync( newSyncer )
    local strElementType = getElementType( source )
    local playerVehicle = getPedOccupiedVehicle( newSyncer )
    if ( strElementType == 'vehicle' ) then
        if ( not playerVehicle ) then return false end
        
        setElementModel( source, getElementModel(playerVehicle) )
    elseif ( strElementType == 'ped' ) then
        setElementModel( source, getElementModel(newSyncer) )
    end
end
addEventHandler ('onElementStartSync', root, elementStartSync)