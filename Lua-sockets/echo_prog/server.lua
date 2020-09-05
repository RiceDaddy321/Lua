--load namespace
local socket = require("socket")
--create the socket and bind it the localhost to any port
local server = assert(socket.bind("*", 12345))
--give the client time to respond
  server:settimeout(0)
--print the happenings
print("after connecting, you have 10 seconds to give me your social!")

--loop until we got a response from the client. give them 3 chances to connect
local i = 0
while i < 3 do
    --wait for a connection with the client
    if i>0 then 
        print(string.format( "attempt %s of connection. You have 10 seconds to respond\n", i+1))        
    end
    
    local client, con_err = server:accept()
   
    --print error if they don't respond in the alloted time
    if client == nil then
        print(con_err .. "\n")
    else
        --receive their social
        local line, err = client:receive()
        --if no errors then, send or do something
        if not err then client:send(tostring(line) .. "\n") end
        --done with the client so ghost them
        client:close()
        break
    end
    if i==2 then
        print("Could not connect to a client.\n")
    end
    i = i + 1
end

