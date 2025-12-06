function checkClipStatus()
  local obj, veh = getCameraClip()
  outputChatBox("Your camera can" .. (veh and "" or "not") .. "see the vehicle interior at the moment!", 255, 0, 0, false)
  outputChatBox("Your camera can" .. (obj and "" or "not") .. "collide with objects at the moment!", 255, 0, 0, false)
end
addEventHandler("clipstatus",checkClipStatus)