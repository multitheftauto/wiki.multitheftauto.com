addEventHandler('onResourceStateChange', root, function(res, oldState, newState)
    iprint('Resource '..getResourceName(res)..' has changed its state from '..oldState..' to '..newState)
end)