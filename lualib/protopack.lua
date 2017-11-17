--[[
    pb数据的序列化与反序列化
    Created by qingfengliu on 2017/11/16.
]]

local utils = require "utils"
local skynet = require "skynet"
local retcode = require "retcode"

local M = {}

function M.pack(ret, name, msg)
    --pb协议头
    local ret = ret or 0
    local msg_head = {
        msgtype = 2,
        msgname = name,
        msgret = ret
    }
    local buf_head = skynet.call(M.pbc, "lua", "encode", "PbHead.MsgHead", msg_head)

    print("+++++++++++++++pack")
    utils.print(msg_head)
    utils.print(msg)

    --pb协议数据
    local len
    local pack
    if ret == 0 then
        local buf_body = skynet.call(M.pbc, "lua", "encode", name, msg)
        len = 2 + #buf_head + 2 + #buf_body + 1
        pack = string.pack(">Hs2s2c1", len, buf_head, buf_body, 't')
    else
        --返回码不为0时，只下发pb协议头
        len = 2 + #buf_head + 1
        pack = string.pack(">Hs2s1", len, buf_head, 't')
    end
    return pack
end

function M.pack(cmd, name, msg)
    local data = skynet.call(M.pbc, "lua", "encode", name, msg)
    local len = #data
    local pack = string.pack(">i4i4c"..len, len + 8, cmd, data)
    return pack
end

function M.unpack(name, data)
    print("---------------unpack")
    local size, cmd = string.unpack(">i4i4", data)
    local body = string.unpack(">c"..(size - 8), data, 9)
    local msg = skynet.call(M.pbc, "lua", "decode", name, body)
    return cmd, msg
end

return M