--
-- Author: QingFengliu
-- Date: 2017-11-12 10:23:08
--
local skynet = require "skynet"
local httpd = require "http.httpd"
local websocket = require "websocket"
local socket = require "skynet.socket"
local protopack = require "protopack"
local sockethelper = require "http.sockethelper"
require "skynet.manager"

local ws_arr = {}
local cmdconf
local pbc
local socket_handler

local handler = {}

function handler.on_open(ws)
    skynet.error(string.format("Client connected: %s", ws.addr))
    ws_arr[ws.fd] = ws
    --ws:send_text("Hello websocket !")
end

function handler.on_message(ws, buff)
    --半包，全包，粘包处理
    if ws._stick_package_stack then
        buff = ws._stick_package_stack .. buff
        ws._stick_package_stack = nil
    end

    local _size = protopack.getSize(buff)

    local _raw_size = #buff

    if _raw_size > _size then           --至少有一个包
        local _, _cmd = protopack.getHead(buff)

        skynet.error("on_message_cmd:".._cmd)

        local _msg = protopack.unpack(buff)
        skynet.send(socket_handler, "lua", "handle", ws.fd, _cmd, _msg)

        local rest = string.sub(buff, _size)
        handler.on_message(ws, rest)
    elseif _raw_size < _size then      --半包
         ws._stick_package_stack = buff
    elseif _raw_size == _size then     --整包
        local _, _cmd = protopack.getHead(buff)

        skynet.error("on_message_cmd:\n".._cmd)

        local _msg = protopack.unpack(buff)
        skynet.send(socket_handler, "lua", "handle", ws.fd, _cmd, _msg)
    end
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


local CMD = {}
function CMD.send(fd, code, msg)
    local pack = protopack.pack(2, msg)
    ws_arr[fd]:send_binary(pack)
end

skynet.start(function()
    skynet.dispatch("lua", function(_, _, cmd, ...)
        local f = CMD[cmd]
        if f then
            f(...)
        else
            log.log("service_clienthandler invalid_cmd %s", cmd)
        end
    end)


    local fd = assert(socket.listen("0.0.0.0:6001"))
    socket.start(fd , function(fd, addr)
        socket.start(fd)
        pcall(handle_socket, fd, addr)
    end)

    skynet.newservice("console")
    skynet.newservice("debug_console", "0.0.0.0", 6000)

    cmdconf = skynet.uniqueservice("commandconf")

    pbc = skynet.uniqueservice("pbc")
    protopack.pbc = pbc

    socket_handler = skynet.uniqueservice("sockethandler")

    skynet.register("watchdog")
end)





