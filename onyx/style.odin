package onyx

Color_Scheme :: struct {
	background, foreground, substance, accent, accent_content, content: Color,
}

Font_Style :: enum {
	// This style is used as a fallback font
	// Every glyph not found in the defined font for a text job will be checked against it
	Icon,
	// 4 normal font weights
	Light,
	Regular,
	Medium,
	Bold,
	// Monospace for code
	Monospace,
}

Style :: struct {
	fonts:       [Font_Style]int,
	color:       Color_Scheme,
	using shape: Style_Shape,
}

Style_Shape :: struct {
	visual_size:                                                          [2]f32,
	header_text_size, button_text_size, tab_text_size, content_text_size: f32,
	text_input_height, button_height:                                     f32,
	tooltip_rounding, tooltip_padding, panel_padding, rounding:           f32,
	stroke_width:                                                         f32,
	title_margin:                                                         f32,
	title_padding:                                                        f32,
	menu_padding:                                                         f32,
	scrollbar_thickness:                                                  f32,
	table_row_height:                                                     f32,
}

default_style_shape :: proc() -> Style_Shape {
	return Style_Shape {
		tooltip_padding = 3,
		panel_padding = 10,
		header_text_size = 26,
		button_text_size = 18,
		tab_text_size = 18,
		content_text_size = 18,
		rounding = 5,
		menu_padding = 5,
		scrollbar_thickness = 12,
		table_row_height = 40,
		visual_size = {200, 30},
	}
}

light_color_scheme :: proc() -> Color_Scheme {
	return Color_Scheme {
		background = {165, 169, 169, 255},
		foreground = {255, 255, 255, 255},
		substance = {162, 167, 167, 255},
		accent = {59, 130, 246, 255},
		accent_content = {25, 25, 25, 255},
		content = {25, 25, 25, 255},
	}
}

dark_color_scheme :: proc() -> Color_Scheme {
	return Color_Scheme {
		background = {0, 0, 0, 255},
		foreground = {25, 25, 32, 255},
		substance = {65, 65, 75, 255},
		accent = {59, 130, 246, 255},
		accent_content = {255, 255, 255, 255},
		content = {255, 255, 255, 255},
	}
}

load_font_style :: proc(style: Font_Style, path: string) -> bool {
	core.style.fonts[style] = load_font(path) or_return
	return true
}

set_style_rounding :: proc(amount: f32) {
	core.style.rounding = amount
}

set_color_scheme :: proc(scheme: Color_Scheme) {
	core.style.color = scheme
}
