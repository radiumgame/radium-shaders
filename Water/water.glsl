#version 330 core

out vec4 fragColor;

uniform sampler2D MainTex;
uniform float noiseScale;
uniform Color waterColor;
uniform Color rippleColor;
uniform float rippleSlimness;
uniform float timeScale;

void main() {
    vec2 sample = (getNoiseSample() + (time * timeScale)) / noiseScale; 
    float noise = pow(voronoi(sample), rippleSlimness);
    vec3 final = noise * rgb(rippleColor);
    fragColor = vec4(final + rgb(waterColor), 1.0f);
}