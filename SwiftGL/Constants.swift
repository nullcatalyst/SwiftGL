//
//  Constants.swift
//  SwiftGL
//
//  Created by Scott Bennett on 2014-06-17.
//  Copyright (c) 2014 Scott Bennett. All rights reserved.
//

import Foundation
import OpenGL

let GL_FALSE                = GLboolean(OpenGL.GL_FALSE)
let GL_TRUE                 = GLboolean(OpenGL.GL_TRUE)

let GL_COLOR_BUFFER_BIT     = GLbitfield(OpenGL.GL_COLOR_BUFFER_BIT)
let GL_DEPTH_BUFFER_BIT     = GLbitfield(OpenGL.GL_DEPTH_BUFFER_BIT)
let GL_STENCIL_BUFFER_BIT   = GLbitfield(OpenGL.GL_STENCIL_BUFFER_BIT)

let GL_POINTS               = GLenum(OpenGL.GL_POINTS)
let GL_LINES                = GLenum(OpenGL.GL_LINES)
let GL_LINE_LOOP            = GLenum(OpenGL.GL_LINE_LOOP)
let GL_LINE_STRIP           = GLenum(OpenGL.GL_LINE_STRIP)
let GL_TRIANGLES            = GLenum(OpenGL.GL_TRIANGLES)
let GL_TRIANGLE_FAN         = GLenum(OpenGL.GL_TRIANGLE_FAN)
let GL_TRIANGLE_STRIP       = GLenum(OpenGL.GL_TRIANGLE_STRIP)

let GL_VERTEX_SHADER        = GLenum(OpenGL.GL_VERTEX_SHADER)
let GL_FRAGMENT_SHADER      = GLenum(OpenGL.GL_FRAGMENT_SHADER)
#if os(OSX)
let GL_GEOMETRY_SHADER      = GLenum(OpenGL.GL_GEOMETRY_SHADER)
#endif

let GL_ARRAY_BUFFER         = GLenum(OpenGL.GL_ARRAY_BUFFER)
let GL_ELEMENT_ARRAY_BUFFER = GLenum(OpenGL.GL_ELEMENT_ARRAY_BUFFER)
let GL_DYNAMIC_DRAW         = GLenum(OpenGL.GL_DYNAMIC_DRAW)
let GL_STATIC_DRAW          = GLenum(OpenGL.GL_STATIC_DRAW)

let GL_TEXTURE_2D           = GLenum(OpenGL.GL_TEXTURE_2D)
let GL_TEXTURE0             = GLenum(OpenGL.GL_TEXTURE0)

let GL_BYTE                 = GLenum(OpenGL.GL_BYTE)
let GL_SHORT                = GLenum(OpenGL.GL_SHORT)
let GL_INT                  = GLenum(OpenGL.GL_INT)
let GL_FLOAT                = GLenum(OpenGL.GL_FLOAT)
let GL_DOUBLE               = GLenum(OpenGL.GL_DOUBLE)
let GL_UNSIGNED_BYTE        = GLenum(OpenGL.GL_UNSIGNED_BYTE)
let GL_UNSIGNED_SHORT       = GLenum(OpenGL.GL_UNSIGNED_SHORT)
let GL_UNSIGNED_INT         = GLenum(OpenGL.GL_UNSIGNED_INT)
