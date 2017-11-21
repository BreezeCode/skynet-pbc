--[[
    pb数据的序列化与反序列化
    Created by qingfengliu on 2017/11/16.
]]

local utils = require "utils"
local skynet = require "skynet"
local retcode = require "retcode"

local _proto_names = {
    [2] = "Game.EnterRoomResponse",
}

local _M = {}

function _M.getHead(msg)
    local size, cmd = string.unpack(">i4i4", msg)
    return size, cmd
end

function _M.pack(cmd, msg)
    --local p_name = skynet.send(_M.cmdconf, "lua", "get_proto_name", cmd)
    local p_name = _proto_names[cmd]
    --print("p_name111:", skynet.unpack(p_name))
    local data = skynet.call(_M.pbc, "lua", "encode", p_name, msg)
    local len = #data
    local pack = string.pack(">i4i4c"..len, len + 8, cmd, data)
    return pack
end

function _M.unpack(data)
    local size, cmd = string.unpack(">i4i4", data)
    local body = string.unpack(">c"..(size - 8), data, 9)

    --local p_name = skynet.send(_M.cmdconf, "lua", "get_proto_name", cmd)
    local p_name = _proto_names[cmd]
    --print("p_name222:", skynet.unpack(p_name))
    local msg = skynet.call(_M.pbc, "lua", "decode", p_name, body)
    return msg
end

return _M