addCommandHandler('policecount', function(player, cmd)
    local accounts = getAccountsByData('rpg.job', 'police-officer')
    outputChatBox('There are '..#accounts..' police officers working in the police', player)
end)