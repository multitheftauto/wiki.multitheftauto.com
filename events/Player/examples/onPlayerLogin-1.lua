addEventHandler("onPlayerLogin", root,
  function()
    outputChatBox(getPlayerName(source).." has logged in!", root)
  end
)