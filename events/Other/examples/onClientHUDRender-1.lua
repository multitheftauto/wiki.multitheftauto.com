local render_count = 0

addEventHandler("onClientHUDRender", root, function()
	render_count = render_count + 1
end)

addEventHandler("onClientRender", root, function()
	render_count = render_count - 1
end)

addCommandHandler("getLossFrames", function()
	outputChatBox("Loss: "..render_count)
	outputDebugString("Loss: "..render_count, 3, 255, 0, 0)
end)