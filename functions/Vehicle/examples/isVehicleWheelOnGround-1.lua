local Green = tocolor(0, 255, 0, 255)
local Red = tocolor(255, 0, 0, 255)

addEventHandler( "onClientRender", root,
    function( )
        local theVehicle = getPedOccupiedVehicle( localPlayer )

        if isElement( theVehicle ) then
            dxDrawRectangle( 100, 100, 20, 20, isVehicleWheelOnGround ( theVehicle, 0 ) and Green or Red )
            dxDrawRectangle( 100, 140, 20, 20, isVehicleWheelOnGround ( theVehicle, 1 ) and Green or Red )
            dxDrawRectangle( 140, 100, 20, 20, isVehicleWheelOnGround ( theVehicle, 2 ) and Green or Red )
            dxDrawRectangle( 140, 140, 20, 20, isVehicleWheelOnGround ( theVehicle, 3 ) and Green or Red )
        end
    end
)