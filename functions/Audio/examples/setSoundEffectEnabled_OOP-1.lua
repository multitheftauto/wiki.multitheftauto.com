addCommandHandler("flanger", function(cmd, enabled)
    if isElement(waterSplashes) then
        waterSplashes:setEffectEnabled(cmd, enabled)
    else
        waterSplashes = Sound("splashes.mp3", true)
        waterSplashes:setEffectEnabled(cmd, enabled)
    end
end, true) -- set it case sensitive as we are going to get the command name and use it in the setSoundEffectEnabled
