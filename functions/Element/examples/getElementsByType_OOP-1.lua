local cjs = 0

for k, v in ipairs(Element.getAllByType('player')) do
    if (v.model == 0) then
        cjs = cjs + 1
    end
end