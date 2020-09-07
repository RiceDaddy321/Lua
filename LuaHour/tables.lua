--[[
aTable = {}

for i = 1, 10 do
	aTable[i] = i
end

io.write("First: ", aTable[1], "\n")

io.write("Number of items: ", #aTable, "\n")

table.insert(aTable, 1, 0)

io.write( "First: ", aTable[1], "\n" )

print(table.concat(aTable, ", ")) --how to convert a table into a string

table.remove( aTable, 1 )

io.write( "First: ", aTable[1], "\n" )
]]

aMultitable = {}

for i = 0, 9 do
	aMultitable[i] = {}

	for j = 0, 9 do
		aMultitable[i][j] = tostring(i) .. tostring( j )
	end
end

io.write( "Table[0][0]: ", aMultitable[0][0], "\n" )

for i = 0, 9 do
	for j = 0, 9 do
		io.write(aMultitable[i][j], " : ")
	end
	print()
end