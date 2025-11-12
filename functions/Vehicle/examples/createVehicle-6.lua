addEventHandler( "onResourceStart", resourceRoot,
    function()
        infernus = Vehicle(411, Vector3(0, 0, 3)); -- Create an Infernus and spawn it at the middle of SA.
        infernus:setColor(0, 0, 0); -- Set its color to black.
        infernus.damageProof = true; -- Make it damage proof
    end
)
	
addCommandHandler( "blowinfernus",
    function(p)
        if not infernus.blown then -- Check if the Infernus is blown up or not.
            infernus:blow();
        else -- Ouch, it's blown up, let's output an error to the player.
            outputChatBox( "The Infernus has already been blown up by you.", p, 255, 0, 0, false );
        end
    end)