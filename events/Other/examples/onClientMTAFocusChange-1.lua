function onClientMTAFocusChange(windowFocused)
    local focusedText = windowFocused and "MTA has gained focus." or "MTA has lost focus."

    outputChatBox(focusedText)
end
addEventHandler("onClientMTAFocusChange", root, onClientMTAFocusChange)