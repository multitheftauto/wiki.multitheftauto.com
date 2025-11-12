local admiral = createVehicle ( 445, 0, 0, 10 )
for i=0, 6 do
    local panel = getVehiclePanelState ( admiral, i )
    outputChatBox ( tostring ( panel ) )
end