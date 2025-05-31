label = guiCreateLabel ( 0.8, 0.9, 0.2, 0.1, "Radio off", true) --create a label to show the station

function stationDraw(station)
	guiSetText ( label, getRadioChannelName(station)) --Show the station Name
end

addEventHandler("onClientPlayerRadioSwitch", getLocalPlayer(), stationDraw) -- add an event handler