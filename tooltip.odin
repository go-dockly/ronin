package onyx

import "../vgo"
import "core:fmt"
import "core:time"
import "core:math"
import "core:math/linalg"

DEFAULT_TOOLTIP_OFFSET :: 10

Tooltip_Mode :: enum {
	Floating,
	Snapped,
}

Tooltip_Info :: struct {
	bounds: Box,
	origin: union {
		[2]f32,
		Box,
	},
	offset: Maybe(f32),
	size:   [2]f32,
	side:   Side,
	mode:   Tooltip_Mode,
}

begin_tooltip_for_last_object :: proc(size: [2]f32, side: Side = .Bottom, delay: time.Duration = time.Second) -> bool {
	object := last_object().? or_return
	if time.since(object.hovered_time) < delay || .Hovered not_in object.state.current {
		return false
	}
	begin_tooltip_with_options(size, side, origin = object.box)
	return true
}

begin_tooltip_with_options:: proc(
	size: [2]f32,
	side: Side = .Bottom,
	origin: union {[2]f32, Box} = nil,
	offset: f32 = DEFAULT_TOOLTIP_OFFSET,
	loc := #caller_location,
) -> bool {
	object := persistent_object(hash(loc))
	begin_object(object) or_return

	anchor_point: [2]f32

	switch v in origin {
	case [2]f32:
		anchor_point = v
	case Box:
		switch side {
		case .Top:
			anchor_point = {(v.lo.x + v.hi.x) / 2, v.lo.y}
		case .Bottom:
			anchor_point = {(v.lo.x + v.hi.x) / 2, v.hi.y}
		case .Left:
			anchor_point = {v.lo.x, (v.lo.y + v.hi.y) / 2}
		case .Right:
			anchor_point = {v.hi.x, (v.lo.y + v.hi.y) / 2}
		}
	case:
		anchor_point = global_state.mouse_pos
	}

	switch side {
	case .Top:
		object.box = {
			{anchor_point.x - size.x / 2, anchor_point.y - size.y - offset},
			{anchor_point.x + size.x / 2, anchor_point.y - offset},
		}
	case .Bottom:
		object.box = {
			{anchor_point.x - size.x / 2, anchor_point.y + offset},
			{anchor_point.x + size.x / 2, anchor_point.y + size.y + offset},
		}
	case .Left:
		object.box = {
			{anchor_point.x - size.x - offset, anchor_point.y - size.y / 2},
			{anchor_point.x - offset, anchor_point.y + size.y / 2},
		}
	case .Right:
		object.box = {
			{anchor_point.x + offset, anchor_point.y - size.y / 2},
			{anchor_point.x + size.x + offset, anchor_point.y + size.y / 2},
		}
	}

	begin_layer(kind = .Topmost, loc = loc)
	draw_shadow(object.box)
	vgo.fill_box(object.box, global_state.style.rounding, style().color.foreground)
	vgo.stroke_box(object.box, 1, global_state.style.rounding, style().color.foreground_stroke)

	return true
}

end_tooltip :: proc() {
	end_layer()
	end_object()
}

avoid_other_tooltip_boxes :: proc(box0: Box, margin: f32, bounds: Box) -> Box {
	box0 := box0
	for box1 in global_state.tooltip_boxes {
		if box1 == box0 do continue
		min_distance := (box_size(box0) + box_size(box1)) / 2 + margin
		center0 := box_center(box0)
		center1 := box_center(box1)
		difference := center1 - center0
		distance := linalg.abs(difference)
		normal := linalg.normalize(difference)
		box0 = move_box(box0, normal * linalg.min(distance - min_distance, 0))
	}
	return box0
}

make_tooltip_box :: proc(origin, size, align: [2]f32, bounds: Box) -> Box {
	box: Box
	box.lo = linalg.clamp(origin - align * size, bounds.lo, bounds.hi - size)
	box.hi = box.lo + size
	box = avoid_other_tooltip_boxes(box, 4, bounds)
	box = snapped_box(box)
	append(&global_state.tooltip_boxes, box)
	return box
}
