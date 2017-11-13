--
-- Author: QingFengliu
-- Date: 2017-11-12 10:21:57
--
local skynet = require "skynet"

local max_client = 10240

skynet.start(function()
    skynet.error("Server start")

    local watchdog = skynet.uniqueservice("watchdog")

    skynet.exit()
end)