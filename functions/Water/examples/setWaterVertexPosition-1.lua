waterSquare = createWater (1418, -625, 91.8, 1436, -625, 91.8, 1418, -613, 91.8, 1436, -613, 91.8)
local waterVertices = false

function waterUp ()
    if waterVertices == false then
        setWaterVertexPosition (waterSquare, 2, 1436, -625, 94.8)
        setWaterVertexPosition (waterSquare, 4, 1436, -613, 94.8)
        waterVertices = true
    else
        setWaterVertexPosition (waterSquare, 2, 1436, -625, 91.8)
        setWaterVertexPosition (waterSquare, 4, 1436, -613, 91.8)
        waterVertices = false
    end
end
addCommandHandler("water", waterUp)