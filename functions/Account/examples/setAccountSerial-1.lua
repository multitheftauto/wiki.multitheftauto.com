-- Advanced example: Administrative command system
local function changePlayerSerial(player, newSerial)
    local account = getPlayerAccount(player)
    if (account and not isGuestAccount(account)) then
        if (setAccountSerial(account, newSerial)) then
            outputChatBox("Serial number updated successfully!", player, 0, 255, 0)
            return true
        else
            outputChatBox("Failed to update serial number. Invalid format!", player, 255, 0, 0)
            return false
        end
    else
        outputChatBox("You must be logged into a registered account.", player, 255, 0, 0)
        return false
    end
end

-- Command to set a player's account serial
addCommandHandler("setserial", function(player, cmd, targetPlayer, newSerial)
    if (not targetPlayer or not newSerial) then
        outputChatBox("Usage: /setserial <player> <32-char-hex-serial>", player)
        return
    end
    
    local target = getPlayerFromName(targetPlayer)
    if (target) then
        if (string.len(newSerial) == 32 and string.match(newSerial, "^[A-Fa-f0-9]+$")) then
            changePlayerSerial(target, newSerial)
        else
            outputChatBox("Serial must be 32 hexadecimal characters!", player, 255, 0, 0)
        end
    else
        outputChatBox("Player not found!", player, 255, 0, 0)
    end
end)