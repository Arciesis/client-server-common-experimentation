const std = @import("std");

pub fn parseArg() []const u8 {
    var server_ip: []const u8 = "0.0.0.0";
    if (std.os.argv.len != 3) {
        return server_ip;
    }

    var i: usize = 1;
    while (i < std.os.argv.len) : (i += 1) {
        const arg = std.mem.span(std.os.argv[i]);
        if (std.mem.eql(u8, arg, "--server-ip") and i + 1 < std.os.argv.len) {
            server_ip = std.mem.span(std.os.argv[i + 1]);
            i += 1;
        }
    }
    return server_ip;
}
