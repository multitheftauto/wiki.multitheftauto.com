function commandGetAircraftMaxHeight()
   local height = getAircraftMaxHeight() or "N/A"
   outputChatBox("Aircraft max height: "..height, 0, 255, 0)
end
addCommandHandler("aircraftmaxheight", commandGetAircraftMaxHeight)