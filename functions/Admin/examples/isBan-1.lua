local function banRecieve(ban)
    if (ban and isBan(ban)) then
        outputChatBox("this is a ban!", root) -- Valid ban is recieved!
    else
        outputChatBox("this is not a ban, this is a " .. getElementType(ban), root) -- if the argument is not a ban, then checks its type and output it into the chat box.
    end
end

local function onBan(ban) -- This function will be triggered every time a player is banned.
    banRecieve(ban)
end
addEventHandler("onPlayerBan", root, onBan)

local function sendWrongBanArguement()
    local vehicle = createVehicle(411, 0, 5, 3)
    local object = createObject(2600, 0, 0, 0)
    local ped = createPed(61, 0, 0, 3)

    banRecieve(vehicle) -- sends a vehicle as an argument.
    banRecieve(object) -- sends an object as an argument.
    banRecieve(ped) -- sends a ped as an argument.
end
addCommandHandler("sendWrongArgument", sendWrongBanArguement)
