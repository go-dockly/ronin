package demo

import "core:fmt"
import "core:math"
import "core:strings"
import "core:runtime"
import "core:reflect"

import ui "extra:onyx/onyx"
import sapp "extra:sokol-odin/sokol/app"

Section :: enum {
	Buttons,
	Text,
	Graphs,
	Charts,
	Boolean,
}

Option :: enum {
	Process,
	Wave,
	Manifold,
	Function,
}

State :: struct {
	light_mode: bool,
	section: Section,

	checkboxes: [Option]bool,
}

main :: proc() {
	state: State

	sapp.run(sapp.Desc{
		user_data = &state,
		init_cb = proc "c" () {
			context = runtime.default_context()

			ui.init()
			ui.set_style_font(.Medium, "fonts/Geist-Medium.ttf")
			ui.set_style_font(.Bold, "fonts/Geist-Bold.ttf")
			ui.set_color_scheme(ui.dark_color_scheme())
			ui.set_style_rounding(4)
		},
		frame_userdata_cb = proc "c" (userdata: rawptr) {
			context = runtime.default_context()
			state := transmute(^State)userdata

			ui.begin_frame()
				ui.begin_layer({
					box = ui.shrink_box(ui.view_box(), 100),
				})
					ui.foreground()
					ui.begin_layout({
						size = 65,
						side = .Top,
						show_lines = true,
					})
						ui.shrink(15)
						state.section = Section(ui.do_tabs({
							index = int(state.section),
							options = reflect.enum_field_names(Section),
						}).index.? or_else int(state.section))
						ui.side(.Right)
						state.light_mode = ui.do_switch({on = state.light_mode}).on
					ui.end_layout()

					ui.shrink(30)
					switch state.section {

						case .Boolean:
						for member, m in Option {
							ui.push_id(m)
								if m > 0 {
									ui.space(10)
								}
								if ui.was_clicked(ui.do_checkbox({
									value = state.checkboxes[member],
									text = ui.tmp_print(member),
								})) {
									state.checkboxes[member] = !state.checkboxes[member]
								}
							ui.pop_id()
						}

						case .Buttons:
						ui.begin_layout({
							size = 30,
						})
							ui.set_width_auto()
							for member, m in ui.Button_Kind {
								ui.push_id(m)
									if m > 0 {
										ui.space(10)
									}
									if ui.was_clicked(ui.do_button({
										text = ui.tmp_print(member),
										kind = member,
									})) {

									}
								ui.pop_id()
							}
						ui.end_layout()

						case .Charts:

						case .Graphs:

						case .Text:

					}
				ui.end_layer()
			ui.end_frame()
		},
		cleanup_cb = proc "c" () {
			context = runtime.default_context()

			ui.quit()
		},
		event_cb = proc "c" (e: ^sapp.Event) {
			context = runtime.default_context()

			ui.handle_event(e)
		},

		enable_clipboard = true,
		enable_dragndrop = true,
		sample_count = 4,
		width = 1000,
		height = 800,
		window_title = "UI DEMO",
	})
}