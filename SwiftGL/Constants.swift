//
//  Constants.swift
//  SwiftGL
//
//  Created by Scott Bennett on 2014-06-17.
//  Copyright (c) 2014 Scott Bennett. All rights reserved.
//

import Foundation

#if os(OSX)

import OpenGL

// Boolean Constants
let GL_FALSE                = GLboolean(OpenGL.GL_FALSE)
let GL_TRUE                 = GLboolean(OpenGL.GL_TRUE)

// Clear Buffer Constants
let GL_COLOR_BUFFER_BIT     = GLbitfield(OpenGL.GL_COLOR_BUFFER_BIT)
let GL_DEPTH_BUFFER_BIT     = GLbitfield(OpenGL.GL_DEPTH_BUFFER_BIT)
let GL_STENCIL_BUFFER_BIT   = GLbitfield(OpenGL.GL_STENCIL_BUFFER_BIT)

// Primitive Type Constants
let GL_POINTS               = GLenum(OpenGL.GL_POINTS)
let GL_LINES                = GLenum(OpenGL.GL_LINES)
let GL_LINE_LOOP            = GLenum(OpenGL.GL_LINE_LOOP)
let GL_LINE_STRIP           = GLenum(OpenGL.GL_LINE_STRIP)
let GL_TRIANGLES            = GLenum(OpenGL.GL_TRIANGLES)
let GL_TRIANGLE_FAN         = GLenum(OpenGL.GL_TRIANGLE_FAN)
let GL_TRIANGLE_STRIP       = GLenum(OpenGL.GL_TRIANGLE_STRIP)
let GL_QUADS                = GLenum(OpenGL.GL_QUADS)

// Shader Constants
let GL_VERTEX_SHADER        = GLenum(OpenGL.GL_VERTEX_SHADER)
let GL_FRAGMENT_SHADER      = GLenum(OpenGL.GL_FRAGMENT_SHADER)
let GL_GEOMETRY_SHADER      = GLenum(OpenGL.GL_GEOMETRY_SHADER)

// Vertex Buffer Object
let GL_ARRAY_BUFFER         = GLenum(OpenGL.GL_ARRAY_BUFFER)
let GL_ELEMENT_ARRAY_BUFFER = GLenum(OpenGL.GL_ELEMENT_ARRAY_BUFFER)
let GL_DYNAMIC_DRAW         = GLenum(OpenGL.GL_DYNAMIC_DRAW)
let GL_STATIC_DRAW          = GLenum(OpenGL.GL_STATIC_DRAW)

// Texture Constants
let GL_TEXTURE_2D           = GLenum(OpenGL.GL_TEXTURE_2D)
let GL_TEXTURE0             = GLenum(OpenGL.GL_TEXTURE0)

// Type Constants
let GL_BYTE                 = GLenum(OpenGL.GL_BYTE)
let GL_SHORT                = GLenum(OpenGL.GL_SHORT)
let GL_INT                  = GLenum(OpenGL.GL_INT)
let GL_FLOAT                = GLenum(OpenGL.GL_FLOAT)
let GL_DOUBLE               = GLenum(OpenGL.GL_DOUBLE)
let GL_UNSIGNED_BYTE        = GLenum(OpenGL.GL_UNSIGNED_BYTE)
let GL_UNSIGNED_SHORT       = GLenum(OpenGL.GL_UNSIGNED_SHORT)
let GL_UNSIGNED_INT         = GLenum(OpenGL.GL_UNSIGNED_INT)

// Comparison Constants
let GL_NEVER                = GLenum(OpenGL.GL_NEVER)
let GL_ALWAYS               = GLenum(OpenGL.GL_ALWAYS)
let GL_EQUAL                = GLenum(OpenGL.GL_EQUAL)
let GL_NOTEQUAL             = GLenum(OpenGL.GL_NOTEQUAL)
let GL_LESS                 = GLenum(OpenGL.GL_LESS)
let GL_GREATER              = GLenum(OpenGL.GL_GREATER)
let GL_LEQUAL               = GLenum(OpenGL.GL_LEQUAL)
let GL_GEQUAL               = GLenum(OpenGL.GL_GEQUAL)

// Enable Constants
let GL_BLEND                = GLenum(OpenGL.GL_BLEND)
let GL_DEPTH_TEST           = GLenum(OpenGL.GL_DEPTH_TEST)
let GL_CULL_FACE            = GLenum(OpenGL.GL_CULL_FACE)

// Blend Constants
let GL_ZERO                 = GLenum(OpenGL.GL_ZERO)
let GL_ONE                  = GLenum(OpenGL.GL_ONE)
let GL_SRC_ALPHA            = GLenum(OpenGL.GL_SRC_ALPHA)
let GL_ONE_MINUS_SRC_ALPHA  = GLenum(OpenGL.GL_ONE_MINUS_SRC_ALPHA)

// Cull Face Constants
let GL_FRONT                = GLenum(OpenGL.GL_FRONT)
let GL_BACK                 = GLenum(OpenGL.GL_BACK)
let GL_FRONT_AND_BACK       = GLenum(OpenGL.GL_FRONT_AND_BACK)

#else

import OpenGLES

// Boolean Constants
let GL_FALSE                = GLboolean(OpenGLES.GL_FALSE)
let GL_TRUE                 = GLboolean(OpenGLES.GL_TRUE)

// Clear Buffer Constants
let GL_COLOR_BUFFER_BIT     = GLbitfield(OpenGLES.GL_COLOR_BUFFER_BIT)
let GL_DEPTH_BUFFER_BIT     = GLbitfield(OpenGLES.GL_DEPTH_BUFFER_BIT)
let GL_STENCIL_BUFFER_BIT   = GLbitfield(OpenGLES.GL_STENCIL_BUFFER_BIT)

// Primitive Type Constants
let GL_POINTS               = GLenum(OpenGLES.GL_POINTS)
let GL_LINES                = GLenum(OpenGLES.GL_LINES)
let GL_LINE_LOOP            = GLenum(OpenGLES.GL_LINE_LOOP)
let GL_LINE_STRIP           = GLenum(OpenGLES.GL_LINE_STRIP)
let GL_TRIANGLES            = GLenum(OpenGLES.GL_TRIANGLES)
let GL_TRIANGLE_FAN         = GLenum(OpenGLES.GL_TRIANGLE_FAN)
let GL_TRIANGLE_STRIP       = GLenum(OpenGLES.GL_TRIANGLE_STRIP)

// Shader Constants
let GL_VERTEX_SHADER        = GLenum(OpenGLES.GL_VERTEX_SHADER)
let GL_FRAGMENT_SHADER      = GLenum(OpenGLES.GL_FRAGMENT_SHADER)

// Vertex Buffer Object
let GL_ARRAY_BUFFER         = GLenum(OpenGLES.GL_ARRAY_BUFFER)
let GL_ELEMENT_ARRAY_BUFFER = GLenum(OpenGLES.GL_ELEMENT_ARRAY_BUFFER)
let GL_DYNAMIC_DRAW         = GLenum(OpenGLES.GL_DYNAMIC_DRAW)
let GL_STATIC_DRAW          = GLenum(OpenGLES.GL_STATIC_DRAW)

// Texture Constants
let GL_TEXTURE_2D           = GLenum(OpenGLES.GL_TEXTURE_2D)
let GL_TEXTURE0             = GLenum(OpenGLES.GL_TEXTURE0)

// Type Constants
let GL_BYTE                 = GLenum(OpenGLES.GL_BYTE)
let GL_SHORT                = GLenum(OpenGLES.GL_SHORT)
let GL_INT                  = GLenum(OpenGLES.GL_INT)
let GL_FLOAT                = GLenum(OpenGLES.GL_FLOAT)
let GL_UNSIGNED_BYTE        = GLenum(OpenGLES.GL_UNSIGNED_BYTE)
let GL_UNSIGNED_SHORT       = GLenum(OpenGLES.GL_UNSIGNED_SHORT)
let GL_UNSIGNED_INT         = GLenum(OpenGLES.GL_UNSIGNED_INT)

// Comparison Constants
let GL_NEVER                = GLenum(OpenGLES.GL_NEVER)
let GL_ALWAYS               = GLenum(OpenGLES.GL_ALWAYS)
let GL_EQUAL                = GLenum(OpenGLES.GL_EQUAL)
let GL_NOTEQUAL             = GLenum(OpenGLES.GL_NOTEQUAL)
let GL_LESS                 = GLenum(OpenGLES.GL_LESS)
let GL_GREATER              = GLenum(OpenGLES.GL_GREATER)
let GL_LEQUAL               = GLenum(OpenGLES.GL_LEQUAL)
let GL_GEQUAL               = GLenum(OpenGLES.GL_GEQUAL)

// Enable Constants
let GL_BLEND                = GLenum(OpenGLES.GL_BLEND)
let GL_DEPTH_TEST           = GLenum(OpenGLES.GL_DEPTH_TEST)
let GL_CULL_FACE            = GLenum(OpenGLES.GL_CULL_FACE)

// Blend Constants
let GL_ZERO                 = GLenum(OpenGLES.GL_ZERO)
let GL_ONE                  = GLenum(OpenGLES.GL_ONE)
let GL_SRC_ALPHA            = GLenum(OpenGLES.GL_SRC_ALPHA)
let GL_ONE_MINUS_SRC_ALPHA  = GLenum(OpenGLES.GL_ONE_MINUS_SRC_ALPHA)

// Cull Face Constants
let GL_FRONT                = GLenum(OpenGLES.GL_FRONT)
let GL_BACK                 = GLenum(OpenGLES.GL_BACK)
let GL_FRONT_AND_BACK       = GLenum(OpenGLES.GL_FRONT_AND_BACK)

#endif
