--relational operators: > < >= <= == ~=
--logical operators: and or not

age = 13

if age < 16 then
	io.write("You can go to school\n")
	local localVar = 10
elseif (age <= 16) and (age < 18) then
	io.write("You can drive!\n")
else
	io.write("You can vote\n")
end

print(localVar)

if (age < 14) or (age > 67) then io.write("You shouldn't work", "\n") end

print(string.format( "Not true = %s", tostring( not true ) ))

--ternary operator does not exist in lua but there are work arounds
canvote  = age > 18 and true or false --canvote = age > 18 ? true: false

io.write("Can I vote: ", tostring( canvote) )