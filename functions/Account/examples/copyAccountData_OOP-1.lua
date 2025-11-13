function copyDataOnLogin ( previousAccount, currentAccount )
    previousAccount:copyDataTo(currentAccount)
end
addEventHandler ( "onPlayerLogin", getRootElement(), copyDataOnLogin )