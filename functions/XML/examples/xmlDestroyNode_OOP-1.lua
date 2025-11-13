addEventHandler("onResourceStart", resourceRoot, function()
    xml = XML.load("test.xml")
    if (not xml) then
        xml = XML("test.xml", "root")
        xml:createChild("node")
        xml:saveFile()
    end
end)

addCommandHandler("delnode", function(player)
    local node = xml:findChild("node", 0)
    if (not node) then
        xml:unload()
        return
    end
    
    node:destroy()
    xml:saveFile()
    xml:unload()
    player:outputChat("You destroyed the node!", 0, 255, 0, false)
end)