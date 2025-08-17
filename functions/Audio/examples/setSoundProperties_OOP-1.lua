function editSongSound()
	local sound = Sound("song.wav", false) -- Play the file 'song.wav' and make it play only once
	sound:setProperties(48000.0, 128.00, 440.0, false) -- Set its samplerate to 48,000 Hz, tempo to 128.00, pitch to 440 Hz and not reversed
end
addEventHandler("onClientResourceStart", resourceRoot, editSongSound) -- Execute the function when the resource is started