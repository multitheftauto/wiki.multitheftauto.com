local scale = textItemGetScale ( theTextItem )  --get the scale of theTextitem and define it as 'scale'
if (scale < 0.5) then --if the scale is smaller than 0.5
	textItemSetScale ( theTextItem, 1.0 ) --then restore it to default size, 1.0.
end