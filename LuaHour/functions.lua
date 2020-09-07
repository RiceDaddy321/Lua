function getSum(num1, num2)
	return num1 + num2
end

print(string.format( "5 + 2 = %d", getSum(5,2)))

function split_string(theString)
	stringTable = {}

	local i = 1

	for word in string.gmatch( theString, "[^%s]+" ) do --capturing characters until we reach a space
		stringTable[i] = word
		i = i+1
	end

	return stringTable, i
end

splitStringTable, numOfStr = split_string("The Turtle")

for j = 1, numOfStr-1 do
	print(string.format("%d : %s", j, splitStringTable[j]))
end