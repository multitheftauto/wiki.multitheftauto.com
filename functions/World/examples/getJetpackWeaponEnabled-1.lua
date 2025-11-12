addCommandHandler("isJPEnabled",function(ped,_,wep)
	if ped then
		outputChatBox(tostring(getJetpackWeaponEnabled(wep)),ped)
	end
end)