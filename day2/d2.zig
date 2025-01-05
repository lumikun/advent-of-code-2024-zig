const std = @import("std");

pub fn solve1(content: []const u8) !i64 {
    var lines = std.mem.tokenize(u8, content, "\n");
    var ret: i64 = 0;
    while (lines.next()) |line| {
        var nums = std.mem.tokenize(u8, line, " ");
        while (nums.next()) |number| {
            const trimmed = std.mem.trim(u8, number, &std.ascii.whitespace);
            ret += try std.fmt.parseInt(i64, trimmed, 10);
            //if (std.fmt.parseInt(i64, trimmed, 10)) |parsed| {
            //    ret += try parsed;
            //} else {
            //    std.debug.print("Error, parsing nums: {s}\n", .{number});
            //    continue;
            //}
        }
    }
    return ret;
}

pub fn solve2() i32 {
    return 2;
}

pub fn main() void {
    const data = @embedFile("d2.txt");
    const ans1 = try solve1(data);
    const ans2 = try solve2();
    std.debug.print("Answer 1: {}\nAnswer 2: {}\n", .{ ans1, ans2 });
}
