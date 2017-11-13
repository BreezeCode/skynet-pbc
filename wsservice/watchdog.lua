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
    ws:send_text("Hello websocket !")
end

function handler.on_message(ws, msg)
    skynet.error("Received a message from client:\n"..msg)
    ws:send_text(msg);

    local MsgLoginRsp = {
        platform = 1,
        user_id = "888888",
        char_id = 1111, 
        char_name = "breeze"
    } 
    local data = protopack.pack(0, "PbLogin.MsgLoginRsp",  MsgLoginRsp)
    skynet.error(data)
    ws:send_text(type(data));
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





