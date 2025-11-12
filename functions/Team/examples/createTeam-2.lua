function createTeamsOnStart()
    teamAdmmin = createTeam("Admin", 0, 255, 0) -- change the 3 numbers(0,255,0), the first number is ColourR, the second is ColourG, and the last one is ColourB
    teamFreeroamers = createTeam("Freeroamer", 200, 0, 100)
end
addEventHandler("onResourceStart", resourceRoot, createTeamsOnStart) -- we attach the function to this resource's root element