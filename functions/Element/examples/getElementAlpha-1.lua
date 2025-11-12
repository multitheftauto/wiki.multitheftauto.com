function amIVisible()
	if getElementAlpha(localPlayer) == 0 then
            outputChatBox("I'm invisible")
        else
            outputChatBox("I'm not invisible")
        end
end
addCommandHandler ( "amivisible", amIVisible )