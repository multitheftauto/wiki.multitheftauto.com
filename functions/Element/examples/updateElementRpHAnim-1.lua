addEventHandler("onClientPedsProcessed",root,function()
    for i,v in ipairs(getElementsByType('player',root,true)) do  -- loop all players
        
        -- just an exmaple anim
        setElementBoneRotation(v, 33, 0, 295.2, 0)
        setElementBoneRotation(v, 23, 0, 298.8, 0)
        setElementBoneRotation(v, 4, 0, 46.8, 0)
        setElementBoneRotation(v, 2, 0, 0, 32.4)

        updateElementRpHAnim(v) -- Update ped bones animations

    end 
end)