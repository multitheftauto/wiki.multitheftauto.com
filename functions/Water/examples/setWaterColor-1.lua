function changeWaterColor ( commandName, red, green, blue, alpha )
    -- if alpha is input, then include it too
    alpha = tonumber ( alpha ) or 200
    red = tonumber ( red )
    green = tonumber ( green )
    blue = tonumber ( blue )
    -- check if the colour values for red, green and blue are valid
    if red and green and blue then
        setWaterColor ( red, green, blue, alpha )
    else
        outputChatBox ( "Failed to change the water colour!" )
    end
end
addCommandHandler ( "watercolor", changeWaterColor )