const std = @import("std");
pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    _ = b.addModule("root", .{
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    // const lib = b.addLibrary(.{
    //     .linkage = .dynamic,
    //     .name = "common",
    //     .root_module = exe_mod,
    // });

    // b.installArtifact(exe);
}
