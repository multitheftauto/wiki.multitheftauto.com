function outputLoss(loss)
    local oldHealth = getElementHealth(source)
    setTimer(function(source)
        local newHealth = getElementHealth(source)
        outputChatBox("Real loss: "..(newHealth-oldHealth))
        outputChatBox("Theoretical loss: "..loss)
    end,100,1,source)
end
addEventHandler("onClientObjectDamage", root, outputLoss)