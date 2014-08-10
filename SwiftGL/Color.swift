//
//  Color.swift
//  SwiftGL
//
//  Created by Scott Bennett on 2014-06-22.
//  Copyright (c) 2014 Scott Bennett. All rights reserved.
//

import Foundation

#if os(OSX)
import OpenGL
#else
import OpenGLES
#endif

public struct Color {
    public var r: GLubyte
    public var g: GLubyte
    public var b: GLubyte
    public var a: GLubyte
    
    public var vec: Vec4 {
        get {
            return Vec4(x: CFloat(r) / CFloat(GLubyte.max), y: CFloat(g) / CFloat(GLubyte.max), z: CFloat(b) / CFloat(GLubyte.max), w: CFloat(a) / CFloat(GLubyte.max))
        }
    }
    
    public init() {
        self.r = 0
        self.g = 0
        self.b = 0
        self.a = 0
    }
    
    // Explicit initializers
    
    public init(s: GLubyte) {
        self.r = s
        self.g = s
        self.b = s
        self.a = s
    }
    
    public init(sf: CFloat) {
        let val: GLubyte = GLubyte(CFloat(GLubyte.max) * sf)
        self.r = val
        self.g = val
        self.b = val
        self.a = val
    }
    
    public init(r: GLubyte, g: GLubyte, b: GLubyte, a: GLubyte = GLubyte.max) {
        self.r = r
        self.g = g
        self.b = b
        self.a = a
    }
    
    public init(rf: CFloat, gf: CFloat, bf: CFloat, af: CFloat = 1) {
        self.r = GLubyte(CFloat(GLubyte.max) * rf)
        self.g = GLubyte(CFloat(GLubyte.max) * gf)
        self.b = GLubyte(CFloat(GLubyte.max) * bf)
        self.a = GLubyte(CFloat(GLubyte.max) * af)
    }
    
    // Implicit initializers
    
    public init(_ hex: Int) {
        // This expects the format to be 0xAARRGGBB
        self.r = GLubyte((hex >> 16) & 0xFF)
        self.g = GLubyte((hex >>  8) & 0xFF)
        self.b = GLubyte((hex >>  0) & 0xFF)
        self.a = GLubyte((hex >> 24) & 0xFF)
        if a == 0 {a = 255}
    }
    
    public init(_ r: GLubyte, _ g: GLubyte, _ b: GLubyte, _ a: GLubyte = GLubyte.max) {
        self.r = r
        self.g = g
        self.b = b
        self.a = a
    }
    
    public init(_ rgb: Vec3, _ a: CFloat = 1) {
        self.r = GLubyte(CFloat(GLubyte.max) * rgb.x)
        self.g = GLubyte(CFloat(GLubyte.max) * rgb.y)
        self.b = GLubyte(CFloat(GLubyte.max) * rgb.z)
        self.a = GLubyte(CFloat(GLubyte.max) * a)
    }
    
    public init(_ rgba: Vec4) {
        self.r = GLubyte(CFloat(GLubyte.max) * rgba.x)
        self.g = GLubyte(CFloat(GLubyte.max) * rgba.y)
        self.b = GLubyte(CFloat(GLubyte.max) * rgba.z)
        self.a = GLubyte(CFloat(GLubyte.max) * rgba.w)
    }
}

// Allow checking if two colors are equal
extension Color: Equatable {}
public func == (a: Color, b: Color) -> Bool {return a.r == b.r && a.g == b.g && a.b == b.b && a.a == b.a}

// Color Infix Operators
public func + (a: Color, b: Color) -> Color {return Color(r: a.r + b.r, g: a.g + b.g, b: a.b + b.b, a: a.a + b.a)}
public func - (a: Color, b: Color) -> Color {return Color(r: a.r - b.r, g: a.g - b.g, b: a.b - b.b, a: a.a - b.a)}
public func * (a: Color, b: Color) -> Color {return Color(r: a.r * b.r, g: a.g * b.g, b: a.b * b.b, a: a.a * b.a)}
public func / (a: Color, b: Color) -> Color {return Color(r: a.r / b.r, g: a.g / b.g, b: a.b / b.b, a: a.a / b.a)}

// Color Scalar Operators
public func * (s: CFloat, c: Color) -> Color {return Color(s * c.vec)}
public func * (c: Color, s: CFloat) -> Color {return Color(c.vec * s)}
public func / (c: Color, s: CFloat) -> Color {return Color(c.vec / s)}

public func mix(a: Color, b: Color, t: Color)  -> Color {return mix(a, b, t.vec)}
public func mix(a: Color, b: Color, t: Vec4)   -> Color {return a + Color((b - a).vec * t)}
public func mix(a: Color, b: Color, t: CFloat) -> Color {return a + (b - a) * t}
