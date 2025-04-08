const std = @import("std");

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
    };
}
