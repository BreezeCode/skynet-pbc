--[[
    pb数据的序列化与反序列化
    Created by qingfengliu on 2017/11/16.
]]

local utils = require "utils"
local skynet = require "skynet"
local retcode = require "retcode"

local app_id = 2
local game_id = 1
local send_id = 0
local ver_1 = 1
local ver_2 = 0
local ver_3 = 0

local _M = {}

function _M.getHead(msg)
    --[[
    local size, cmd = string.unpack(">i4i4", msg)
    return size, cmd
    ]]
    local size, _, _, _, _, _, _, _, cmd = string.unpack(">i4i4hhi4bbbb", msg)
    return size, cmd
end

function _M.pack(cmd, msg)
    --[[
    local p_name = skynet.call("commandconf", "lua", "get_proto_name", cmd)
    local data = skynet.call(_M.pbc, "lua", "encode", p_name, msg)
    local len = #data
    local pack = string.pack(">i4i4c"..len, len + 8, cmd, data)
    return pack
    ]]

    -->iihhibbbb{0}s
    send_id = send_id + 1
    local p_name = skynet.call("commandconf", "lua", "get_proto_name", cmd)
    local data = skynet.call(_M.pbc, "lua", "encode", p_name, msg)
    local len = #data
    local pack = string.pack(">i4i4hhi4bbbbc"..len, len + 20, send_id, app_id, game_id, os.time(), ver_1, ver_2, ver_3, cmd, data)
    return pack
end

function _M.unpack(data)
    --[[
    local size, cmd = string.unpack(">i4i4", data)
    local body = string.unpack(">c"..(size - 8), data, 9)

    local p_name = skynet.call("commandconf", "lua", "get_proto_name", cmd)
    local msg = skynet.call(_M.pbc, "lua", "decode", p_name, body)
    return msg
    ]]
    
    local size, _, _, _, _, _, _, _, cmd = string.unpack(">i4i4hhi4bbbb", data)
    local body = string.unpack(">c"..(size - 20), data, 21)

    local p_name = skynet.call("commandconf", "lua", "get_proto_name", cmd)
    local msg = skynet.call(_M.pbc, "lua", "decode", p_name, body)
    return msg
end

return _M