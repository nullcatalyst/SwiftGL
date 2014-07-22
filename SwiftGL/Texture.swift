//
//  Texture.swift
//  SwiftGL
//
//  Created by Scott Bennett on 2014-06-15.
//  Copyright (c) 2014 Scott Bennett. All rights reserved.
//

import Foundation
import CoreGraphics

#if os(OSX)
import OpenGL
#else
import OpenGLES
#endif

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
    
    func load(#filename: CFString) -> Bool {
        return load(filename: filename, antialias: false, flipVertical: false)
    }
    
    func load(#filename: CFString, antialias: Bool) -> Bool {
        return load(filename: filename, antialias: antialias, flipVertical: false)
    }
    
    func load(#filename: CFString, flipVertical: Bool) -> Bool {
        return load(filename: filename, antialias: false, flipVertical: flipVertical)
    }
    
    /// @return true on success
    func load(#filename: CFString, antialias: Bool, flipVertical: Bool) -> Bool {
        let imageData = Texture.load(filename: filename, width: &width, height: &height, flipVertical: flipVertical)
        
        glBindTexture(GL_TEXTURE_2D, id)
        
        if antialias {
            glTexParameteri(GL_TEXTURE_2D, GLenum(GL_TEXTURE_MIN_FILTER), GL_LINEAR_MIPMAP_LINEAR)
            glTexParameteri(GL_TEXTURE_2D, GLenum(GL_TEXTURE_MAG_FILTER), GL_LINEAR)
        } else {
            glTexParameteri(GL_TEXTURE_2D, GLenum(GL_TEXTURE_MIN_FILTER), GL_NEAREST)
            glTexParameteri(GL_TEXTURE_2D, GLenum(GL_TEXTURE_MAG_FILTER), GL_NEAREST)
        }
        
        glTexParameteri(GL_TEXTURE_2D, GLenum(GL_TEXTURE_WRAP_S), GL_CLAMP_TO_EDGE)
        glTexParameteri(GL_TEXTURE_2D, GLenum(GL_TEXTURE_WRAP_T), GL_CLAMP_TO_EDGE)
        
        #if os(OSX)
        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA8, width, height, 0, GLenum(GL_BGRA), GLenum(GL_UNSIGNED_INT_8_8_8_8_REV), ConstUnsafePointer(imageData.value))
        #else
        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, width, height, 0, GLenum(GL_RGBA), GL_UNSIGNED_BYTE, ConstUnsafePointer(imageData.value))
        #endif
        
        if antialias {
            glGenerateMipmap(GL_TEXTURE_2D)
        }
        
        free(imageData)
        return false
    }
    
    class func load(#filename: String, inout width: GLsizei, inout height: GLsizei, flipVertical: Bool) -> UnsafePointer<()> {
        let url = CFBundleCopyResourceURL(CFBundleGetMainBundle(), filename.bridgeToObjectiveC(), "", nil)
        let imageSource = CGImageSourceCreateWithURL(url, nil).takeRetainedValue()
        let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil).takeRetainedValue()
        
        width  = GLsizei(CGImageGetWidth(image))
        height = GLsizei(CGImageGetHeight(image))
        
        let rect = CGRectMake(0, 0, CGFloat(width), CGFloat(height))
        let colourSpace = CGColorSpaceCreateDeviceRGB()
        
        let imageData = malloc(UInt(width * height * 4))
        let ctx = CGBitmapContextCreate(imageData, UInt(width), UInt(height), 8, UInt(width * 4), colourSpace, CGBitmapInfo.ByteOrderDefault | CGBitmapInfo(CGImageAlphaInfo.PremultipliedFirst.toRaw()))
        
        if flipVertical {
            CGContextTranslateCTM(ctx, 0, CGFloat(height))
            CGContextScaleCTM(ctx, 1, -1)
        }
        
        CGContextSetBlendMode(ctx, kCGBlendModeCopy)
        CGContextDrawImage(ctx, rect, image)
        
        // The caller is required to free the imageData buffer
        return imageData
    }
}
