local pLabel = GuiLabel(0.5, 0.5, 0.5, 0.5, 'Text', true)
pLabel:setColor(0, 255, 0)

addCommandHandler('get_color_label', function()
    local iR, iG, iB = pLabel:getColor()
    outputChatBox(('Label color is r = %d, g = %d, b = %d'):format(iR, iG, iB)) -- 0, 255, 0
end)
