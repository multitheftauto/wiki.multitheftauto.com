function Health(player, command, amount)
    player.health = tonumber(amount)
end
addCommandHandler("sethealth", Health)