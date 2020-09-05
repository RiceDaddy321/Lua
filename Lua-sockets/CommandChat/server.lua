udp = socket.udp()
udp:setsockname('*', 12345)
udp:settimeout(0)

local exit_message = "Ight girl, i'll see you tomorrow."
repeat
	local close = false

	--receive information from the client
	data, msg_or_ip, port_or_nil = udp:receivefrom()
	--print message
	if data then
		print(data)

		print("Enter a message: ")
		local message = io.read()
		if (message == "exit") then
			close = true
			udp:sendto(tostring(exit_message), msg_or_ip, port_or_nil)
		else
			udp:sendto(tostring(message), msg_or_ip, port_or_nil)
		end
	end

until close
