//
//  Texture.swift
//  SwiftGL
//
//  Created by Scott Bennett on 2014-06-15.
//  Copyright (c) 2014 Scott Bennett. All rights reserved.
//

import Foundation
import CoreGraphics

class Texture {
    var id: GLuint
    var width: GLsizei
    var height: GLsizei
    
    init() {
        id = 0
        width = 0
        height = 0
        glGenTextures(1, &id)
    }
    
    deinit {
        glDeleteTextures(1, &id)
    }
    
    /// @return true on success
    func load(filename: CFString, antialias: Bool = true, flipVertical: Bool = false) -> Bool {
        let imageData = swglLoadTexture(filename, &width, &height)
        
        glBindTexture(GLenum(GL_TEXTURE_2D), id)
        glPixelStorei(GLenum(GL_UNPACK_ROW_LENGTH), GLint(width))
        glPixelStorei(GLenum(GL_UNPACK_ALIGNMENT), 1)
        
        if antialias {
            glTexParameteri(GLenum(GL_TEXTURE_2D), GLenum(GL_TEXTURE_MIN_FILTER), GL_LINEAR_MIPMAP_LINEAR)
            glTexParameteri(GLenum(GL_TEXTURE_2D), GLenum(GL_TEXTURE_MAG_FILTER), GL_LINEAR)
        } else {
            glTexParameteri(GLenum(GL_TEXTURE_2D), GLenum(GL_TEXTURE_MIN_FILTER), GL_NEAREST)
            glTexParameteri(GLenum(GL_TEXTURE_2D), GLenum(GL_TEXTURE_MAG_FILTER), GL_NEAREST)
        }
        
        glTexParameteri(GLenum(GL_TEXTURE_2D), GLenum(GL_TEXTURE_WRAP_S), GL_CLAMP_TO_EDGE)
        glTexParameteri(GLenum(GL_TEXTURE_2D), GLenum(GL_TEXTURE_WRAP_T), GL_CLAMP_TO_EDGE)
        
        glTexImage2D(GLenum(GL_TEXTURE_2D), 0, GL_RGBA8, width, height, 0, GLenum(GL_BGRA), GLenum(GL_UNSIGNED_INT_8_8_8_8_REV), CConstVoidPointer(self, imageData.value))
        
        if antialias {
            glGenerateMipmap(GLenum(GL_TEXTURE_2D))
        }
        
        free(imageData)
        return false
    }
}
