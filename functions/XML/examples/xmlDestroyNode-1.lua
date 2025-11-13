addEventHandler("onResourceStart", resourceRoot, function()
    xml = xmlLoadFile("test.xml")
    if (not xml) then
        xml = xmlCreateFile("test.xml", "root")
        xmlCreateChild(xml, "node")
        xmlSaveFile(xml)
    end
end)

addCommandHandler("delnode", function(player)
    local node = xmlFindChild(xml, "node", 0)
    if (not node) then
        xmlUnloadFile(xml)
        return
    end
    
    xmlDestroyNode(node)
    xmlSaveFile(xml)
    xmlUnloadFile(xml)
    outputChatBox("You destroyed the node!", player, 0, 255, 0, false)
end)