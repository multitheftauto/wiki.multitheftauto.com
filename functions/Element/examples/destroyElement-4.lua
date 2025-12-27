function allvehiclesaredoomed()
    -- get a table of all the vehicles that exist and loop through it
    local vehicles = getElementsByType("vehicle")
    for i, v in ipairs(vehicles) do
        -- destroy every vehicle.
        destroyElement(v)
    end
end
-- The command handler below will destroy all vehicles once
-- you enter /vdoom in the chat box or vdoom in the game console.
addCommandHandler("vdoom", allvehiclesaredoomed)
-- This is very useful if you use the freeroam resource and some
-- heartless players start spawn spamming.
-- You can also set it on a timer to have your server clear all
-- vehicles ever 60 minutes, (1 hour).  Timer below:
setTimer(allvehiclesaredoomed, 3600000, 0)
