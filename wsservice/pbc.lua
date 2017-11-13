--
-- Author: QingFengliu
-- Date: 2017-11-12 16:07:08
--
local skynet = require "skynet"
require "skynet.manager"
local utils = require "utils"
local protobuf = require "protobuf"

local pb_files = {
    "./proto/pbhead.pb",
    "./proto/pblogin.pb",
    "./proto/game.pb",
}

local cmd = {}

function cmd.init()
    for _,v in ipairs(pb_files) do
        utils.print(protobuf.register_file(v))
    end
end

function cmd.encode(msg_name, msg)
    skynet.error("encode-name:"..msg_name)
    return protobuf.encode(msg_name, msg)
end

function cmd.decode(msg_name, data)
    skynet.error("decode ".. msg_name.. " " .. type(data) .." " .. #data)
    return protobuf.decode(msg_name, data)
end

--[[
test method
]]
function cmd.test()
    skynet.error("pbc test...")
    local msg = {seat=1, player="uuid99999ffff", info="userinfo", status=1, is_online=1, total_score=100}
    local data = protobuf.encode("Game.Player", msg)
    skynet.error("decode ---len"..#(data))
    local de_msg = protobuf.decode("Game.Player", data)
    skynet.error(de_msg.player)
end

skynet.start(function ()
    skynet.error("init pbc...")
    cmd.init()

    skynet.dispatch("lua", function (session, address, command, ...)
        local f = cmd[command]
        if not f then
            skynet.ret(skynet.pack(nil, "Invalid command" .. command))
        end

        if command == "decode" then
            local name
            local buf
            name,buf = ...
            skynet.ret(skynet.pack(cmd.decode(name,buf)))
            return
        end
        local ret = f(...)
            skynet.ret(skynet.pack(ret))
    end)
end)
