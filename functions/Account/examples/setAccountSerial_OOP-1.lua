-- Advanced example: Administrative command system
local function changePlayerSerial(player, newSerial)
    local account = player.account
    if (account and not account.guest) then
        if (account:setSerial(newSerial)) then
            player:outputChat("Serial number updated successfully!", 0, 255, 0)
            return true
        else
            player:outputChat("Failed to update serial number. Invalid format!", 255, 0, 0)
            return false
        end
    else
        player:outputChat("You must be logged into a registered account.", 255, 0, 0)
        return false
    end
end

-- Command to set a player's account serial
addCommandHandler("setserial", function(player, cmd, targetPlayer, newSerial)
    if (not targetPlayer or not newSerial) then
        player:outputChat("Usage: /setserial <player> <32-char-hex-serial>")
        return
    end

    local target = Player(targetPlayer)
    if (target) then
        if (newSerial:len() == 32 and newSerial:match("^[A-Fa-f0-9]+$")) then
            changePlayerSerial(target, newSerial)
        else
            player:outputChat("Serial must be 32 hexadecimal characters!", 255, 0, 0)
        end
    else
        player:outputChat("Player not found!", 255, 0, 0)
    end
end)
