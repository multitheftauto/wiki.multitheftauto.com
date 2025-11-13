addCommandHandler("bleeding", function()
    local bleeding = isPedFootBloodEnabled(localPlayer)
	
    outputChatBox("I am " .. (not bleeding and "not" or '') .. " bleeding")
end)