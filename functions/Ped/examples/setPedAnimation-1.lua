function makePed()
	local thePed = createPed(56, 1, 1, 4, 315)
	setPedAnimation(thePed, "ped", "WOMAN_walknorm")
end
addCommandHandler("makemyped", makePed)