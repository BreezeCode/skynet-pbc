--
-- Author: QingFengliu
-- Date: 2017-11-12 10:23:08
--
local skynet = require "skynet"
local httpd = require "http.httpd"
local websocket = require "websocket"
local socket = require "socket"
local protopack = require "protopack"
local sockethelper = require "http.sockethelper"

local pbc

local handler = {}

function handler.on_open(ws)
    skynet.error(string.format("Client connected: %s", ws.addr))
    --ws:send_text("Hello websocket !")
end

function handler.on_message(ws, msg)
    skynet.error("Received a message from client:\n"..msg)
    --ws:send_text(msg);

    local entroom = {
        code=1, room_id=888888, owner="aa", kwargs="{\"firstName\":\"John\", \"lastName\":\"Doe\" }", rest_cards=8,
        player = {{seat=1, player="玩家信息", info="dd", status=1, is_online=1, total_score=111}},
        owner_info="ee"
    }
    
    --序列化
    local pack = protopack.pack(2, "Game.EnterRoomResponse", entroom)

    --反序列化
    local _cmd, _msg = protopack.unpack("Game.EnterRoomResponse", pack)
    print("unpack:", _cmd, _msg.player[1].player)
    

    ws:send_binary(pack)
end

function handler.on_error(ws, msg)
    skynet.error("Error. Client may be force closed.")
    -- do not need close.
    -- ws:close()
end

function handler.on_close(ws, code, reason)
    skynet.error(string.format("Client disconnected: %s", ws.addr))
    -- do not need close.
    -- ws:close
end

local function handle_socket(fd, addr)
    -- limit request body size to 8192 (you can pass nil to unlimit)
    local code, url, method, header, body = httpd.read_request(sockethelper.readfunc(fd), 8192)
    if code then
        if url == "/ws" or true then
            local ws = websocket.new(fd, addr, header, handler)
            ws:start()
        end
    end
end

skynet.start(function()
    local fd = assert(socket.listen("0.0.0.0:6001"))
    socket.start(fd , function(fd, addr)
        socket.start(fd)
        pcall(handle_socket, fd, addr)
    end)
    skynet.newservice("debug_console", "0.0.0.0", 6000)


    pbc = skynet.uniqueservice("pbc")
    protopack.pbc = pbc

end)





