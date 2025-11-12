function commandGetSunColor(player, command)
    local Ra, Ga, Ba, Rb, Gb, Bb = getSunColor()
    if (Ra) then
        outputChatBox("The current color of the sun is "..Ra.." "..Ga.." "..Ba.." "..Rb.." "..Gb.." "..Bb..".", player, 0, 255, 0)
    else
        outputChatBox("The color of the sun is normal.", player, 0, 255, 0)
    end
end
addCommandHandler("getsuncolor", commandGetSunColor)