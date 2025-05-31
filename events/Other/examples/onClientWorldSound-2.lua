local sounds = {}

addEventHandler("onClientWorldSound", root, function(group, index)
	sounds[group.." | "..index] = (sounds[group.." | "..index] or 0) + 1
end)

function cmdSeeSoundList()
	-- Put the non iterated table into an interated table so we can sort them
	local tbl = {}
	for sound, count in pairs(sounds) do
		tbl[#tbl + 1] = {sound, count}
	end
	table.sort(tbl, function(a, b) return a[2] > b[2] end)
	-- Output the table to clipboard
	local str = "Group | Index: Times played\n"
	for i, dat in ipairs(tbl) do
		str = str..dat[1]..": "..dat[2].."\n"
	end
	setClipboard(str)
	outputChatBox("Use CTRL + V in notepad to view the table.")
end
addCommandHandler("seesoundlist", cmdSeeSoundList)