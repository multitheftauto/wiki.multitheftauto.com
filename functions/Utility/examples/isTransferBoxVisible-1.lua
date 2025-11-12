function isVisible ()
    if isTransferBoxVisible () then 
        setTransferBoxVisible (false)
        outputChatBox ("* "..getPlayerName (localPlayer).." you are downloading the server!", 255, 255, 255, true)      
    end
end
addCommandHandler ("download2", isVisible)