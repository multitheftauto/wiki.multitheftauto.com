playerName = getPlayerName(thePlayer)
colorName = "Blue"
soundName = "sound.mp3"
executeSQLQuery("UPDATE players SET color='green',sound='somehead' WHERE name=?", playerName )
executeSQLQuery("UPDATE players SET color=?,sound=? WHERE name=?", colorName, soundName, playerName )
executeSQLQuery("UPDATE `players` SET `color`=?,`sound`=? WHERE `name`=?", colorName, soundName, playerName )