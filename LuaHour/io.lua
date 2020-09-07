-- Different ways to work with files
-- r: Read only (default)
-- w: Overwrite or create new file
-- a: append or create new file
-- r+: read & write existing file
-- w+: Overwrite read or create a file
-- a+: Append or create new file

file = io.open("Test.lua", "w+")

file:write("Random string of text\n")
file:write("Some more text\n")

file:seek("set", 0) --go back to the beginning of the file

print(file:read("*a"))
file:close()

file = io.open("Test.lua", "a+")

file:write("Even more text")

file:seek("set", 0)

print(file:read("*a"))

file:close()