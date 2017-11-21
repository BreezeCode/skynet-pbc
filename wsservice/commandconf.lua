--
-- Author: QingFengliu
-- Date: 2017-11-21 18:55:43
--
local skynet = require "skynet"

local cmd_conf_arr = {
	[2] = "Game.EnterRoomResponse",
}

local CMD = {}

--[[
 通过命令得到协议名称
]]
function CMD.get_proto_name(cmd)
	local name = cmd_conf_arr[cmd]
	if name then
		return name
	else
		skynet.error(string.format("command name:[%s] undefined", cmd))
		return nil
	end
end

skynet.start(function()
    skynet.dispatch("lua", function (_, _, cmd, ...)
        local f = assert(CMD[cmd])
        local ret = f(...)
        print("skynet.pack(ret):", skynet.pack(ret), type(skynet.pack(ret)))
        skynet.ret(skynet.pack(ret))
    end)
end)