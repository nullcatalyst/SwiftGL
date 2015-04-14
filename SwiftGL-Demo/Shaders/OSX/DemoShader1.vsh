#version 330

uniform mat4 Matrix;

in vec4 Position;
in vec4 Color;

out vec4 color;

void main() {
    color       = Color;
    gl_Position = Matrix * Position;
}
