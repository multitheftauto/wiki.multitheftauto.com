function player_Wasted ( killer, weapon, bodypart )
    -- if there even was a killer and the killer isn't the killed player itself
    if ( killer ) and ( killer ~= source ) then
        -- there was a killer
        if ( isElementOnScreen ( killer ) ) then
            -- the killer was on screen
            outputChatBox ( "You can still see your killer!", 255, 0, 0 )
        else
            -- the killer was not on screen
            outputChatBox ( "You can not see your killer!", 255, 0, 0 )
        end
    end
end
-- call player_Wasted when only the local player dies
addEventHandler ( "onClientPlayerWasted", localPlayer, player_Wasted )