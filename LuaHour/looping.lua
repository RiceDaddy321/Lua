i = 1

while (i <= 10) do
	io.write( i )
	i = i + 1

	if i == 8 then
		break
	end
end

print("\n")

for i=1, 10, 1 do --iterator, ending value, increment
	print(i)
end

months = {"January", "February", "march", "april", "may", "june", "july", "august", "september", "october",
		  "november", "december"}

for key, value in pairs(months) do
	io.write(value, " ")
end

--continue does not exist

--[[repeat
	io.write("Enter in your guess: ")
	guess = io.read()

until tonumber(guess) == 15
]]