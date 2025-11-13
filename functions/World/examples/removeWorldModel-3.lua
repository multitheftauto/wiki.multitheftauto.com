for i = 321, 18630 do
    removeWorldModel(i, 10000, 0, 0, 0)
end
setOcclusionsEnabled(false)  -- Also disable occlusions when removing certain models
setWaterLevel(-5000)         -- Also hide the default water as it will be full of holes