--Setup some tables

shotguns = {
      "chrome",
      "sawn-off",
      "combat"
}

machineGun = {
      "m4",
      "ak-47"
}

function setupWeaponSelection ( theResource )
      -- getResourceRootElement(getThisResource()) at the bottom means it will only create the gui on this resource start
      -- Create a window for our spawnscreen, with the title "Select your weapons".
      spawnScreenMenu = guiCreateWindow ( 0.15, 0.33, 0.7, 0.34, "Select your weapons", true )
      -- create an OK button to allow the user to confirm their selections, and attach it to the confirmSelection function
      spawnScreenOKButton = guiCreateButton ( 0.4, 0.85, 0.20, 0.15, "OK", true, spawnScreenMenu )
      -- ensure the user can't move or resize our spawnscreen.
      guiWindowSetMovable ( spawnScreenMenu, false )
      guiWindowSetSizable ( spawnScreenMenu, false )
      -- create our gridlist, which fills up most of the window.
      spawnScreenGridList = guiCreateGridList ( 0, 0.1, 1, 0.9, true, spawnScreenMenu )
      guiGridListSetSelectionMode ( spawnScreenGridList, 2 ) -- ensure the selection mode is one per column
      -- Since we have 2 sets of weapons, create a column for shotguns and one for machine guns
      guiGridListAddColumn ( spawnScreenGridList, "Shotguns", 0.3 )
      guiGridListAddColumn ( spawnScreenGridList, "Machine guns", 0.3 )
      -- next, we loop through our handguns table to add handgun items to the gridlist
      for key,weaponName in pairs(shotguns) do
            -- add a new row to our gridlist each time
            local row = guiGridListAddRow ( spawnScreenGridList )
            -- next, we set that row's text to the weapon name. Column is 1 since the "Shotguns" column was created first.
            guiGridListSetItemText ( spawnScreenGridList, row, 1, weaponName, false, false )
      end
      -- we repeat the process for other weapon list, changing the column number
      row = 0
      for key,weaponName in pairs(machineGun) do
            -- we don't need to create new rows as that was done in the previous loop
            -- we just set the row's text to the weapon name. Column is 2 since the "Machine guns" column was created second.
            guiGridListSetItemText ( spawnScreenGridList, row, 2, weaponName, false, false )
            row = row + 1 -- increase the row number
      end
end
addEventHandler ( "onClientResourceStart", getResourceRootElement(getThisResource()), setupWeaponSelection )