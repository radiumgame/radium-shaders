#version 330 core

out vec4 fragColor;

uniform sampler2D MainTex;
uniform float noiseScale;
uniform float heightCutoff;

void main() {
    vec2 sample = gl_FragCoord.xy;
    sample /= noiseScale;
    float noise = perlin(sample);
    float cutoff = worldPosition.y + noise;
    float alpha = step(heightCutoff, cutoff);
    fragColor = texture(MainTex, uv);
    fragColor.a = alpha;
}