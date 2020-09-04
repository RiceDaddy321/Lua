io.write("5 + 3 = ", 5+3, "\n")
io.write("5 - 3 = ", 5-3, "\n")
io.write("5 * 3 = ", 5*3, "\n")
io.write("5 / 3 = ", 5/3, "\n")
io.write("5 % 3 = ", 5%3, "\n") --modulus operator

--[[
Math Functions: floor, ceil,
max, min,
cos, sin, tan, asin, acos,
exp, log, log10,
pow, sqrt,
random, randomseed
]]

io.write("Math.random()", math.random(), "\n")
io.write("Math.random(10)", math.random(10), "\n")--range from 1-10
io.write("Math.random(5,100)", math.random(5,100), "\n")--range from 5 to 100

local number = math.randomseed(os.time()) --generates even nicer random numbers

print(string.format("Pi = %.10f", math.pi)) --However floating point numbrs can only have a precision of up to 13 decimal places

for i=1,10 do
	io.write("[", i, "]", "Math.random(10)", math.random(10), "\n")--range from 1-10
end
