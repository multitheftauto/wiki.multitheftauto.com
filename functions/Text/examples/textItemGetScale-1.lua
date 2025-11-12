scale = textItemGetScale ( theTextitem )  -- get the scale of theTextItem and store it in the 'scale' variable
if scale < 0.5 then                       -- if the scale is smaller than 0.5
    textItemSetScale ( theTextItem, 1.0 ) -- then restore it to default size, 1.0.
end