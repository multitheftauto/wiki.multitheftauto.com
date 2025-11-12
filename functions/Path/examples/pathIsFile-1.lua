local files = {}

for _,entry in ipairs(pathListDir('.')) do
    if pathIsFile(entry) then
        table.insert(files, entry)
    end
end

iprint('Files:')
for _,file in ipairs(files) do
    iprint(' - '..file)
end