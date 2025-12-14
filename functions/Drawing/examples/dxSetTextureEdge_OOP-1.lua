local renderTarget1 = DxScreenSource(300, 300)
renderTarget1:setEdge("wrap")
local renderTarget2 = DxScreenSource(300, 300)
renderTarget2:setEdge("mirror")
local renderTarget3 = DxScreenSource(300, 300)
renderTarget3:setEdge("clamp")
local renderTarget4 = DxScreenSource(300, 300)
renderTarget4:setEdge("border", tocolor(255, 0, 0))

addEventHandler("onClientRender", root, function()
    -- Update the screen sources
    renderTarget1:update()
    renderTarget2:update()
    renderTarget3:update()
    renderTarget4:update()

    -- Draw screen sources in different modes
    dxDrawImageSection(20, 200, 300, 300, -50, 0, 100, 100, renderTarget1)
    dxDrawImageSection(350, 200, 300, 300, -50, 0, 100, 100, renderTarget2)
    dxDrawImageSection(680, 200, 300, 300, -50, 0, 100, 100, renderTarget3)
    dxDrawImageSection(1010, 200, 300, 300, -50, 0, 100, 100, renderTarget4)
end)
