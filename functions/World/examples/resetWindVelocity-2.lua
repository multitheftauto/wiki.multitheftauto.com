function commandResetWindVelocity()
   resetWindVelocity()
   outputChatBox("Wind velocity reset to default", root, 0, 255, 0)
end
addCommandHandler("resetwindvelocity", commandResetWindVelocity)