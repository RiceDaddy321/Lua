function getSumMore(...)
	local sum = 0

	for k, v in pairs{...} do
		sum = sum + v
	end
	return sum
end

io.write("Sum ", getSumMore(1,2,3,4,5,6,7,8,9), "\n")

doubleIt = function(x) return x * 2 end

print(doubleIt(4))

--closure: function that can access local varibale of a closing function
function outerFunc()
	local i = 0

	return function()
		i = i+1
		return i
	end
end

getI = outerFunc()

print(getI())
print(getI())