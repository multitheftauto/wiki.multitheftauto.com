-- create an edit box and define it as "editBox".
local editBox = GuiEdit(0.3, 0.1, 0.4, 0.1, "Type your message here!", true)
-- set a maximum text length of 128 characters
editBox.maxLength = 128