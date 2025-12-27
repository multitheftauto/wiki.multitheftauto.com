-- Print a list of all the players attached to the specified element
local Inf = getElementByID("infernus1")
local attachedElements = getAttachedElements(Inf)
if (attachedElements) then -- if we got the table
    local attachedElementsList = "none"
    -- Loop through the table
    for ElementKey, ElementValue in ipairs(attachedElements) do
        -- add their name to the list
        if (getElementType(ElementValue) == "player") then
            if (attachedElementsList == "none") then
                attachedElementsList = getPlayerName(ElementValue)
            else
                attachedElementsList = attachedElementsList .. ", " ..getPlayerName(ElementValue)
            end
        end
    end
    outputConsole("Players attached to the infernus: " .. attachedElementsList)
end
