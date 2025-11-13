addEventHandler("onClientPreRender",root,
	function ()
    local block, animation = getPedAnimation(localPlayer)
	dxDrawText ( "CURRENT ANIMATION INFO...", 100, 300 )
	if not block then block = "N/A" end
	if not animation then animation = "N/A" end
	dxDrawText ( "Block = "..block.." Animation = "..animation, 100, 315 )
end )