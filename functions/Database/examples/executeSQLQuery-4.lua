playerName = getPlayerName(thePlayer)
executeSQLQuery("SELECT score,health FROM players WHERE name=?", playerName )
executeSQLQuery("SELECT `score`,`health` FROM `players` WHERE `name`=?", playerName )