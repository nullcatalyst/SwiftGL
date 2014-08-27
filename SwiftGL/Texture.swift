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
import ImageIO
#endif

public class Texture {
    var id: GLuint
    var width: GLsizei
    var height: GLsizei
    
    public init() {
        id = 0
        width = 0
        height = 0
        glGenTextures(1, &id)
    }
    
    deinit {
        glDeleteTextures(1, &id)
    }
    
    public func load(#filename: String) -> Bool {
        return load(filename: filename, antialias: false, flipVertical: false)
    }
    
    public func load(#filename: String, antialias: Bool) -> Bool {
        return load(filename: filename, antialias: antialias, flipVertical: false)
    }
    
    public func load(#filename: String, flipVertical: Bool) -> Bool {
        return load(filename: filename, antialias: false, flipVertical: flipVertical)
    }
    
    /// @return true on success
    public func load(#filename: String, antialias: Bool, flipVertical: Bool) -> Bool {
        let imageData = Texture.Load(filename: filename, width: &width, height: &height, flipVertical: flipVertical)
        
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
        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA8, width, height, 0, GLenum(GL_BGRA), GLenum(GL_UNSIGNED_INT_8_8_8_8_REV), UnsafePointer(imageData))
        #else
        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, width, height, 0, GLenum(GL_RGBA), GL_UNSIGNED_BYTE, UnsafePointer(imageData))
        #endif
        
        if antialias {
            glGenerateMipmap(GL_TEXTURE_2D)
        }
        
        free(imageData)
        return false
    }
    
    private class func Load(#filename: String, inout width: GLsizei, inout height: GLsizei, flipVertical: Bool) -> UnsafeMutablePointer<()> {
        let url = CFBundleCopyResourceURL(CFBundleGetMainBundle(), filename as NSString, "", nil)
        
        let imageSource = CGImageSourceCreateWithURL(url, nil)
        let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
        
        width  = GLsizei(CGImageGetWidth(image))
        height = GLsizei(CGImageGetHeight(image))
        
        let zero: CGFloat = 0
        let rect = CGRectMake(zero, zero, CGFloat(Int(width)), CGFloat(Int(height)))
        let colourSpace = CGColorSpaceCreateDeviceRGB()
        
        let imageData: UnsafeMutablePointer<()> = malloc(UInt(width * height * 4))
        let ctx = CGBitmapContextCreate(imageData, UInt(width), UInt(height), 8, UInt(width * 4), colourSpace, CGBitmapInfo.ByteOrderDefault | CGBitmapInfo(CGImageAlphaInfo.PremultipliedFirst.toRaw()))
        
        if flipVertical {
            CGContextTranslateCTM(ctx, zero, CGFloat(Int(height)))
            CGContextScaleCTM(ctx, 1, -1)
        }
        
        CGContextSetBlendMode(ctx, kCGBlendModeCopy)
        CGContextDrawImage(ctx, rect, image)
        
        // The caller is required to free the imageData buffer
        return imageData
    }
}
