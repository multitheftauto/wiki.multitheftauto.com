function showMeMyVersion( playerSource )
    local version = getPlayerVersion ( playerSource )
    outputChatBox ( "Your client version is: " .. version, playerSource )
end

addCommandHandler ( "myversion", showMeMyVersion )