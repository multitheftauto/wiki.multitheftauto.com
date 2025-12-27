local p = Ped(1, 0, 0, 0)

addCommandHandler('getsyncer', function(plr, cmd)
    local syncer = p.syncer

    if (syncer) then
        plr:outputChat("Your syncer of the ped is: "..syncer.name)
    end
end)