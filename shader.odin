package ui
import sg "../sokol-odin/sokol/gfx"
/*
    #version:1# (machine generated, don't edit!)

    Generated by sokol-shdc (https://github.com/floooh/sokol-tools)

    Cmdline:
        sokol-shdc --input=shader.glsl --output=shader.odin --slang=glsl430:hlsl5:glsl300es --format=sokol_odin

    Overview:
    =========
    Shader program: 'ui':
        Get shader desc: ui_shader_desc(sg.query_backend())
        Vertex shader: vs
            Attributes:
                ATTR_vs_pos => 0
                ATTR_vs_uv => 1
                ATTR_vs_col => 2
            Uniform block 'tex':
                Odin struct: Tex
                Bind slot: SLOT_tex => 0
        Fragment shader: fs
*/
ATTR_vs_pos :: 0
ATTR_vs_uv :: 1
ATTR_vs_col :: 2
SLOT_tex :: 0
Tex :: struct #align(16) {
    using _: struct #packed {
        texSize: [2]f32,
        _: [8]u8,
    },
}
/*
    #version 430

    uniform vec4 tex[1];
    layout(location = 0) in vec2 pos;
    layout(location = 0) out vec2 texCoord;
    layout(location = 1) in vec2 uv;
    layout(location = 1) out vec4 color;
    layout(location = 2) in vec4 col;

    void main()
    {
        gl_Position = vec4(fma(pos / tex[0].xy, vec2(2.0, -2.0), vec2(-1.0, 1.0)), 0.0, 1.0);
        texCoord = uv;
        color = col;
    }

*/
@(private)
vs_source_glsl430 := [358]u8 {
    0x23,0x76,0x65,0x72,0x73,0x69,0x6f,0x6e,0x20,0x34,0x33,0x30,0x0a,0x0a,0x75,0x6e,
    0x69,0x66,0x6f,0x72,0x6d,0x20,0x76,0x65,0x63,0x34,0x20,0x74,0x65,0x78,0x5b,0x31,
    0x5d,0x3b,0x0a,0x6c,0x61,0x79,0x6f,0x75,0x74,0x28,0x6c,0x6f,0x63,0x61,0x74,0x69,
    0x6f,0x6e,0x20,0x3d,0x20,0x30,0x29,0x20,0x69,0x6e,0x20,0x76,0x65,0x63,0x32,0x20,
    0x70,0x6f,0x73,0x3b,0x0a,0x6c,0x61,0x79,0x6f,0x75,0x74,0x28,0x6c,0x6f,0x63,0x61,
    0x74,0x69,0x6f,0x6e,0x20,0x3d,0x20,0x30,0x29,0x20,0x6f,0x75,0x74,0x20,0x76,0x65,
    0x63,0x32,0x20,0x74,0x65,0x78,0x43,0x6f,0x6f,0x72,0x64,0x3b,0x0a,0x6c,0x61,0x79,
    0x6f,0x75,0x74,0x28,0x6c,0x6f,0x63,0x61,0x74,0x69,0x6f,0x6e,0x20,0x3d,0x20,0x31,
    0x29,0x20,0x69,0x6e,0x20,0x76,0x65,0x63,0x32,0x20,0x75,0x76,0x3b,0x0a,0x6c,0x61,
    0x79,0x6f,0x75,0x74,0x28,0x6c,0x6f,0x63,0x61,0x74,0x69,0x6f,0x6e,0x20,0x3d,0x20,
    0x31,0x29,0x20,0x6f,0x75,0x74,0x20,0x76,0x65,0x63,0x34,0x20,0x63,0x6f,0x6c,0x6f,
    0x72,0x3b,0x0a,0x6c,0x61,0x79,0x6f,0x75,0x74,0x28,0x6c,0x6f,0x63,0x61,0x74,0x69,
    0x6f,0x6e,0x20,0x3d,0x20,0x32,0x29,0x20,0x69,0x6e,0x20,0x76,0x65,0x63,0x34,0x20,
    0x63,0x6f,0x6c,0x3b,0x0a,0x0a,0x76,0x6f,0x69,0x64,0x20,0x6d,0x61,0x69,0x6e,0x28,
    0x29,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x67,0x6c,0x5f,0x50,0x6f,0x73,0x69,0x74,
    0x69,0x6f,0x6e,0x20,0x3d,0x20,0x76,0x65,0x63,0x34,0x28,0x66,0x6d,0x61,0x28,0x70,
    0x6f,0x73,0x20,0x2f,0x20,0x74,0x65,0x78,0x5b,0x30,0x5d,0x2e,0x78,0x79,0x2c,0x20,
    0x76,0x65,0x63,0x32,0x28,0x32,0x2e,0x30,0x2c,0x20,0x2d,0x32,0x2e,0x30,0x29,0x2c,
    0x20,0x76,0x65,0x63,0x32,0x28,0x2d,0x31,0x2e,0x30,0x2c,0x20,0x31,0x2e,0x30,0x29,
    0x29,0x2c,0x20,0x30,0x2e,0x30,0x2c,0x20,0x31,0x2e,0x30,0x29,0x3b,0x0a,0x20,0x20,
    0x20,0x20,0x74,0x65,0x78,0x43,0x6f,0x6f,0x72,0x64,0x20,0x3d,0x20,0x75,0x76,0x3b,
    0x0a,0x20,0x20,0x20,0x20,0x63,0x6f,0x6c,0x6f,0x72,0x20,0x3d,0x20,0x63,0x6f,0x6c,
    0x3b,0x0a,0x7d,0x0a,0x0a,0x00,
}
/*
    #version 430

    layout(location = 0) out vec4 frag_color;
    layout(location = 1) in vec4 color;
    layout(location = 0) in vec2 texCoord;

    void main()
    {
        frag_color = color;
    }

*/
@(private)
fs_source_glsl430 := [174]u8 {
    0x23,0x76,0x65,0x72,0x73,0x69,0x6f,0x6e,0x20,0x34,0x33,0x30,0x0a,0x0a,0x6c,0x61,
    0x79,0x6f,0x75,0x74,0x28,0x6c,0x6f,0x63,0x61,0x74,0x69,0x6f,0x6e,0x20,0x3d,0x20,
    0x30,0x29,0x20,0x6f,0x75,0x74,0x20,0x76,0x65,0x63,0x34,0x20,0x66,0x72,0x61,0x67,
    0x5f,0x63,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x6c,0x61,0x79,0x6f,0x75,0x74,0x28,0x6c,
    0x6f,0x63,0x61,0x74,0x69,0x6f,0x6e,0x20,0x3d,0x20,0x31,0x29,0x20,0x69,0x6e,0x20,
    0x76,0x65,0x63,0x34,0x20,0x63,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x6c,0x61,0x79,0x6f,
    0x75,0x74,0x28,0x6c,0x6f,0x63,0x61,0x74,0x69,0x6f,0x6e,0x20,0x3d,0x20,0x30,0x29,
    0x20,0x69,0x6e,0x20,0x76,0x65,0x63,0x32,0x20,0x74,0x65,0x78,0x43,0x6f,0x6f,0x72,
    0x64,0x3b,0x0a,0x0a,0x76,0x6f,0x69,0x64,0x20,0x6d,0x61,0x69,0x6e,0x28,0x29,0x0a,
    0x7b,0x0a,0x20,0x20,0x20,0x20,0x66,0x72,0x61,0x67,0x5f,0x63,0x6f,0x6c,0x6f,0x72,
    0x20,0x3d,0x20,0x63,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x7d,0x0a,0x0a,0x00,
}
/*
    #version 300 es

    uniform vec4 tex[1];
    layout(location = 0) in vec2 pos;
    out vec2 texCoord;
    layout(location = 1) in vec2 uv;
    out vec4 color;
    layout(location = 2) in vec4 col;

    void main()
    {
        gl_Position = vec4((pos / tex[0].xy) * vec2(2.0, -2.0) + vec2(-1.0, 1.0), 0.0, 1.0);
        texCoord = uv;
        color = col;
    }

*/
@(private)
vs_source_glsl300es := [318]u8 {
    0x23,0x76,0x65,0x72,0x73,0x69,0x6f,0x6e,0x20,0x33,0x30,0x30,0x20,0x65,0x73,0x0a,
    0x0a,0x75,0x6e,0x69,0x66,0x6f,0x72,0x6d,0x20,0x76,0x65,0x63,0x34,0x20,0x74,0x65,
    0x78,0x5b,0x31,0x5d,0x3b,0x0a,0x6c,0x61,0x79,0x6f,0x75,0x74,0x28,0x6c,0x6f,0x63,
    0x61,0x74,0x69,0x6f,0x6e,0x20,0x3d,0x20,0x30,0x29,0x20,0x69,0x6e,0x20,0x76,0x65,
    0x63,0x32,0x20,0x70,0x6f,0x73,0x3b,0x0a,0x6f,0x75,0x74,0x20,0x76,0x65,0x63,0x32,
    0x20,0x74,0x65,0x78,0x43,0x6f,0x6f,0x72,0x64,0x3b,0x0a,0x6c,0x61,0x79,0x6f,0x75,
    0x74,0x28,0x6c,0x6f,0x63,0x61,0x74,0x69,0x6f,0x6e,0x20,0x3d,0x20,0x31,0x29,0x20,
    0x69,0x6e,0x20,0x76,0x65,0x63,0x32,0x20,0x75,0x76,0x3b,0x0a,0x6f,0x75,0x74,0x20,
    0x76,0x65,0x63,0x34,0x20,0x63,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x6c,0x61,0x79,0x6f,
    0x75,0x74,0x28,0x6c,0x6f,0x63,0x61,0x74,0x69,0x6f,0x6e,0x20,0x3d,0x20,0x32,0x29,
    0x20,0x69,0x6e,0x20,0x76,0x65,0x63,0x34,0x20,0x63,0x6f,0x6c,0x3b,0x0a,0x0a,0x76,
    0x6f,0x69,0x64,0x20,0x6d,0x61,0x69,0x6e,0x28,0x29,0x0a,0x7b,0x0a,0x20,0x20,0x20,
    0x20,0x67,0x6c,0x5f,0x50,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x20,0x3d,0x20,0x76,
    0x65,0x63,0x34,0x28,0x28,0x70,0x6f,0x73,0x20,0x2f,0x20,0x74,0x65,0x78,0x5b,0x30,
    0x5d,0x2e,0x78,0x79,0x29,0x20,0x2a,0x20,0x76,0x65,0x63,0x32,0x28,0x32,0x2e,0x30,
    0x2c,0x20,0x2d,0x32,0x2e,0x30,0x29,0x20,0x2b,0x20,0x76,0x65,0x63,0x32,0x28,0x2d,
    0x31,0x2e,0x30,0x2c,0x20,0x31,0x2e,0x30,0x29,0x2c,0x20,0x30,0x2e,0x30,0x2c,0x20,
    0x31,0x2e,0x30,0x29,0x3b,0x0a,0x20,0x20,0x20,0x20,0x74,0x65,0x78,0x43,0x6f,0x6f,
    0x72,0x64,0x20,0x3d,0x20,0x75,0x76,0x3b,0x0a,0x20,0x20,0x20,0x20,0x63,0x6f,0x6c,
    0x6f,0x72,0x20,0x3d,0x20,0x63,0x6f,0x6c,0x3b,0x0a,0x7d,0x0a,0x0a,0x00,
}
/*
    #version 300 es
    precision mediump float;
    precision highp int;

    layout(location = 0) out highp vec4 frag_color;
    in highp vec4 color;
    in highp vec2 texCoord;

    void main()
    {
        frag_color = color;
    }

*/
@(private)
fs_source_glsl300es := [199]u8 {
    0x23,0x76,0x65,0x72,0x73,0x69,0x6f,0x6e,0x20,0x33,0x30,0x30,0x20,0x65,0x73,0x0a,
    0x70,0x72,0x65,0x63,0x69,0x73,0x69,0x6f,0x6e,0x20,0x6d,0x65,0x64,0x69,0x75,0x6d,
    0x70,0x20,0x66,0x6c,0x6f,0x61,0x74,0x3b,0x0a,0x70,0x72,0x65,0x63,0x69,0x73,0x69,
    0x6f,0x6e,0x20,0x68,0x69,0x67,0x68,0x70,0x20,0x69,0x6e,0x74,0x3b,0x0a,0x0a,0x6c,
    0x61,0x79,0x6f,0x75,0x74,0x28,0x6c,0x6f,0x63,0x61,0x74,0x69,0x6f,0x6e,0x20,0x3d,
    0x20,0x30,0x29,0x20,0x6f,0x75,0x74,0x20,0x68,0x69,0x67,0x68,0x70,0x20,0x76,0x65,
    0x63,0x34,0x20,0x66,0x72,0x61,0x67,0x5f,0x63,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x69,
    0x6e,0x20,0x68,0x69,0x67,0x68,0x70,0x20,0x76,0x65,0x63,0x34,0x20,0x63,0x6f,0x6c,
    0x6f,0x72,0x3b,0x0a,0x69,0x6e,0x20,0x68,0x69,0x67,0x68,0x70,0x20,0x76,0x65,0x63,
    0x32,0x20,0x74,0x65,0x78,0x43,0x6f,0x6f,0x72,0x64,0x3b,0x0a,0x0a,0x76,0x6f,0x69,
    0x64,0x20,0x6d,0x61,0x69,0x6e,0x28,0x29,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x66,
    0x72,0x61,0x67,0x5f,0x63,0x6f,0x6c,0x6f,0x72,0x20,0x3d,0x20,0x63,0x6f,0x6c,0x6f,
    0x72,0x3b,0x0a,0x7d,0x0a,0x0a,0x00,
}
/*
    cbuffer tex : register(b0)
    {
        float2 _25_texSize : packoffset(c0);
    };


    static float4 gl_Position;
    static float2 pos;
    static float2 texCoord;
    static float2 uv;
    static float4 color;
    static float4 col;

    struct SPIRV_Cross_Input
    {
        float2 pos : TEXCOORD0;
        float2 uv : TEXCOORD1;
        float4 col : TEXCOORD2;
    };

    struct SPIRV_Cross_Output
    {
        float2 texCoord : TEXCOORD0;
        float4 color : TEXCOORD1;
        float4 gl_Position : SV_Position;
    };

    void vert_main()
    {
        gl_Position = float4(mad(pos / _25_texSize, float2(2.0f, -2.0f), float2(-1.0f, 1.0f)), 0.0f, 1.0f);
        texCoord = uv;
        color = col;
    }

    SPIRV_Cross_Output main(SPIRV_Cross_Input stage_input)
    {
        pos = stage_input.pos;
        uv = stage_input.uv;
        col = stage_input.col;
        vert_main();
        SPIRV_Cross_Output stage_output;
        stage_output.gl_Position = gl_Position;
        stage_output.texCoord = texCoord;
        stage_output.color = color;
        return stage_output;
    }
*/
@(private)
vs_source_hlsl5 := [945]u8 {
    0x63,0x62,0x75,0x66,0x66,0x65,0x72,0x20,0x74,0x65,0x78,0x20,0x3a,0x20,0x72,0x65,
    0x67,0x69,0x73,0x74,0x65,0x72,0x28,0x62,0x30,0x29,0x0a,0x7b,0x0a,0x20,0x20,0x20,
    0x20,0x66,0x6c,0x6f,0x61,0x74,0x32,0x20,0x5f,0x32,0x35,0x5f,0x74,0x65,0x78,0x53,
    0x69,0x7a,0x65,0x20,0x3a,0x20,0x70,0x61,0x63,0x6b,0x6f,0x66,0x66,0x73,0x65,0x74,
    0x28,0x63,0x30,0x29,0x3b,0x0a,0x7d,0x3b,0x0a,0x0a,0x0a,0x73,0x74,0x61,0x74,0x69,
    0x63,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,0x67,0x6c,0x5f,0x50,0x6f,0x73,0x69,
    0x74,0x69,0x6f,0x6e,0x3b,0x0a,0x73,0x74,0x61,0x74,0x69,0x63,0x20,0x66,0x6c,0x6f,
    0x61,0x74,0x32,0x20,0x70,0x6f,0x73,0x3b,0x0a,0x73,0x74,0x61,0x74,0x69,0x63,0x20,
    0x66,0x6c,0x6f,0x61,0x74,0x32,0x20,0x74,0x65,0x78,0x43,0x6f,0x6f,0x72,0x64,0x3b,
    0x0a,0x73,0x74,0x61,0x74,0x69,0x63,0x20,0x66,0x6c,0x6f,0x61,0x74,0x32,0x20,0x75,
    0x76,0x3b,0x0a,0x73,0x74,0x61,0x74,0x69,0x63,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,
    0x20,0x63,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x73,0x74,0x61,0x74,0x69,0x63,0x20,0x66,
    0x6c,0x6f,0x61,0x74,0x34,0x20,0x63,0x6f,0x6c,0x3b,0x0a,0x0a,0x73,0x74,0x72,0x75,
    0x63,0x74,0x20,0x53,0x50,0x49,0x52,0x56,0x5f,0x43,0x72,0x6f,0x73,0x73,0x5f,0x49,
    0x6e,0x70,0x75,0x74,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x66,0x6c,0x6f,0x61,0x74,
    0x32,0x20,0x70,0x6f,0x73,0x20,0x3a,0x20,0x54,0x45,0x58,0x43,0x4f,0x4f,0x52,0x44,
    0x30,0x3b,0x0a,0x20,0x20,0x20,0x20,0x66,0x6c,0x6f,0x61,0x74,0x32,0x20,0x75,0x76,
    0x20,0x3a,0x20,0x54,0x45,0x58,0x43,0x4f,0x4f,0x52,0x44,0x31,0x3b,0x0a,0x20,0x20,
    0x20,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,0x63,0x6f,0x6c,0x20,0x3a,0x20,0x54,
    0x45,0x58,0x43,0x4f,0x4f,0x52,0x44,0x32,0x3b,0x0a,0x7d,0x3b,0x0a,0x0a,0x73,0x74,
    0x72,0x75,0x63,0x74,0x20,0x53,0x50,0x49,0x52,0x56,0x5f,0x43,0x72,0x6f,0x73,0x73,
    0x5f,0x4f,0x75,0x74,0x70,0x75,0x74,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x66,0x6c,
    0x6f,0x61,0x74,0x32,0x20,0x74,0x65,0x78,0x43,0x6f,0x6f,0x72,0x64,0x20,0x3a,0x20,
    0x54,0x45,0x58,0x43,0x4f,0x4f,0x52,0x44,0x30,0x3b,0x0a,0x20,0x20,0x20,0x20,0x66,
    0x6c,0x6f,0x61,0x74,0x34,0x20,0x63,0x6f,0x6c,0x6f,0x72,0x20,0x3a,0x20,0x54,0x45,
    0x58,0x43,0x4f,0x4f,0x52,0x44,0x31,0x3b,0x0a,0x20,0x20,0x20,0x20,0x66,0x6c,0x6f,
    0x61,0x74,0x34,0x20,0x67,0x6c,0x5f,0x50,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x20,
    0x3a,0x20,0x53,0x56,0x5f,0x50,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x3b,0x0a,0x7d,
    0x3b,0x0a,0x0a,0x76,0x6f,0x69,0x64,0x20,0x76,0x65,0x72,0x74,0x5f,0x6d,0x61,0x69,
    0x6e,0x28,0x29,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x67,0x6c,0x5f,0x50,0x6f,0x73,
    0x69,0x74,0x69,0x6f,0x6e,0x20,0x3d,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x28,0x6d,
    0x61,0x64,0x28,0x70,0x6f,0x73,0x20,0x2f,0x20,0x5f,0x32,0x35,0x5f,0x74,0x65,0x78,
    0x53,0x69,0x7a,0x65,0x2c,0x20,0x66,0x6c,0x6f,0x61,0x74,0x32,0x28,0x32,0x2e,0x30,
    0x66,0x2c,0x20,0x2d,0x32,0x2e,0x30,0x66,0x29,0x2c,0x20,0x66,0x6c,0x6f,0x61,0x74,
    0x32,0x28,0x2d,0x31,0x2e,0x30,0x66,0x2c,0x20,0x31,0x2e,0x30,0x66,0x29,0x29,0x2c,
    0x20,0x30,0x2e,0x30,0x66,0x2c,0x20,0x31,0x2e,0x30,0x66,0x29,0x3b,0x0a,0x20,0x20,
    0x20,0x20,0x74,0x65,0x78,0x43,0x6f,0x6f,0x72,0x64,0x20,0x3d,0x20,0x75,0x76,0x3b,
    0x0a,0x20,0x20,0x20,0x20,0x63,0x6f,0x6c,0x6f,0x72,0x20,0x3d,0x20,0x63,0x6f,0x6c,
    0x3b,0x0a,0x7d,0x0a,0x0a,0x53,0x50,0x49,0x52,0x56,0x5f,0x43,0x72,0x6f,0x73,0x73,
    0x5f,0x4f,0x75,0x74,0x70,0x75,0x74,0x20,0x6d,0x61,0x69,0x6e,0x28,0x53,0x50,0x49,
    0x52,0x56,0x5f,0x43,0x72,0x6f,0x73,0x73,0x5f,0x49,0x6e,0x70,0x75,0x74,0x20,0x73,
    0x74,0x61,0x67,0x65,0x5f,0x69,0x6e,0x70,0x75,0x74,0x29,0x0a,0x7b,0x0a,0x20,0x20,
    0x20,0x20,0x70,0x6f,0x73,0x20,0x3d,0x20,0x73,0x74,0x61,0x67,0x65,0x5f,0x69,0x6e,
    0x70,0x75,0x74,0x2e,0x70,0x6f,0x73,0x3b,0x0a,0x20,0x20,0x20,0x20,0x75,0x76,0x20,
    0x3d,0x20,0x73,0x74,0x61,0x67,0x65,0x5f,0x69,0x6e,0x70,0x75,0x74,0x2e,0x75,0x76,
    0x3b,0x0a,0x20,0x20,0x20,0x20,0x63,0x6f,0x6c,0x20,0x3d,0x20,0x73,0x74,0x61,0x67,
    0x65,0x5f,0x69,0x6e,0x70,0x75,0x74,0x2e,0x63,0x6f,0x6c,0x3b,0x0a,0x20,0x20,0x20,
    0x20,0x76,0x65,0x72,0x74,0x5f,0x6d,0x61,0x69,0x6e,0x28,0x29,0x3b,0x0a,0x20,0x20,
    0x20,0x20,0x53,0x50,0x49,0x52,0x56,0x5f,0x43,0x72,0x6f,0x73,0x73,0x5f,0x4f,0x75,
    0x74,0x70,0x75,0x74,0x20,0x73,0x74,0x61,0x67,0x65,0x5f,0x6f,0x75,0x74,0x70,0x75,
    0x74,0x3b,0x0a,0x20,0x20,0x20,0x20,0x73,0x74,0x61,0x67,0x65,0x5f,0x6f,0x75,0x74,
    0x70,0x75,0x74,0x2e,0x67,0x6c,0x5f,0x50,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x20,
    0x3d,0x20,0x67,0x6c,0x5f,0x50,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x3b,0x0a,0x20,
    0x20,0x20,0x20,0x73,0x74,0x61,0x67,0x65,0x5f,0x6f,0x75,0x74,0x70,0x75,0x74,0x2e,
    0x74,0x65,0x78,0x43,0x6f,0x6f,0x72,0x64,0x20,0x3d,0x20,0x74,0x65,0x78,0x43,0x6f,
    0x6f,0x72,0x64,0x3b,0x0a,0x20,0x20,0x20,0x20,0x73,0x74,0x61,0x67,0x65,0x5f,0x6f,
    0x75,0x74,0x70,0x75,0x74,0x2e,0x63,0x6f,0x6c,0x6f,0x72,0x20,0x3d,0x20,0x63,0x6f,
    0x6c,0x6f,0x72,0x3b,0x0a,0x20,0x20,0x20,0x20,0x72,0x65,0x74,0x75,0x72,0x6e,0x20,
    0x73,0x74,0x61,0x67,0x65,0x5f,0x6f,0x75,0x74,0x70,0x75,0x74,0x3b,0x0a,0x7d,0x0a,
    0x00,
}
/*
    static float4 frag_color;
    static float4 color;
    static float2 texCoord;

    struct SPIRV_Cross_Input
    {
        float2 texCoord : TEXCOORD0;
        float4 color : TEXCOORD1;
    };

    struct SPIRV_Cross_Output
    {
        float4 frag_color : SV_Target0;
    };

    void frag_main()
    {
        frag_color = color;
    }

    SPIRV_Cross_Output main(SPIRV_Cross_Input stage_input)
    {
        color = stage_input.color;
        texCoord = stage_input.texCoord;
        frag_main();
        SPIRV_Cross_Output stage_output;
        stage_output.frag_color = frag_color;
        return stage_output;
    }
*/
@(private)
fs_source_hlsl5 := [529]u8 {
    0x73,0x74,0x61,0x74,0x69,0x63,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,0x66,0x72,
    0x61,0x67,0x5f,0x63,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x73,0x74,0x61,0x74,0x69,0x63,
    0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,0x63,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x73,
    0x74,0x61,0x74,0x69,0x63,0x20,0x66,0x6c,0x6f,0x61,0x74,0x32,0x20,0x74,0x65,0x78,
    0x43,0x6f,0x6f,0x72,0x64,0x3b,0x0a,0x0a,0x73,0x74,0x72,0x75,0x63,0x74,0x20,0x53,
    0x50,0x49,0x52,0x56,0x5f,0x43,0x72,0x6f,0x73,0x73,0x5f,0x49,0x6e,0x70,0x75,0x74,
    0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x66,0x6c,0x6f,0x61,0x74,0x32,0x20,0x74,0x65,
    0x78,0x43,0x6f,0x6f,0x72,0x64,0x20,0x3a,0x20,0x54,0x45,0x58,0x43,0x4f,0x4f,0x52,
    0x44,0x30,0x3b,0x0a,0x20,0x20,0x20,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,0x63,
    0x6f,0x6c,0x6f,0x72,0x20,0x3a,0x20,0x54,0x45,0x58,0x43,0x4f,0x4f,0x52,0x44,0x31,
    0x3b,0x0a,0x7d,0x3b,0x0a,0x0a,0x73,0x74,0x72,0x75,0x63,0x74,0x20,0x53,0x50,0x49,
    0x52,0x56,0x5f,0x43,0x72,0x6f,0x73,0x73,0x5f,0x4f,0x75,0x74,0x70,0x75,0x74,0x0a,
    0x7b,0x0a,0x20,0x20,0x20,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,0x66,0x72,0x61,
    0x67,0x5f,0x63,0x6f,0x6c,0x6f,0x72,0x20,0x3a,0x20,0x53,0x56,0x5f,0x54,0x61,0x72,
    0x67,0x65,0x74,0x30,0x3b,0x0a,0x7d,0x3b,0x0a,0x0a,0x76,0x6f,0x69,0x64,0x20,0x66,
    0x72,0x61,0x67,0x5f,0x6d,0x61,0x69,0x6e,0x28,0x29,0x0a,0x7b,0x0a,0x20,0x20,0x20,
    0x20,0x66,0x72,0x61,0x67,0x5f,0x63,0x6f,0x6c,0x6f,0x72,0x20,0x3d,0x20,0x63,0x6f,
    0x6c,0x6f,0x72,0x3b,0x0a,0x7d,0x0a,0x0a,0x53,0x50,0x49,0x52,0x56,0x5f,0x43,0x72,
    0x6f,0x73,0x73,0x5f,0x4f,0x75,0x74,0x70,0x75,0x74,0x20,0x6d,0x61,0x69,0x6e,0x28,
    0x53,0x50,0x49,0x52,0x56,0x5f,0x43,0x72,0x6f,0x73,0x73,0x5f,0x49,0x6e,0x70,0x75,
    0x74,0x20,0x73,0x74,0x61,0x67,0x65,0x5f,0x69,0x6e,0x70,0x75,0x74,0x29,0x0a,0x7b,
    0x0a,0x20,0x20,0x20,0x20,0x63,0x6f,0x6c,0x6f,0x72,0x20,0x3d,0x20,0x73,0x74,0x61,
    0x67,0x65,0x5f,0x69,0x6e,0x70,0x75,0x74,0x2e,0x63,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,
    0x20,0x20,0x20,0x20,0x74,0x65,0x78,0x43,0x6f,0x6f,0x72,0x64,0x20,0x3d,0x20,0x73,
    0x74,0x61,0x67,0x65,0x5f,0x69,0x6e,0x70,0x75,0x74,0x2e,0x74,0x65,0x78,0x43,0x6f,
    0x6f,0x72,0x64,0x3b,0x0a,0x20,0x20,0x20,0x20,0x66,0x72,0x61,0x67,0x5f,0x6d,0x61,
    0x69,0x6e,0x28,0x29,0x3b,0x0a,0x20,0x20,0x20,0x20,0x53,0x50,0x49,0x52,0x56,0x5f,
    0x43,0x72,0x6f,0x73,0x73,0x5f,0x4f,0x75,0x74,0x70,0x75,0x74,0x20,0x73,0x74,0x61,
    0x67,0x65,0x5f,0x6f,0x75,0x74,0x70,0x75,0x74,0x3b,0x0a,0x20,0x20,0x20,0x20,0x73,
    0x74,0x61,0x67,0x65,0x5f,0x6f,0x75,0x74,0x70,0x75,0x74,0x2e,0x66,0x72,0x61,0x67,
    0x5f,0x63,0x6f,0x6c,0x6f,0x72,0x20,0x3d,0x20,0x66,0x72,0x61,0x67,0x5f,0x63,0x6f,
    0x6c,0x6f,0x72,0x3b,0x0a,0x20,0x20,0x20,0x20,0x72,0x65,0x74,0x75,0x72,0x6e,0x20,
    0x73,0x74,0x61,0x67,0x65,0x5f,0x6f,0x75,0x74,0x70,0x75,0x74,0x3b,0x0a,0x7d,0x0a,
    0x00,
}
ui_shader_desc :: proc (backend: sg.Backend) -> sg.Shader_Desc {
    desc: sg.Shader_Desc
    desc.label = "ui_shader"
    #partial switch backend {
    case .GLCORE:
        desc.attrs[0].name = "pos"
        desc.attrs[1].name = "uv"
        desc.attrs[2].name = "col"
        desc.vs.source = transmute(cstring)&vs_source_glsl430
        desc.vs.entry = "main"
        desc.vs.uniform_blocks[0].size = 16
        desc.vs.uniform_blocks[0].layout = .STD140
        desc.vs.uniform_blocks[0].uniforms[0].name = "tex"
        desc.vs.uniform_blocks[0].uniforms[0].type = .FLOAT4
        desc.vs.uniform_blocks[0].uniforms[0].array_count = 1
        desc.fs.source = transmute(cstring)&fs_source_glsl430
        desc.fs.entry = "main"
    case .GLES3:
        desc.attrs[0].name = "pos"
        desc.attrs[1].name = "uv"
        desc.attrs[2].name = "col"
        desc.vs.source = transmute(cstring)&vs_source_glsl300es
        desc.vs.entry = "main"
        desc.vs.uniform_blocks[0].size = 16
        desc.vs.uniform_blocks[0].layout = .STD140
        desc.vs.uniform_blocks[0].uniforms[0].name = "tex"
        desc.vs.uniform_blocks[0].uniforms[0].type = .FLOAT4
        desc.vs.uniform_blocks[0].uniforms[0].array_count = 1
        desc.fs.source = transmute(cstring)&fs_source_glsl300es
        desc.fs.entry = "main"
    case .D3D11:
        desc.attrs[0].sem_name = "TEXCOORD"
        desc.attrs[0].sem_index = 0
        desc.attrs[1].sem_name = "TEXCOORD"
        desc.attrs[1].sem_index = 1
        desc.attrs[2].sem_name = "TEXCOORD"
        desc.attrs[2].sem_index = 2
        desc.vs.source = transmute(cstring)&vs_source_hlsl5
        desc.vs.d3d11_target = "vs_5_0"
        desc.vs.entry = "main"
        desc.vs.uniform_blocks[0].size = 16
        desc.vs.uniform_blocks[0].layout = .STD140
        desc.fs.source = transmute(cstring)&fs_source_hlsl5
        desc.fs.d3d11_target = "ps_5_0"
        desc.fs.entry = "main"
    }
    return desc
}
