function playMusic()
    local left = playSFX("genrl", 75, 6, true) -- Play loading theme music
    local right = playSFX("genrl", 75, 7, true)
    left.pan = -1 -- switch the first music to left channel
    right.pan = 1 -- switch the second music to right channel
end
addCommandHandler("music", playMusic) -- add the command handler
