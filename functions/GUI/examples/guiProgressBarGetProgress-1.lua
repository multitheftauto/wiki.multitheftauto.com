-- If the progressbar exsist then
if ( somebar ) then
	-- get the progress
	progress = guiProgressBarGetProgress(somebar)
	-- output to the chatbox
	outputChatBox ( "Current progress:" .. progress .. "%" )
end