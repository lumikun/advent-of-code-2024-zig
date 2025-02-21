const std = @import("std");

pub fn solve1(content: []const u8) !i64 {
    var lines = std.mem.tokenize(u8, content, "\n");
    var ret: i64 = 0;
    // ? wacky shit doesn't work I guess ):
    while (lines.next()) |line| {
        //var nums = std.mem.tokenize(u8, line, " ");
        std.debug.print("line {}\n", .{std.mem.tokenize(u8, line, " ")});
    }
    ret = 1;
    return ret;
}

pub fn main() void {
    const data = @embedFile("d2.txt");
    const ans1 = try solve1(data);
    //const ans2 = try solve2();
    std.debug.print("Answer 1: {}\nAnswer 2: {}\n", .{ans1});
}
