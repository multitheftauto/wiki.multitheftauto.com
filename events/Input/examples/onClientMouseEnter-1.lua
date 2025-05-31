addEventHandler( "onClientMouseEnter", root, 
    function(aX, aY)
        outputChatBox( "You're pointing at a GUI element at ("..tostring(aX)..", "..tostring(aY)..")")
    end
)