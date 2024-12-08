const std = @import("std");

pub fn solve1(content: []const u8) !i64 {
    // TODO: Should just seperate this out into a sepperate function, instead of repeating this shit
    // for both functions. Oh well, this will do for now.
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const alloc = gpa.allocator();
    defer _ = gpa.deinit();
    var lines = std.mem.tokenize(u8, content, "\n");
    var left = std.ArrayList(i64).init(alloc);
    defer left.deinit();
    var right = std.ArrayList(i64).init(alloc);
    defer right.deinit();

    while (lines.next()) |line| {
        var nums = std.mem.tokenize(u8, line, " ");
        if (nums.next()) |num1| {
            if (std.fmt.parseInt(i64, num1, 10)) |parsed1| {
                try left.append(parsed1);
            } else |_| {
                std.debug.print("Erorr parsing nums: {s}\n", .{num1});
                continue;
            }
        }
        if (nums.next()) |num2| {
            const trimmed = std.mem.trim(u8, num2, &std.ascii.whitespace);
            if (std.fmt.parseInt(i64, trimmed, 10)) |parsed2| {
                try right.append(parsed2);
            } else |_| {
                std.debug.print("Error parsing nums:{s}\n", .{num2});
                continue;
            }
        }
    }
    std.mem.sort(i64, left.items, {}, std.sort.asc(i64));
    std.mem.sort(i64, right.items, {}, std.sort.asc(i64));
    var sum: i64 = 0;
    for (left.items, right.items) |l, r| {
        sum += if (l > r) l - r else r - l;
    }
    return sum;
}

pub fn solve2(content: []const u8) !i64 {
    // TODO: Same for this, i really should fix it up, and get the actual content to be parsed properly.
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const alloc = gpa.allocator();
    defer _ = gpa.deinit();
    var lines = std.mem.tokenize(u8, content, "\n");
    var left = std.ArrayList(i64).init(alloc);
    defer left.deinit();
    var right = std.ArrayList(i64).init(alloc);
    defer right.deinit();

    while (lines.next()) |line| {
        var nums = std.mem.tokenize(u8, line, " ");
        if (nums.next()) |num1| {
            if (std.fmt.parseInt(i64, num1, 10)) |parsed1| {
                try left.append(parsed1);
            } else |_| {
                std.debug.print("Error parsing nums: {s}\n", .{num1});
                continue;
            }
        }
        if (nums.next()) |num2| {
            const trimmed = std.mem.trim(u8, num2, &std.ascii.whitespace);
            if (std.fmt.parseInt(i64, trimmed, 10)) |parsed2| {
                try right.append(parsed2);
            } else |_| {
                std.debug.print("Error parsing nums: {s}\n", .{trimmed});
                continue;
            }
        }
    }
    // ^^ all the above is kind of useless, but for now it stays untill I read up on how to do this properly.

    // Welp that wasn't supper hard :^)
    var sum: i64 = 0;
    for (left.items) |l| {
        var tmp: i64 = 0;
        for (right.items) |r| {
            if (l == r) {
                tmp += 1;
            }
        }
        sum += l * tmp;
        tmp = 0;
    }

    return sum;
}

pub fn main() !void {
    const data = @embedFile("d1.txt");
    const ans1 = try solve1(data);
    const ans2 = try solve2(data);
    std.debug.print("Answer 1: {}\nAnswer 2: {}\n", .{ ans1, ans2 });
}
