const std = @import("std");

pub fn parseArgsAsIp() []const u8 {
    var ip: []const u8 = "0.0.0.0";
    if (std.os.argv.len != 3) {
        @panic("You should pass IP via CLI arguments!");
    }

    var i: usize = 1;
    while (i < std.os.argv.len) : (i += 1) {
        const arg = std.mem.span(std.os.argv[i]);
        if (std.mem.eql(u8, arg, "-ip") and i + 1 < std.os.argv.len) {
            ip = std.mem.span(std.os.argv[i + 1]);
            i += 1;
        }
    }
    return ip;
}
