local x, y, z = getElementPosition(localPlayer)
if not playSFX3D("script", 7, 1, x + 10, y, z, true) then
    outputChatBox("You have to install some missing audio files to hear the sound")
end