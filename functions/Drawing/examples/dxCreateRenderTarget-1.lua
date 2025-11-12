local myRenderTarget

addEventHandler("onClientResourceStart", resourceRoot,
    function()
        myRenderTarget = dxCreateRenderTarget(250, 100, true)       -- Create a render target

        if (myRenderTarget) then 
            updateRenderTarget()     -- Our function to draw to the render target (see below)
        end
    end
)

addEventHandler( "onClientRender", root,
    function()
        if myRenderTarget then
            -- Draw the render target lots of times in different positions on the screen
            dxDrawImage(350, 50, 250, 100, myRenderTarget)
            dxDrawImage(450, 380, 250, 100, myRenderTarget)
            dxDrawImage(550, 250, 250, 100, myRenderTarget)
            dxDrawImage(650, 70, 250, 100, myRenderTarget)
        end
    end
)

function updateRenderTarget()
    dxSetRenderTarget(myRenderTarget, true)
    dxSetBlendMode("modulate_add")  -- Set 'modulate_add' when drawing stuff on the render target

    dxDrawText("Hello " .. getTickCount(), 10, 10, 0, 0, tocolor(255, 255, 255, 255), 2, "clear")        -- Draw a message
    dxDrawRectangle(10, 50, 40, 40, tocolor(math.random(255), math.random(255), math.random(255)))       -- Draw a square with random color

    -- ... etc, imagine you have a lot of dxDraw* calls to make, this is where render targets come in handy!

    dxSetBlendMode("blend")  -- Restore default blending
    dxSetRenderTarget()      -- Restore default render target
end

-- We can even update the render target on the fly, by binding it to a key
bindKey("r", "down", updateRenderTarget)