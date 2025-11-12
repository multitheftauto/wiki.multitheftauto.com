playerName = getPlayerName(thePlayer)
executeSQLQuery("DELETE FROM players WHERE name=?", playerName)
executeSQLQuery("DELETE FROM `players` WHERE `name`=?", playerName)