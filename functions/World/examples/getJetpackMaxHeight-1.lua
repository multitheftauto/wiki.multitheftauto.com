function commandGetJetpackMaxHeight()
   local height = getJetpackMaxHeight() or "N/A"
   outputChatBox("Jetpack max height: "..height, 0, 255, 0)
end
addCommandHandler("jetpackmaxheight", commandGetJetpackMaxHeight)