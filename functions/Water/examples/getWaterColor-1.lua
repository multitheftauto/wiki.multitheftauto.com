function waterColor ()
    local r,g,b,a = getWaterColor ()
    if ( r and g and b and a ) then -- If color is true
          -- Output of the value of the water color to the chat
        outputChatBox ( "The color of water is: "..math.ceil(r)..", "..math.ceil(g)..", "..math.ceil(b)..", "..math.ceil(a).."", r, g, b )
    else
          -- Notify the player if the value of the colors is false
        outputChatBox ( "Failed to get the color of water!" )
    end
end
  -- Add command handler for the function
addCommandHandler("watercolor", waterColor )