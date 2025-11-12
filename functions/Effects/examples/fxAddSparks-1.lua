fires = {
    {0, 0, 3} --Middle of SA
}


for i = 1, #fires do
    bin = createObject(1362, fires[i][1], fires[i][2], fires[i][3]-0.5)
    torch = createObject(3461, fires[i][1]-0.1, fires[i][2]-0.1, fires[i][3]-2)
    light = createMarker(fires[i][1], fires[i][2], fires[i][3]+0.2, "corona", 1, 255, 170, 0, 80, root)
    fireCol = createColSphere(fires[i][1], fires[i][2], fires[i][3]+0.5, 0.8)
    setTimer(fxAddSparks, math.random(4000, 5000), 0, fires[i][1]+math.random(0.1, 0.3), fires[i][2]+math.random(0.1, 0.2), fires[i][3]+0.2, 1, 1, 1)         
            
    addEventHandler("onClientColShapeHit", fireCol, 
    function(theElement)
        if (getElementType(theElement) == "player") then
            setPedOnFire(theElement, true)
        end
    end)
            
end