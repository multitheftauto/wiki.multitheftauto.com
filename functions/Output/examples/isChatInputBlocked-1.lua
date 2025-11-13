function toggleInputBlocked ()
    local visible = isChatVisible () -- check if the chat is visible
    showChat (visible, not isChatInputBlocked ()) -- toggle inputBlocked
end

addCommandHandler("blockchat", toggleInputBlocked)