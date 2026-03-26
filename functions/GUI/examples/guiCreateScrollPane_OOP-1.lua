local scrollpane

addEventHandler("onClientResourceStart", resourceRoot, function()
    -- create a window and create a scrollpane on it
    local window = GuiWindow(5, 5, 130, 150, "", false)
    -- the width and height values here are largely irrelevant as the scrollpane will automatically resize when needed
    scrollpane = GuiScrollPane(0, 0, 130, 150, false, window)
end)

addCommandHandler("fill", function()
    -- if the scrollpane exists
    if scrollpane then
        -- delete all the existing labels
        for i, v in ipairs(scrollpane:getChildren()) do
            v:destroy()
        end

        -- for every player in the server
        for i, v in ipairs(Element.getAllByType("player")) do
            -- create a label with their name on the scrollpane
            GuiLabel(5, i * 20, 90, 20, v.name, false, scrollpane)
        end
    end
end)
