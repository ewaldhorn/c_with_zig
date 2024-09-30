const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "hello_from_zig_build",
        .optimize = optimize,
        .target = target,
    });

    exe.addCSourceFiles(.{
        .files = &.{
            "src/main.c",
            "src/lib/my_lib.c",
            "src/lib/my_math.c",
        },
        .flags = &.{"-Wall"},
    });

    exe.linkSystemLibrary("c");

    b.installArtifact(exe);
    b.default_step.dependOn(&exe.step);
}
