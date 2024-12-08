const std = @import("std");

pub fn solve1() i32 {
    return 1;
}

pub fn solve2() i32 {
    return 2;
}

pub fn main() void {
    const ans1 = solve1();
    const ans2 = solve2();
    std.debug.print("Answer 1: {}\nAnswer 2: {}\n", .{ ans1, ans2 });
}
