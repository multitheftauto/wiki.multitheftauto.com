function voiceMuteFunction( Muter , cmd , MutedName , mutual)
	if not MutedName then
		return outputChatBox("Syntax: /".. cmd .." <player name> <mutual>", Muter)
	end
	local Muted = getPlayerFromName(MutedName)
	if not Muted then
		return outputChatBox('enter the correct player name' , Muter)
	end
	if Muted == Muter then
		return outputChatBox("You cannot mute yourself!", Muter)
	end
	if mutual then --enter any string as the second arg for making this mute mutual or enter nothing to make it one-way
		setPlayerVoiceIgnoreFrom(Muter,Muted)
		setPlayerVoiceIgnoreFrom(Muted,Muter)
	else
		setPlayerVoiceIgnoreFrom(Muter,Muted)
	end    
end
addCommandHandler('voiceMute' ,voiceMuteFunction )
-- e.g. /voiceMute jacky y  (mutual)
-- e.g. /voiceMute jacky  (one-way)