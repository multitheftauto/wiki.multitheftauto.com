--Check the state of wiki.mtasa.com
if ( Browser.isDomainBlocked ( "wiki.mtasa.com" ) ) then
	--If it is blocked.
	outputChatBox("wiki.mtasa.com is blocked and can't be loaded right now!")
else
	--If it is not blocked. (Was accepted by the user)
	outputChatBox("wiki.mtasa.com is not blocked and ready to be loaded!")
end