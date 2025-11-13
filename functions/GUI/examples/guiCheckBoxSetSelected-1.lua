checkedBox = guiCreateCheckBox(20,30,150,20,"Checked checkbox",true,false)
uncheckedBox = guiCreateCheckBox(20,30,150,20,"UnChecked checkbox",false,false)

if(guiCheckBoxGetSelected(checkedBox))then
	guiCheckBoxSetSelected(uncheckedBox,true)
else
	guiCheckBoxSetSelected(checkedBox,true)
end