local CMD_INTERVAL        = 200 --// The interval that needs to pass before the player can execute another cmd
local KICK_AFTER_INTERVAL = 50  --// Kick the player if they execute more than 20 cmds/sec

local executions = setmetatable({}, { --// Metatable for non-existing indexes
    __index = function(t, player)
        return getTickCount()-CMD_INTERVAL
    end
})

addEventHandler("onPlayerCommand", root,
    function()
        if (executions[source]-getTickCount()<=CMD_INTERVAL) then
            if (executions[source]-getTickCount()<=KICK_AFTER_INTERVAL) then 
                kickPlayer(source, "Anti-Flood", "Don't flood")
            end 
            cancelEvent()
        end
        executions[source] = getTickCount()
    end
)