function setNewGameType( source, commandName, newGameType )
    local oldGameType = getGameType() -- check old Game Type
    setGameType( newGameType ) -- set new Game Type
    outputChatBox( "Game Type " .. oldGameType .. " changed to " .. newGameType .. ".", getRootElement(), 255, 128, 0 )
end
addCommandHandler( "setgametype", setNewGameType )