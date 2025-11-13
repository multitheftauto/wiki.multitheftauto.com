function thaResourceStarting( )
    water = createWater ( 1866, -1444, 10, 1968, -1442, 10, 1866, -1372, 10, 1968, -1370, 10 )
    setWaterLevel ( water, 20 )
end
addEventHandler("onClientResourceStart", resourceRoot, thaResourceStarting)