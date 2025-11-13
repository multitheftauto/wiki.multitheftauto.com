function commandResetWindVelocity()
   resetWindVelocity()
   outputChatBox("Wind velocity reset to default", 0, 255, 0)
end
addCommandHandler("resetwindvelocity", commandResetWindVelocity)