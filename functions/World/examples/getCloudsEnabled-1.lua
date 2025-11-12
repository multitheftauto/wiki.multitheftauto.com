function areCloudsVisible()
  if getCloudsEnabled() then
    outputChatBox("Clouds are visible.")
  else
    outputChatBox("Clouds are not visible.")
  end
end
addCommandHandler("clouds", areCloudsVisible)