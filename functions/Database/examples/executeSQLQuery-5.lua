playerName = getPlayerName(thePlayer)
colorName = "Blue"
soundName = "sound.mp3"
executeSQLQuery("INSERT INTO players(name,color,sound) VALUES(?,?,?)", playerName, colorName, soundName )
executeSQLQuery("INSERT INTO `players`(`name`,`color`,`sound`) VALUES(?,?,?)", playerName, colorName, soundName )