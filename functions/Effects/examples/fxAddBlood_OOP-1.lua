function BloodonDamage(attacker, weapon, bodypart, loss)
    if loss > 25 then -- if the player loses more than 25 hp, then...
        local x, y, z = source:getPosition() -- get player's position for adding blood
        local randombloodamount = math.random(1, 3) -- random blood amount 1-3
        Effect.addBlood(x, y, z - 2, 0.00000, 0.00000, 0.00000, randombloodamount, 1)
        -- this adds blood to player's current position
    end
end
addEventHandler("onClientPlayerDamage", root, BloodonDamage) -- calls the function when a player loses hp
