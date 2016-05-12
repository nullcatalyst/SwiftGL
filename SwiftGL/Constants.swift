//
//  Constants.swift
//  SwiftGL
//
//  Created by Scott Bennett on 2014-06-17.
//  Copyright (c) 2014 Scott Bennett. All rights reserved.
//

#if os(OSX)

    import OpenGL.GL3

// glDebug(__FILE__, __LINE__)
    public func glDebug(filename: String, line: Int) {
        var error = glGetError()
        while error != GLenum(GL_NO_ERROR) {
            var errMsg: String

            switch error {
            case GL_INVALID_ENUM: errMsg = "GL_INVALID_ENUM"
            case GL_INVALID_VALUE: errMsg = "GL_INVALID_VALUE"
            case GL_INVALID_OPERATION: errMsg = "GL_INVALID_OPERATION"
            case GL_INVALID_FRAMEBUFFER_OPERATION: errMsg = "GL_INVALID_FRAMEBUFFER_OPERATION"
            case GL_OUT_OF_MEMORY: errMsg = "GL_OUT_OF_MEMORY"
            default: errMsg = String(format: "0x%2X", error)
            }

            print("ERROR: \(filename):\(line) - \(errMsg)")
            error = glGetError()
        }
    }

// Boolean Constants
    public let GL_FALSE = GLboolean(OpenGL.GL_FALSE)
    public let GL_TRUE = GLboolean(OpenGL.GL_TRUE)

// Error Constants
    public let GL_NO_ERROR = GLenum(OpenGL.GL_NO_ERROR)
    public let GL_INVALID_ENUM = GLenum(OpenGL.GL_INVALID_ENUM)
    public let GL_INVALID_VALUE = GLenum(OpenGL.GL_INVALID_VALUE)
    public let GL_INVALID_OPERATION = GLenum(OpenGL.GL_INVALID_OPERATION)
    public let GL_INVALID_FRAMEBUFFER_OPERATION = GLenum(OpenGL.GL_INVALID_FRAMEBUFFER_OPERATION)
    public let GL_OUT_OF_MEMORY = GLenum(OpenGL.GL_OUT_OF_MEMORY)

// Clear Buffer Constants
    public let GL_COLOR_BUFFER_BIT = GLbitfield(OpenGL.GL_COLOR_BUFFER_BIT)
    public let GL_DEPTH_BUFFER_BIT = GLbitfield(OpenGL.GL_DEPTH_BUFFER_BIT)
    public let GL_STENCIL_BUFFER_BIT = GLbitfield(OpenGL.GL_STENCIL_BUFFER_BIT)

// Primitive Type Constants
    public let GL_POINTS = GLenum(OpenGL.GL_POINTS)
    public let GL_LINES = GLenum(OpenGL.GL_LINES)
    public let GL_LINE_LOOP = GLenum(OpenGL.GL_LINE_LOOP)
    public let GL_LINE_STRIP = GLenum(OpenGL.GL_LINE_STRIP)
    public let GL_TRIANGLES = GLenum(OpenGL.GL_TRIANGLES)
    public let GL_TRIANGLE_FAN = GLenum(OpenGL.GL_TRIANGLE_FAN)
    public let GL_TRIANGLE_STRIP = GLenum(OpenGL.GL_TRIANGLE_STRIP)
    public let GL_QUADS = GLenum(OpenGL.GL_QUADS)

// Shader Constants
    public let GL_VERTEX_SHADER = GLenum(OpenGL.GL_VERTEX_SHADER)
    public let GL_FRAGMENT_SHADER = GLenum(OpenGL.GL_FRAGMENT_SHADER)
    public let GL_GEOMETRY_SHADER = GLenum(OpenGL.GL_GEOMETRY_SHADER)

// Vertex Buffer Object
    public let GL_ARRAY_BUFFER = GLenum(OpenGL.GL_ARRAY_BUFFER)
    public let GL_ELEMENT_ARRAY_BUFFER = GLenum(OpenGL.GL_ELEMENT_ARRAY_BUFFER)
    public let GL_DYNAMIC_DRAW = GLenum(OpenGL.GL_DYNAMIC_DRAW)
    public let GL_STATIC_DRAW = GLenum(OpenGL.GL_STATIC_DRAW)

// Texture Constants
    public let GL_TEXTURE_2D = GLenum(OpenGL.GL_TEXTURE_2D)
    public let GL_TEXTURE0 = GLenum(OpenGL.GL_TEXTURE0)

// Type Constants
    public let GL_BYTE = GLenum(OpenGL.GL_BYTE)
    public let GL_SHORT = GLenum(OpenGL.GL_SHORT)
    public let GL_INT = GLenum(OpenGL.GL_INT)
    public let GL_FLOAT = GLenum(OpenGL.GL_FLOAT)
    public let GL_DOUBLE = GLenum(OpenGL.GL_DOUBLE)
    public let GL_UNSIGNED_BYTE = GLenum(OpenGL.GL_UNSIGNED_BYTE)
    public let GL_UNSIGNED_SHORT = GLenum(OpenGL.GL_UNSIGNED_SHORT)
    public let GL_UNSIGNED_INT = GLenum(OpenGL.GL_UNSIGNED_INT)

// Comparison Constants
    public let GL_NEVER = GLenum(OpenGL.GL_NEVER)
    public let GL_ALWAYS = GLenum(OpenGL.GL_ALWAYS)
    public let GL_EQUAL = GLenum(OpenGL.GL_EQUAL)
    public let GL_NOTEQUAL = GLenum(OpenGL.GL_NOTEQUAL)
    public let GL_LESS = GLenum(OpenGL.GL_LESS)
    public let GL_GREATER = GLenum(OpenGL.GL_GREATER)
    public let GL_LEQUAL = GLenum(OpenGL.GL_LEQUAL)
    public let GL_GEQUAL = GLenum(OpenGL.GL_GEQUAL)

// Enable Constants
    public let GL_BLEND = GLenum(OpenGL.GL_BLEND)
    public let GL_DEPTH_TEST = GLenum(OpenGL.GL_DEPTH_TEST)
    public let GL_CULL_FACE = GLenum(OpenGL.GL_CULL_FACE)

// Blend Constants
    public let GL_ZERO = GLenum(OpenGL.GL_ZERO)
    public let GL_ONE = GLenum(OpenGL.GL_ONE)
    public let GL_SRC_ALPHA = GLenum(OpenGL.GL_SRC_ALPHA)
    public let GL_ONE_MINUS_SRC_ALPHA = GLenum(OpenGL.GL_ONE_MINUS_SRC_ALPHA)

// Cull Face Constants
    public let GL_FRONT = GLenum(OpenGL.GL_FRONT)
    public let GL_BACK = GLenum(OpenGL.GL_BACK)
    public let GL_FRONT_AND_BACK = GLenum(OpenGL.GL_FRONT_AND_BACK)

#else

    import OpenGLES.ES2.gl

// glDebug(__FILE__, __LINE__)
    public func glDebug(filename: String, line: Int) {
        var error = glGetError()
        while error != GLenum(GL_NO_ERROR) {
            var errMsg: String

            switch error {
            case GL_INVALID_ENUM: errMsg = "GL_INVALID_ENUM"
            case GL_INVALID_VALUE: errMsg = "GL_INVALID_VALUE"
            case GL_INVALID_OPERATION: errMsg = "GL_INVALID_OPERATION"
            case GL_INVALID_FRAMEBUFFER_OPERATION: errMsg = "GL_INVALID_FRAMEBUFFER_OPERATION"
            case GL_OUT_OF_MEMORY: errMsg = "GL_OUT_OF_MEMORY"
            case GL_STACK_UNDERFLOW: errMsg = "GL_STACK_UNDERFLOW"
            case GL_STACK_OVERFLOW: errMsg = "GL_STACK_OVERFLOW"
            default: errMsg = String(format: "0x%2X", error)
            }

            print("ERROR: \(filename):\(line) - \(errMsg)")
            error = glGetError()
        }
    }

// Boolean Constants
    public let GL_FALSE = GLboolean(OpenGLES.GL_FALSE)
    public let GL_TRUE = GLboolean(OpenGLES.GL_TRUE)

// Error Constants
    public let GL_NO_ERROR = GLenum(OpenGLES.GL_NO_ERROR)
    public let GL_INVALID_ENUM = GLenum(OpenGLES.GL_INVALID_ENUM)
    public let GL_INVALID_VALUE = GLenum(OpenGLES.GL_INVALID_VALUE)
    public let GL_INVALID_OPERATION = GLenum(OpenGLES.GL_INVALID_OPERATION)
    public let GL_INVALID_FRAMEBUFFER_OPERATION = GLenum(OpenGLES.GL_INVALID_FRAMEBUFFER_OPERATION)
    public let GL_OUT_OF_MEMORY = GLenum(OpenGLES.GL_OUT_OF_MEMORY)
    public let GL_STACK_UNDERFLOW = GLenum(OpenGLES.GL_STACK_UNDERFLOW)
    public let GL_STACK_OVERFLOW = GLenum(OpenGLES.GL_STACK_OVERFLOW)

// Clear Buffer Constants
    public let GL_COLOR_BUFFER_BIT = GLbitfield(OpenGLES.GL_COLOR_BUFFER_BIT)
    public let GL_DEPTH_BUFFER_BIT = GLbitfield(OpenGLES.GL_DEPTH_BUFFER_BIT)
    public let GL_STENCIL_BUFFER_BIT = GLbitfield(OpenGLES.GL_STENCIL_BUFFER_BIT)

// Primitive Type Constants
    public let GL_POINTS = GLenum(OpenGLES.GL_POINTS)
    public let GL_LINES = GLenum(OpenGLES.GL_LINES)
    public let GL_LINE_LOOP = GLenum(OpenGLES.GL_LINE_LOOP)
    public let GL_LINE_STRIP = GLenum(OpenGLES.GL_LINE_STRIP)
    public let GL_TRIANGLES = GLenum(OpenGLES.GL_TRIANGLES)
    public let GL_TRIANGLE_FAN = GLenum(OpenGLES.GL_TRIANGLE_FAN)
    public let GL_TRIANGLE_STRIP = GLenum(OpenGLES.GL_TRIANGLE_STRIP)

// Shader Constants
    public let GL_VERTEX_SHADER = GLenum(OpenGLES.GL_VERTEX_SHADER)
    public let GL_FRAGMENT_SHADER = GLenum(OpenGLES.GL_FRAGMENT_SHADER)

// Vertex Buffer Object
    public let GL_ARRAY_BUFFER = GLenum(OpenGLES.GL_ARRAY_BUFFER)
    public let GL_ELEMENT_ARRAY_BUFFER = GLenum(OpenGLES.GL_ELEMENT_ARRAY_BUFFER)
    public let GL_DYNAMIC_DRAW = GLenum(OpenGLES.GL_DYNAMIC_DRAW)
    public let GL_STATIC_DRAW = GLenum(OpenGLES.GL_STATIC_DRAW)

// Texture Constants
    public let GL_TEXTURE_2D = GLenum(OpenGLES.GL_TEXTURE_2D)
    public let GL_TEXTURE0 = GLenum(OpenGLES.GL_TEXTURE0)

// Type Constants
    public let GL_BYTE = GLenum(OpenGLES.GL_BYTE)
    public let GL_SHORT = GLenum(OpenGLES.GL_SHORT)
    public let GL_INT = GLenum(OpenGLES.GL_INT)
    public let GL_FLOAT = GLenum(OpenGLES.GL_FLOAT)
    public let GL_UNSIGNED_BYTE = GLenum(OpenGLES.GL_UNSIGNED_BYTE)
    public let GL_UNSIGNED_SHORT = GLenum(OpenGLES.GL_UNSIGNED_SHORT)
    public let GL_UNSIGNED_INT = GLenum(OpenGLES.GL_UNSIGNED_INT)

// Comparison Constants
    public let GL_NEVER = GLenum(OpenGLES.GL_NEVER)
    public let GL_ALWAYS = GLenum(OpenGLES.GL_ALWAYS)
    public let GL_EQUAL = GLenum(OpenGLES.GL_EQUAL)
    public let GL_NOTEQUAL = GLenum(OpenGLES.GL_NOTEQUAL)
    public let GL_LESS = GLenum(OpenGLES.GL_LESS)
    public let GL_GREATER = GLenum(OpenGLES.GL_GREATER)
    public let GL_LEQUAL = GLenum(OpenGLES.GL_LEQUAL)
    public let GL_GEQUAL = GLenum(OpenGLES.GL_GEQUAL)

// Enable Constants
    public let GL_BLEND = GLenum(OpenGLES.GL_BLEND)
    public let GL_DEPTH_TEST = GLenum(OpenGLES.GL_DEPTH_TEST)
    public let GL_CULL_FACE = GLenum(OpenGLES.GL_CULL_FACE)

// Blend Constants
    public let GL_ZERO = GLenum(OpenGLES.GL_ZERO)
    public let GL_ONE = GLenum(OpenGLES.GL_ONE)
    public let GL_SRC_ALPHA = GLenum(OpenGLES.GL_SRC_ALPHA)
    public let GL_ONE_MINUS_SRC_ALPHA = GLenum(OpenGLES.GL_ONE_MINUS_SRC_ALPHA)

// Cull Face Constants
    public let GL_FRONT = GLenum(OpenGLES.GL_FRONT)
    public let GL_BACK = GLenum(OpenGLES.GL_BACK)
    public let GL_FRONT_AND_BACK = GLenum(OpenGLES.GL_FRONT_AND_BACK)

#endif
