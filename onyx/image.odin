package onyx

import "base:runtime"
import "core:fmt"
import "core:os"

import img "core:image"
import png "core:image/png"
import "vendor:wgpu"

Image :: struct {
	using image: img.Image,
	atlas_src:   Maybe(Box),
}

Texture :: struct {
	internal: wgpu.Texture,
	width, height: int,
}

upload_image :: proc(image: img.Image) -> (index: int, ok: bool) {
	for i in 0 ..< len(core.user_images) {
		if core.user_images[i] == nil {
			index = i
			ok = true
			core.user_images[i] = Image{}
			break
		}
	}
	return
}

drop_image :: proc(index: int) {
	core.user_images[index] = nil
}

destroy_image :: proc(image: ^Image) {
	img.destroy(image)
}

draw_texture :: proc(texture: Texture, box: Box, tint: Color) {
	last_texture := get_current_texture()
	set_texture(texture.internal)

	set_vertex_color(tint)

	set_vertex_uv(0)
	tl := add_vertex(box.lo)
	set_vertex_uv({0, 1})
	bl := add_vertex({box.lo.x, box.hi.y})
	set_vertex_uv(1)
	br := add_vertex(box.hi)
	set_vertex_uv({1, 0})
	tr := add_vertex({box.hi.x, box.lo.y})

	add_indices(tl, br, bl, tl, tr, br)

	set_texture(last_texture)

}

draw_texture_portion :: proc(texture: Texture, source, target: Box, tint: Color) {
	last_texture := get_current_texture()
	set_texture(texture.internal)

	set_vertex_color(tint)

	size: [2]f32 = {f32(texture.width), f32(texture.height)}

	set_vertex_uv(source.lo / size)
	tl := add_vertex(target.lo)
	set_vertex_uv({source.lo.x, source.hi.y} / size)
	bl := add_vertex({target.lo.x, target.hi.y})
	set_vertex_uv(source.hi / size)
	br := add_vertex(target.hi)
	set_vertex_uv({source.hi.x, source.lo.y} / size)
	tr := add_vertex({target.hi.x, target.lo.y})

	add_indices(tl, br, bl, tl, tr, br)

	set_texture(last_texture)
}

set_texture :: proc(texture: wgpu.Texture) {
	core.current_texture = texture
	if core.current_draw_call == nil do return
	if core.current_draw_call.texture == core.current_texture do return
	if core.current_draw_call.texture != {} {
		append_draw_call(current_layer().?.index)
	}
}

get_current_texture :: proc() -> wgpu.Texture {
	return core.current_texture
}

// load_texture_from_file :: proc(file: string) -> (result: Texture, err: png.Error) {
// 	_image := png.load_from_file(file) or_return
// 	img.alpha_add_if_missing(_image)
// 	pixel_format := get_pixel_format(_image.channels, _image.depth)
// 	result = Texture {
// 		image = sg.make_image(
// 			u32_Desc {
// 				data = {
// 					subimage = {
// 						0 = {
// 							0 = {
// 								ptr = raw_data(_image.pixels.buf),
// 								size = u64(len(_image.pixels.buf)),
// 							},
// 						},
// 					},
// 				},
// 				width = i32(_image.width),
// 				height = i32(_image.height),
// 				pixel_format = pixel_format,
// 			},
// 		),
// 		width  = _image.width,
// 		height = _image.height,
// 	}

// 	return
// }
