function soundFunc()
    local sound = Sound("/sounds/jizzy.mp3", true) -- Let's play a sound
    sound.speed = 1.2 -- And it will be a little bit faster !
end
addCommandHandler("play", soundFunc)
