addEventHandler("onClientRender", root, function()
    local sectionStartX, sectionStartY = 202, 65
    local sectionWidth, sectionHeight  = 150, 150

    dxDrawImageSection(500, 500, 256, 256, sectionStartX, sectionStartY, sectionWidth, sectionHeight, "example.jpg")
end)