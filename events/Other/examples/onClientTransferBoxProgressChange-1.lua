addEventHandler ("onClientTransferBoxProgressChange", root, function (downloadedSize, totalSize)
    local percentage = math.min ((downloadedSize / totalSize) * 100, 100)

    print (percentage .. "%")
end)