function check()
	local r1, g1, b1, r2, g2, b2 = getSkyGradient()
	outputChatBox("Sky gradient colors are R: "..r1.." G: "..g1.." B: "..b1.." and R: "..r2.." G: "..g2.." B: "..b2)
end
addCommandHandler("skygradient", check)