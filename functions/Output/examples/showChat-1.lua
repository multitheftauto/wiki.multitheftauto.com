--This example below is for all versions until 1.4:
local isChatVisible = true --Let's assume the chat is visible as soon as the resource starts.

function chat(key, keyState)
    if isChatVisible then --Check or the chat is visible.
        showChat(false) --If it is, hide it.
        isChatVisible = false
    else
        showChat(true) --If it is not, show it.
        isChatVisible = true
    end
end

bindKey("i", "down", chat) --Make a bind key to start the function as soon as a player presses the key 'i'


--This example below is for version 1.4 and up:
function chat(key, keyState)
    if isChatVisible() then --Check or the chat is visible.
        showChat(false) --If it is, hide it.
    else
        showChat(true) --If it is not, show it.
    end
end

bindKey("i", "down", chat) --Make a bind key to start the function as soon as a player presses the key 'i'