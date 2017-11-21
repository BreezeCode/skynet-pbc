--
-- Author: QingFengliu
-- Date: 2017-11-12 14:49:20
--
local skynet = require "skynet"
local utils = require "utils"

local funs = {}
local login
local agentmgr
local roommgr

local handler_arr = {
    [2] = function(...) funs.enter_room_res(...) end,
}

--------------------------------------------------------------------------------

--登录
function funs.enter_room_res(fd, msg)
   print("enter_room_res------", msg.player[1].player)
   --skynet.send("watchdog", "lua", "socket", "send", fd, 0, "PbLogin.MsgLoginRsp",  MsgLoginRsp)
end

--------------------------------------------------------------------------------

local CMD = {}

function CMD.init()
    --login = skynet.uniqueservice("login")
    --roommgr = skynet.uniqueservice("roommgr")
    --agentmgr = skynet.uniqueservice("agentmgr")
end

--根据协议名，调用对用处理函数
function CMD.handle(fd, msg_id, msg)
    local f = handler_arr[msg_id]
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