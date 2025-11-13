g_Players = getElementsByType("player")        -- get a list of all players in the server
for i,aPlayer in ipairs(g_Players) do          -- find out what index the local player has in the list
    if aPlayer == localPlayer then
        g_CurrentSpectated = i
        break
    end
end

function spectatePrevious()                    -- decrement the spectate index and spectate the corresponding player
     if g_CurrentSpectated == 1 then
         g_CurrentSpectated = #g_Players
     else
         g_CurrentSpectated = g_CurrentSpectated - 1
     end
    setCameraTarget(g_Players[g_CurrentSpectated])
end

function spectateNext()                        -- increment the spectate index and spectate the corresponding player
     if g_CurrentSpectated == #g_Players then
         g_CurrentSpectated = 1
     else
         g_CurrentSpectated = g_CurrentSpectated + 1
     end
    setCameraTarget(g_Players[g_CurrentSpectated])
end

-- Bind above functions to arrow keys
bindKey("arrow_l", "down", spectatePrevious)
bindKey("arrow_r", "down", spectateNext)