const std = @import("std");
const Order = std.math.Order;

const EventType = enum(u8) {
    // TODO: Add to this in function of my needs.
    prt,
};

const EventPriority = union(u2) {
    high,
    medium,
    low,
};

pub fn Event(comptime T: type) type {
    return struct {
        const Self = @This();
        event_type: EventType,
        timestamp: i128,
        priority: EventPriority,
        payload: T,

        pub fn init(event_type: EventType, priority: EventPriority, payload: T) Self {
            return Self{
                .event_type = event_type,
                .timestamp = std.time.nanoTimestamp(),
                .priority = priority,
                .payload = payload,
            };
        }

        pub const EventContext = struct {
            pub fn compare(ctx: @This(), a: Event(T), b: Event(T)) std.math.Order {
                _ = ctx;

                if (@intFromEnum(a.priority) != @intFromEnum(b.priority)) {
                    return std.math.order(@intFromEnum(a.priority), @intFromEnum(b.priority));
                }

                const time_diff = if (a.timestamp > b.timestamp) a.timestamp - b.timestamp else b.timestamp - a.timestamp;
                if (time_diff < 1000) {
                    return std.math.order(a.timestamp, b.timestamp);
                } else {
                    return std.math.order(b.timestamp, a.timestamp);
                }
            }
        };
    };
}
