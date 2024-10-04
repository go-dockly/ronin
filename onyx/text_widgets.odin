package onyx

import "tedit"

Label_Info :: struct {
	using _:             Widget_Info,
	text:                string,
	font_style:          Maybe(Font_Style),
	font_size:           Maybe(f32),
	text_job:            Text_Job,
	copied_to_clipboard: bool,
}

init_label :: proc(using info: ^Label_Info, loc := #caller_location) -> bool {
	assert(info != nil)
	text_job = make_text_job(
		{
			text = text,
			size = font_size.? or_else core.style.content_text_size,
			font = core.style.fonts[font_style.? or_else .Regular],
			align_h = .Left,
			align_v = .Top,
		},
		// &core.text_editor,
		// core.mouse_pos - self.box.lo,
	) or_return
	desired_size = text_job.size
	fixed_size = true
	id = hash(loc)
	self = get_widget(id) or_return
	return true
}

add_label :: proc(using info: ^Label_Info) -> bool {
	assert(info != nil)
	begin_widget(info) or_return
	defer end_widget()

	if self.visible {
		// draw_text_highlight(text_job, self.box.lo, core.style.color.accent)
		draw_text_glyphs(text_job, self.box.lo, core.style.color.content)
	}

	return true
}

label :: proc(info: Label_Info, loc := #caller_location) -> Label_Info {
	info := info
	init_label(&info, loc)
	add_label(&info)
	return info
}
