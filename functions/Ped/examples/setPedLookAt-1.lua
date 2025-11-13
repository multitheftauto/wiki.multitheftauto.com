local screenSize_X, screenSize_Y = guiGetScreenSize()

function pedLookAt()
   local x, y, z = getWorldFromScreenPosition(screenSize_X / 2, screenSize_Y / 2, 15)
   setPedLookAt(localPlayer, x, y, z, -1, 0)
end
setTimer(pedLookAt, 120, 0)