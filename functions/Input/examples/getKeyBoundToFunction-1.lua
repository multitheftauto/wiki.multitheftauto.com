function chat ()
  outputChatBox("Test")
end
bindKey("F2","down",chat)

function key()
  local boundKey = getKeyBoundToFunction(chat)
  outputChatBox(boundKey)
end
addCommandHandler("key",key)