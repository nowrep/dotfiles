local ffi = require("ffi")

ffi.cdef[[
    int close(int fd);
    int unlink(const char *path);
    int fcntl(int, int, ...);

    struct sockaddr_un {
        unsigned short sun_family;
        char sun_path[108];
    };
    int socket(int domain, int type, int protocol);
    int bind(int socket, const struct sockaddr *address, int address_len);
    int listen(int socket, int backlog);
    int accept(int socket, void *address, void *address_len);
    int recv(int socket, char *buf, int len, int flags);
    int send(int socket, const char *buf, unsigned len, int flags);
]]

local data = {
    socket_filename = "/tmp/obs-control.sock",
    sockfd = -1,
    clientfd = -1
}

function os_socket_block(s, block)
    local F_GETFL = 3
    local F_SETFL = 4
    local O_NONBLOCK = 2048
    local flags = ffi.C.fcntl(s, F_GETFL, 0)
    if flags == -1 then
        return
    end
    if block then
        flags = bit.band(flags, bit.bnot(O_NONBLOCK))
    else
        flags = bit.bor(flags, O_NONBLOCK)
    end
    ffi.C.fcntl(s, F_SETFL, ffi.new("int", flags))
end

function send_reply(reply)
    ffi.C.send(data.clientfd, reply, #reply, 0)
    ffi.C.close(data.clientfd)
    data.clientfd = -1
end

function on_event(event)
    if event == obslua.OBS_FRONTEND_EVENT_REPLAY_BUFFER_SAVED then
        if data.clientfd >= 0 then
            send_reply("replay-saved")
        end
    end
end

function script_tick(seconds)
    if data.clientfd < 0 then
        data.clientfd = ffi.C.accept(data.sockfd, nil, nil)
        if data.clientfd >= 0 then
            os_socket_block(data.clientfd, false)
        end
    end
    if data.clientfd >= 0 then
        local EAGAIN = 11
        local EWOULDBLOCK = EAGAIN
        local buf = ffi.new("char[?]", 128)
        local n = ffi.C.recv(data.clientfd, buf, ffi.sizeof(buf), 0)
        if n == -1 then
            if ffi.errno() == EAGAIN or ffi.errno() == EWOULDBLOCK then
                return
            end
        end
        if n <= 0 then
            ffi.C.close(data.clientfd)
            data.clientfd = -1
        end
        local msg = ffi.string(buf, n)
        if msg == "replay-buffer" then
            if not obslua.obs_frontend_replay_buffer_active() then
                print("Replay buffer not active")
                send_reply("replay-not-active")
                return
            end
            obslua.obs_frontend_replay_buffer_save()
        end
    end
end

function script_description()
    return "Provides socket for remote control"
end

function script_load(settings)
    local AF_UNIX = 1
    local SOCK_STREAM = 1
    ffi.C.unlink(data.socket_filename)
    local addr = ffi.new("struct sockaddr_un[1]", {{
        sun_family = AF_UNIX,
        sun_path = data.socket_filename
    }})
    data.sockfd = ffi.C.socket(AF_UNIX, SOCK_STREAM, 0)
    if ffi.C.bind(data.sockfd, ffi.cast("const struct sockaddr *", addr), ffi.sizeof(addr[0])) < 0 then
        print("bind error")
        return
    end
    if ffi.C.listen(data.sockfd, 1) < 0 then
        print("listen error")
        return
    end
    os_socket_block(data.sockfd, false)
    obslua.obs_frontend_add_event_callback(on_event)
end

function script_unload()
    if data.clientfd >= 0 then
        ffi.C.close(data.clientfd)
        data.clientfd = -1
    end
    if data.sockfd >= 0 then
        ffi.C.close(data.sockfd)
        data.sockfd = -1
    end
    ffi.C.unlink(data.socket_filename)
end
