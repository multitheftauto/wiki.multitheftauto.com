-- this function is called whenever someone types 'createObject' in the console:
function createObjectCommand(thePlayer, commandName)
   if (thePlayer) then
      local x, y, z = getElementPosition(thePlayer)
      -- create a object next to the player:
      local theObject = createObject(980, x + 2, y + 2, z, 0, 0, 0)
      if (theObject) then -- check if the object was created successfully
         outputChatBox("Object created successfully.", thePlayer)
      else
         outputChatBox("Failed to create the object.", thePlayer)
      end
   end
end
addCommandHandler("createobject", createObjectCommand)