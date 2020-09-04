local socket = require "socket"
local address, port = "localhost", 12345
udp = socket.udp()
udp:setpeername(address, port)
udp:settimeout(0)

local default_message = "Hello"
local exit_message = "Goodbye"
repeat
	local close = false

	--lets send some garbage first
	udp:send(tostring(default_message))
	--receive information from server
	data, msg_orip, port_or_nil = udp:receive()
	print(data)
	--send real data now
	message = io.read()
	if (message == "exit") then
		close = true
		udp:send(tostring(default_message))
	else
		udp:send(tostring(message))
	end

until close