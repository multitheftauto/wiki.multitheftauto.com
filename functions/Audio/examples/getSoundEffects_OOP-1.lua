function switchEffects(sound)
	for _,v in ipairs(sound:getEffects()) do -- Go through the whole list of sound effects for the sound
		if v == "gargle" then -- If the sound effect is 'gargle', proceed
			sound:setEffectEnabled("gargle", false) -- Disable the 'gargle' -effect
			break
		end
	end
end