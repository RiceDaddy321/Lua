print("Welcome to First Better Bank of America.\nHow may we serve you today?")
print("[1] Create Account")
print("[2] Access Account")
print("[3] Delete Account")

local file = assert(io.open("Test.txt", "a"))

repeat
    local IsANumber = false

    choice = tonumber(io.read())
    if choice == nil then
        io.stderr:write("Please input a number please: ")
    else
        IsANumber = true
    end
until IsANumber

--function to read in files
function file_exists(file)
    local fh = io.open(file, "rb")
    if fh then fh:close() end
    return fh ~= nil
end

--come back to this later...lmao


local function AccessAccount()
    print("Enter your Account Number: ")
    

    repeat
        local AccNumber = io.read()
        local t = file:read("*all")
        local offset = t:find(AccNumber)

        local IsAString = false

        if offset == nil then
            print("Please enter a valid Account number")
        else    
            IsAString  = true
        end
    until IsAString
end

Accounts = {}
function Choice1()
--Accounts need: Balance, Name, Account Number, Password

--Name 
print("Please Input your first name: ")
local Name = io.read()
print("Please Input your last name: ")
Name = Name .. " " .. io.read()

--Account Number 
BankAccount = math.random(100000000000,999999999999)
print("Your account number is: " .. BankAccount .. ". \nPlease take note of it.")

--Password
repeat
    local Verified = false

    print("Please enter a password: ")
    Password = io.read()
    print("Please re-enter your password to confirm: ")
    local VerifyPassword = io.read()

    if VerifyPassword == Password then
        Verified = true
    else
        print("Passwords do not match.")
    end

until Verified

--Balance
repeat
    local IsANumber = false

    print("Enter your entering balance.")
    Balance = tonumber(io.read())
    if Balance == nil then
        io.stderr:write("Please enter a real number!")
    else
        IsANumber = true
    end
until IsANumber

file:write("Account Number: " .. BankAccount .. "\n")
file:write("Name: " .. Name .. "\n")
file:write("Password: " .. Password .. "\n")
file:write("Balance: " .. Balance .. "\n")
end

function Choice2()
    print("[1] Deposit")
    print("[2] Withdraw")
    print("[3] Check Balance")

    local choice = io.read()

    local function Choice1()
        print("How much would you like to deposit")
    end
end

if choice == 1 then
    Choice1()
elseif choice == 2 then
    AccessAccount()
end

file:close()

---- http://lua-users.org/wiki/FileInputOutput
--
---- see if the file exists
--function file_exists(file)
--    local f = io.open(file, "rb")
--    if f then f:close() end
--    return f ~= nil
--  end
--  
--  -- get all lines from a file, returns an empty 
--  -- list/table if the file does not exist
--  function lines_from(file)
--    if not file_exists(file) then return {} end
--    lines = {}
--    for line in io.lines(file) do 
--      lines[#lines + 1] = line
--    end
--    return lines
--  end
--  
--  -- tests the functions above
--  local file = 'test.lua'
--  local lines = lines_from(file)
--  
--  -- print all line numbers and their contents
--  for k,v in pairs(lines) do
--    print('line[' .. k .. ']', v)
--  end