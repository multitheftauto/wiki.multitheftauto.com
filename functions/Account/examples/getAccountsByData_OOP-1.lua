addCommandHandler('policecount', function(player, cmd)
    local accounts = Account.getAllByData('rpg.job', 'police-officer')
    player:outputChat('There are '..#accounts..' police officers working in the police')
end)