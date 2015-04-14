uniform mat4 Matrix;

attribute vec4 Position;
attribute vec4 Color;

varying lowp vec4 color;

void main() {
    color       = Color;
    gl_Position = Matrix * Position;
}
