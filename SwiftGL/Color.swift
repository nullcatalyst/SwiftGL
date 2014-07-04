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

struct Color {
    var r: GLubyte
    var g: GLubyte
    var b: GLubyte
    var a: GLubyte
    
    static let max = GLubyte.max
    
    var vec: Vec4 {
        get {
            return Vec4(x: CFloat(r) / CFloat(Color.max), y: CFloat(g) / CFloat(Color.max), z: CFloat(b) / CFloat(Color.max), w: CFloat(a) / CFloat(Color.max))
        }
    }
    
    init() {
        self.r = 0
        self.g = 0
        self.b = 0
        self.a = 0
    }
    
    init(s: GLubyte) {
        self.r = s
        self.g = s
        self.b = s
        self.a = s
    }
    
    init(sf: CFloat) {
        let val: GLubyte = GLubyte(CFloat(Color.max) * sf)
        self.r = val
        self.g = val
        self.b = val
        self.a = val
    }
    
    init(r: GLubyte, g: GLubyte, b: GLubyte, a: GLubyte = Color.max) {
        self.r = r
        self.g = g
        self.b = b
        self.a = a
    }
    
    init(rf: CFloat, gf: CFloat, bf: CFloat, af: CFloat = 1) {
        self.r = GLubyte(CFloat(Color.max) * rf)
        self.g = GLubyte(CFloat(Color.max) * gf)
        self.b = GLubyte(CFloat(Color.max) * bf)
        self.a = GLubyte(CFloat(Color.max) * af)
    }
    
    init(rgb: Vec3, a: CFloat = 1) {
        self.r = GLubyte(CFloat(Color.max) * rgb.x)
        self.g = GLubyte(CFloat(Color.max) * rgb.y)
        self.b = GLubyte(CFloat(Color.max) * rgb.z)
        self.a = GLubyte(CFloat(Color.max) * a)
    }
    
    init(rgba: Vec4) {
        self.r = GLubyte(CFloat(Color.max) * rgba.x)
        self.g = GLubyte(CFloat(Color.max) * rgba.y)
        self.b = GLubyte(CFloat(Color.max) * rgba.z)
        self.a = GLubyte(CFloat(Color.max) * rgba.w)
    }
}

// Allow checking if two colors are equal
extension Color: Equatable {}
@infix func == (a: Color, b: Color) -> Bool {return a.r == b.r && a.g == b.g && a.b == b.b && a.a == b.a}

// Color Infix Operators
@infix func + (a: Color, b: Color) -> Color {return Color(r: a.r + b.r, g: a.g + b.g, b: a.b + b.b, a: a.a + b.a)}
@infix func - (a: Color, b: Color) -> Color {return Color(r: a.r - b.r, g: a.g - b.g, b: a.b - b.b, a: a.a - b.a)}
@infix func * (a: Color, b: Color) -> Color {return Color(r: a.r * b.r, g: a.g * b.g, b: a.b * b.b, a: a.a * b.a)}
@infix func / (a: Color, b: Color) -> Color {return Color(r: a.r / b.r, g: a.g / b.g, b: a.b / b.b, a: a.a / b.a)}

// Color Scalar Operators
@infix func * (s: CFloat, c: Color) -> Color {return Color(rgba: s * c.vec)}
@infix func * (c: Color, s: CFloat) -> Color {return Color(rgba: c.vec * s)}
@infix func / (c: Color, s: CFloat) -> Color {return Color(rgba: c.vec / s)}

func mix(a: Color, b: Color, t: Color)  -> Color {return mix(a, b, t.vec)}
func mix(a: Color, b: Color, t: Vec4)   -> Color {return a + Color(rgba: (b - a).vec * t)}
func mix(a: Color, b: Color, t: CFloat) -> Color {return a + (b - a) * t}
