function isLocalPlayerActive ()
   if isMainMenuActive() then
      setElementData(getLocalPlayer(),"status","afk")
   else
      setElementData(getLocalPlayer(),"status","playing")
   end
end