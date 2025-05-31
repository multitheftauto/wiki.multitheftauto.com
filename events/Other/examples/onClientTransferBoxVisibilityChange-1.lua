addEventHandler ("onClientTransferBoxVisibilityChange", getRootElement(), function (isVisible)
    outputChatBox (tostring (isVisible))
end)