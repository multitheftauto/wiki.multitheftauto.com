function switchEffects(sound)
    for _, v in ipairs(getSoundEffects(sound)) do -- Go through the whole list of sound effects for the sound
        if v == "gargle" then -- If the sound effect is 'gargle', proceed
            setSoundEffectEnabled(sound, "gargle", false) -- Disable the 'gargle' -effect
            break
        end
    end
end
