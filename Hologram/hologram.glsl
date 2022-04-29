#version 330 core

out vec4 fragColor;

uniform sampler2D HologramTexture;
uniform Color col;
uniform float hologramLinesTiling;
uniform float hologramSpeed;
uniform float transparencyLevel;

void main() {
    fragColor = rgba(col);
    
    vec2 newUV = tile(HologramTexture, vec2(1, hologramLinesTiling));
    newUV.y -= time * hologramSpeed;

    vec4 hologramLines = texture(HologramTexture, newUV);
    float alpha = (hologramLines.r + hologramLines.g + hologramLines.b) / 3.0;
    fragColor.a = alpha / transparencyLevel;
}