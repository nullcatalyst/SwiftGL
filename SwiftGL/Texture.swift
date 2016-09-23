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

open class Texture {
    var id: GLuint
    var width: GLsizei
    var height: GLsizei

    public init() {
        id = 0
        width = 0
        height = 0
        glGenTextures(1, &id)
    }

    public convenience init(filename: String) {
        self.init()

        _ = load(filename)
    }

    deinit {
        glDeleteTextures(1, &id)
    }

    open func load(_ filename: String) -> Bool {
        return load(filename, antialias: false, flipVertical: false)
    }

    open func load(_ filename: String, antialias: Bool) -> Bool {
        return load(filename, antialias: antialias, flipVertical: false)
    }

    open func load(_ filename: String, flipVertical: Bool) -> Bool {
        return load(filename, antialias: false, flipVertical: flipVertical)
    }

    /// @return true on success
    open func load(_ filename: String, antialias: Bool, flipVertical: Bool) -> Bool {
        let imageData = Texture.Load(filename, width: &width, height: &height, flipVertical: flipVertical)

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
            glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA8, width, height, 0, GLenum(GL_BGRA), GLenum(GL_UNSIGNED_INT_8_8_8_8_REV), imageData)
        #else
            glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, width, height, 0, GLenum(GL_RGBA), GL_UNSIGNED_BYTE, imageData)
        #endif

        if antialias {
            glGenerateMipmap(GL_TEXTURE_2D)
        }

        free(imageData)
        return false
    }

    fileprivate class func Load(_ filename: String, width: inout GLsizei, height: inout GLsizei, flipVertical: Bool) -> UnsafeMutableRawPointer {
        let url = CFBundleCopyResourceURL(CFBundleGetMainBundle(), filename as NSString, "" as CFString!, nil)

        let imageSource = CGImageSourceCreateWithURL(url!, nil)
        let image = CGImageSourceCreateImageAtIndex(imageSource!, 0, nil)

        width = GLsizei((image?.width)!)
        height = GLsizei((image?.height)!)

        let zero: CGFloat = 0
        let rect = CGRect(x: zero, y: zero, width: CGFloat(Int(width)), height: CGFloat(Int(height)))
        let colourSpace = CGColorSpaceCreateDeviceRGB()

        let imageData: UnsafeMutableRawPointer = malloc(Int(width * height * 4))
        let ctx = CGContext(data: imageData, width: Int(width), height: Int(height), bitsPerComponent: 8, bytesPerRow: Int(width * 4), space: colourSpace, bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)

        if flipVertical {
            ctx?.translateBy(x: zero, y: CGFloat(Int(height)))
            ctx?.scaleBy(x: 1, y: -1)
        }

        ctx?.setBlendMode(CGBlendMode.copy)
        ctx?.draw(image!, in: rect)

        // The caller is required to free the imageData buffer
        return imageData
    }
}
