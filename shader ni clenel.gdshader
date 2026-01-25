shader_type canvas_item;

uniform float blur_strength = 4.0;

void fragment() {
    vec2 size = blur_strength / vec2(textureSize(TEXTURE, 0));
    vec4 color = vec4(0.0);

    color += texture(TEXTURE, UV + vec2(-size.x, -size.y));
    color += texture(TEXTURE, UV + vec2( 0.0, -size.y));
    color += texture(TEXTURE, UV + vec2( size.x, -size.y));

    color += texture(TEXTURE, UV + vec2(-size.x,  0.0));
    color += texture(TEXTURE, UV);
    color += texture(TEXTURE, UV + vec2( size.x,  0.0));

    color += texture(TEXTURE, UV + vec2(-size.x,  size.y));
    color += texture(TEXTURE, UV + vec2( 0.0,  size.y));
    color += texture(TEXTURE, UV + vec2( size.x,  size.y));

    COLOR = color / 9.0;
}