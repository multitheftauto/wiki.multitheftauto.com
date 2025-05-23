function garageBoundingBox( _, garageID)
   if not garageID then
      outputChatBox("[Usage] /garage <id>")
      return
   end
   if tonumber(garageID) then
      if tonumber(garageID) > 0 and tonumber(garageID) < 50 then
         local boundingBox = Vector4(getGarageBoundingBox (garageID))
         outputChatBox("West: "..boundingBox.x..", East: " ..boundingBox.y..", South: "..boundingBox.z.." North: "..boundingBox.w)
      else
         outputChatBox("Garage ID must be between 1 and 49")
      end
   end
end
addCommandHandler ("garage",garageBoundingBox)