for position, codepoint in utf8.next, "utf8-string" do
    print( "Codepoint @ ".. position .." = ".. codepoint )
end

for position, codepoint in utf8.next, "Как" do
    print( "Codepoint @ ".. position .." = ".. codepoint )
end