function setScore ( playerSource, cmdName, scoreValue )
    if ( scoreValue ) then
        setPlayerAnnounceValue ( playerSource, "score", scoreValue )
    end
end

addCommandHandler ( "score", setScore )