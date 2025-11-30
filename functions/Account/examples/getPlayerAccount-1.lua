function setMoney(thePlayer, key, amount)
    local account = getPlayerAccount(thePlayer)
    if (account and tonumber(amount)) then
        setPlayerMoney(thePlayer, amount)
        setAccountData(account, "money", amount)
    end
end
addCommandHandler("setmoney", setMoney)
