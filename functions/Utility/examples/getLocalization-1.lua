local msg = {cs = "Vítejte", fr = "Accueil", de = "Willkommen", pl = "Powitanie", hu = "Üdv"}

addEventHandler("onClientResourceStart", resourceRoot, 
	function ()
		local languageCode = getLocalization()["code"]
		if msg[languageCode] then --Check if the message is avaible in client's language
			outputChatBox(msg[languageCode] .. "!") --Output it
		else
			outputChatBox("Welcome!") --Output English for any other language
		end
	end)