--[[
    pb数据的序列化与反序列化
    Created by qingfengliu on 2017/11/16.
]]

local utils = require "utils"
local skynet = require "skynet"
local retcode = require "retcode"

local _M = {}

function _M.pack(cmd, name, msg)
    local data = skynet.call(_M.pbc, "lua", "encode", name, msg)
    local len = #data
    local pack = string.pack(">i4i4c"..len, len + 8, cmd, data)
    return pack
end

function _M.unpack(name, data)
    local size, cmd = string.unpack(">i4i4", data)
    local body = string.unpack(">c"..(size - 8), data, 9)
    local msg = skynet.call(_M.pbc, "lua", "decode", name, body)
    return cmd, msg
end

return _M