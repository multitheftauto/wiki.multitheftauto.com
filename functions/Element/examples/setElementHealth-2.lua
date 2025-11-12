function Health(player, command, amount)
    setElementHealth(player, tonumber(amount))
end
addCommandHandler("set", Health)