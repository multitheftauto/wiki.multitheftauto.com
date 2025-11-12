function copyDataOnLogin ( previousAccount, currentAccount )
  copyAccountData ( currentAccount, previousAccount )
end
addEventHandler ( "onPlayerLogin", getRootElement(), copyDataOnLogin )