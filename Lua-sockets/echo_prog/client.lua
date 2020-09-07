local address, port = "localhost", 12345
local socket = require("socket")
local tcp = assert(socket.tcp())
tcp:settimeout(10)

local j = 1

repeat

connected, err = tcp:connect(address, port)

if connected then
    print(string.format( "successfully connected to port: %s address: %s",port, address))
    ip, serv_port = tcp:getpeername()
    print(ip .. "\n" .. serv_port)
    sent_status, msg = tcp:send("hello world\n")
else
    print(string.format( "%s. Attempt %s", err, j))
end

j = j + 1
until (connected)

--to see if the message sends or not
if sent_status ~= nil then
    print("message has been sent")
    print(string.format( "bytes sent: %s\n",sent_status))
else
    print("message was not sent")
    print(string.format( "error message: %s",tostring(msg)))
end

while connected and (sent_status ~= nil) do
    local s, status, partial = tcp:receive()
    print(s or partial)
    if status == "closed" then break end
end
tcp:close()
