--
-- Author: QingFengliu
-- Date: 2017-11-12 14:49:20
--
local skynet = require "skynet"
local utils = require "utils"
local crypt = require "crypt"

local funs = {}
local login
local agentmgr
local roommgr

local handler_arr = {
    [1] = function(...) funs.enter_room_req(...) end,
}

--------------------------------------------------------------------------------

--登录
function funs.enter_room_req(fd, msg)
    skynet.error(string.format("enter_room_req roomid:%s player:%s info:%s", msg.room_id, msg.player, msg.info))
    --返回数据
    local entroom = {
        code=1, room_id=888888, owner="aa", kwargs="{\"firstName\":\"John\", \"lastName\":\"Doe\" }", rest_cards=8,
        player = {{seat=1, player="这是返回的信息", info="{\"data\":\"datastr\"}", status=1, is_online=1, total_score=111}},
        owner_info="{\"data\":\"datastr\"}"
    }

    skynet.send("watchdog", "lua", "send", fd, 2,  entroom)
end

--------------------------------------------------------------------------------

local CMD = {}

function CMD.init()
    --login = skynet.uniqueservice("login")
    --roommgr = skynet.uniqueservice("roommgr")
    --agentmgr = skynet.uniqueservice("agentmgr")
end

--根据协议名，调用对用处理函数
function CMD.handle(fd, cmd, msg)
    skynet.error("sockethandler cmd:"..cmd)
    local f = handler_arr[cmd]
    f(fd, msg)
end

--------------------------------------------------------------------------------

skynet.start(function()
    CMD.init()
    skynet.dispatch("lua", function(_, _, cmd, ...)
        local f = CMD[cmd]
        if f then
            f(...)
        else
            log.log("service_clienthandler invalid_cmd %s", cmd)
        end
    end)
end)