-- make the function
function moneyCmd(player, commandName, amount)
    if getElementData(player, "canUseMoneyFunctions") then -- the shared logic
        if commandName == "givemoney" then
            amount  = tonumber(amount)
            if amount then
                givePlayerMoney(player, amount)
            else
                outputChatBox("[usage] /givemoney [amount]", player)
            end
        else if commandName == "takemoney" then
            amount = tonumber(amount)
            if amount then
                takePlayerMoney(player, amount)
            else
                outputChatBox("[usage] /takemoney [amount]", player)
            end
        end
    else
        outputChatBox("You aren't able to use this command", player)
    end
end
 
addCommandHandler("givemoney", moneyCmd);
addCommandHandler("takemoney", moneyCmd);