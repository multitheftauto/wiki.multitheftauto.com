local screenSize = Vector2(guiGetScreenSize())
local BOX_SIZE = Vector2(300, 100)
local LINE_SIZE = Vector2(BOX_SIZE.x, 10)
local BOX_POSITION = screenSize / 2 - BOX_SIZE / 2
local TITLE_POSITION = BOX_POSITION + Vector2(8, 8)
local ARTIST_POSITION = BOX_POSITION + Vector2(8, 32)

local sound

addCommandHandler("playsound", function ()
    if isElement(sound) then
        sound:destroy()
    end
    sound = Sound("https://example.com/song.mp3")
end)

addCommandHandler("stopsound", function ()
    if isElement(sound) then
        sound:destroy()
    end
end)

addEventHandler("onClientRender", root, function ()
    if isElement(sound) then
        local soundLength = sound.length
        local soundPosition = sound.playbackPosition
        local soundBufferLength = sound.bufferLength

        local meta = sound:getMetaTags()

        dxDrawRectangle(BOX_POSITION, BOX_SIZE, tocolor(20, 20, 20, 255), false, false)

        if meta.title then
            dxDrawText(meta.title, TITLE_POSITION, 0, 0, tocolor(255, 255, 255, 255), 1.5, 1.5, "clear")
        end
        if meta.artist then
            dxDrawText(meta.artist, ARTIST_POSITION, 0, 0, tocolor(255, 255, 255, 255), 1.0, 1.0, "clear")
        end

        dxDrawText(("%d:%02d"):format(soundPosition / 60, soundPosition % 60), BOX_POSITION + Vector2(8, BOX_SIZE.y - 32), BOX_POSITION + BOX_SIZE - Vector2(8, 0), tocolor(255, 255, 255, 255), 1.0, 1.0, "clear", "left", "top")
        dxDrawText(("%d:%02d"):format(soundLength / 60, soundLength % 60), BOX_POSITION + Vector2(8, BOX_SIZE.y - 32), BOX_POSITION + BOX_SIZE - Vector2(8, 0), tocolor(255, 255, 255, 255), 1.0, 1.0, "clear", "right", "top")
        
        -- draw seek bar
        local linePosition = Vector2(BOX_POSITION.x, BOX_POSITION.y + BOX_SIZE.y - LINE_SIZE.y)
        dxDrawRectangle(linePosition, LINE_SIZE, tocolor(255, 255, 255, 128), false, false)

        -- draw buffer length
        if soundBufferLength then
            dxDrawRectangle(linePosition, Vector2(LINE_SIZE.x * (soundBufferLength / soundLength), LINE_SIZE.y), tocolor(255, 255, 255, 96), false, false)
        end
        -- draw current position
        dxDrawRectangle(linePosition, Vector2(LINE_SIZE.x * (soundPosition / soundLength), LINE_SIZE.y), tocolor(255, 255, 255, 255), false, false)
    end
end)