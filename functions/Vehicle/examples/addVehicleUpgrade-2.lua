-- create a collision shape
local nitroColShape = createColSphere ( 1337, 100, 12, 2 )

-- attach the collision shape to an 'onClientColShapeHit' event
function onNitroColShapeHit ( hitElement, matchingDimension )
    if ( getElementType ( hitElement ) == "vehicle" ) then
        -- add a nitro upgrade if the element that hit the colshape is a vehicle
        addVehicleUpgrade ( hitElement, 1010 )
    end
end
addEventHandler ( "onClientColShapeHit", nitroColShape, onNitroColShapeHit )