local level = 0

function drainSomeWater()
    level = level - 0.01
    setWaterLevel ( level )
end
setTimer ( drainSomeWater, 100, 15000 )