--
-- Author: QingFengliu
-- Date: 2017-11-12 16:07:08
--
local skynet = require "skynet"
require "skynet.manager"
local utils = require "utils"
local protobuf = require "protobuf"

local pb_files = {
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
    
    --[[
    --简单嵌套
    local cardtip = {card={card=8800}, points=2, rest_cnt=3}
    local data = protobuf.encode("Game.CardTip", cardtip)
    print("encode ---len:"..#(data))
    local de_msg = protobuf.decode("Game.CardTip", data)
    print("decode:"..(de_msg.card.card))
    ]]
    
   --[[
    嵌套list
   ]]
    local entroom = {
        code=1, room_id=888888, owner="aa", kwargs="[]", rest_cards=8,
        player = {{seat=1, player="cc测试一下中文", info="dd", status=1, is_online=1, total_score=111}},
        owner_info="ee"
    }
    local data = protobuf.encode("Game.EnterRoomResponse", entroom)
    print("encode ---len:"..#(data))
    local de_msg = protobuf.decode("Game.EnterRoomResponse", data)
    print("decode:"..(de_msg.player[1].player))
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

    cmd.test()
end)
