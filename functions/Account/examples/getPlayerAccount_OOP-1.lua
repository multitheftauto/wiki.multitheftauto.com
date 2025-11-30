function setMoney(thePlayer, key, amount)
    local account = thePlayer.account
    if (account and tonumber(amount)) then
        thePlayer.money = amount
        account:setData("money", amount)
    end
end
addCommandHandler("setmoney", setMoney)
