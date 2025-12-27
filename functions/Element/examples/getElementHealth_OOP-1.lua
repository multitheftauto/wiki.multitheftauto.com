local function isPlayerInjured(player)
    if (not player) then
        return
    end

    local hp = player.health
    return hp < 100
end

local plr = Player("Bob")
print(isPlayerInjured(plr))