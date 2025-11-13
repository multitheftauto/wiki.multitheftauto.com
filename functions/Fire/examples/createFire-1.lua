local function burn(commandName, theSize)
   if tonumber(theSize) then
        local x, y, z = getElementPosition(getLocalPlayer())
        createFire(x, y, z, tonumber(theSize))
        outputChatBox("Burn, buuuuurn >:]")
   else
        outputChatBox("Syntax: /fire <size>")
   end
end
addCommandHandler("fire", burn)