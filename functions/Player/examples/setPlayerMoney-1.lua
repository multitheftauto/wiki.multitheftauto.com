function setCash(thePlayer, command, amount)       -- when the setcash function is called
    setPlayerMoney(thePlayer, tonumber(amount))    -- change player's money to the desired amount
end
addCommandHandler("setcash", setCash)           -- add a command handler for setcash