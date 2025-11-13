function soundFunc()
sound = playSound ( "/sounds/jizzy.mp3",true) -- Let's play a sound
setSoundSpeed ( sound, 1.2 ) -- And it will be a little bit faster !
end
addCommandHandler("play",soundFunc)