-- If the progressbar exsist then
if ( somebar ) then
	-- set the progress
        guiProgressBarSetProgress(somebar, 80)
        -- get the progress
	progress = guiProgressBarGetProgress(somebar)
	-- output to the chatbox
	outputChatBox ( "Current progress:" .. progress .. "%" )
else --if the progressbar was not found
       outputChatBox ("progressbar not found!")
       -- output a message
end