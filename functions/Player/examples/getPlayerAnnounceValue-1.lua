function getScore ( playerSource, cmdName )
    local scoreValue = getPlayerAnnounceValue ( playerSource, "score" )
    if ( scoreValue ) then
        outputChatBox ( "Your score: "..scoreValue, playerSource )
    end
end

addCommandHandler ( "getscore", getScore )