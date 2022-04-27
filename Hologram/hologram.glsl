#version 330 core

out vec4 outColor;

uniform sampler2D HologramTexture;
uniform Color col;
uniform float hologramLinesTiling;
uniform float hologramSpeed;
uniform float transparencyLevel;

void main() {
    outColor = rgba(col);
    
    vec2 uv = tile(HologramTexture, vec2(1, hologramLinesTiling));
    uv.y -= time * hologramSpeed;

    vec4 hologramLines = texture(HologramTexture, uv);
    float alpha = (hologramLines.r + hologramLines.g + hologramLines.b) / 3.0;
    outColor.a = alpha / transparencyLevel;
}