const std = @import("std");
const Allocator = std.mem.Allocator;

const ast = @import("ast.zig");
const Tree = ast.Tree;

const Target = enum {
    endron,
};

pub fn generate(tree: *Tree, target: Target) ![]const u8 {
    var arena = std.heap.ArenaAllocator.init(tree.gpa);
    defer arena.deinit();

    switch (target) {
        .endron => return @import("codegen/endron.zig").generate(&arena.allocator, tree),
    }
}
