local myRenderTarget = dxCreateRenderTarget(500, 500, true)

--
-- Function to draw text to our render target texture when the 'r' key is pressed
--
function updateRenderTarget()
    dxSetRenderTarget(myRenderTarget, true)
    dxSetBlendMode("modulate_add") -- Set 'modulate_add' when drawing stuff on the render target

    dxDrawText("Testing " .. getTickCount(), 0, 0, 0, 0, tocolor(255, 255, 255, 255), 2, "clear")

    dxSetBlendMode("blend") -- Restore default blending
    dxSetRenderTarget() -- Restore default render target
end
bindKey("r", "down", updateRenderTarget)

--
-- Display render target contents
--
addEventHandler("onClientRender", root, function()
    dxSetBlendMode("add") -- Set 'add' when drawing the render target on the screen
    dxDrawImage(100, 200, 500, 500, myRenderTarget, -10)
    dxSetBlendMode("blend") -- Restore default blending
end)
