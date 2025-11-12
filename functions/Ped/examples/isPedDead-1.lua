--Check if player is alive or dead and let them know in the chat box
function deathCheck ( thePlayer, commandName )
    if ( isPedDead ( thePlayer ) ) then
         outputChatBox ( "You're dead... prepare to become a zombie.", thePlayer )
    else
         outputChatBox ( "Count your lucky stars, you're alive.", thePlayer )
    end
end
addCommandHandler ( "amidead", deathCheck )