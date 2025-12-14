local font = DxFont('myfont.ttf', 20, false, 'proof') or 'default' -- fallback to default

addEventHandler('onClientRender', root, function()
    dxDrawText('Example Text', 100, 350, 300, 350, tocolor(255, 255, 0), 1, font)
end)