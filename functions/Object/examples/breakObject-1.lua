addCommandHandler("createObj",
function(command, id)
    local x, y, z = getElementPosition(localPlayer)
    local object = createObject (id, x, y, z)
    if (id) then
        if isObjectBreakable(object) then
            breakObject(object)
        end
    end
end
)