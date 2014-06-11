//
//  Vec2.swift
//  SwiftGL
//
//  Created by Scott Bennett on 2014-06-08.
//  Copyright (c) 2014 Scott Bennett. All rights reserved.
//

import Darwin

struct Vec2 {
    var x, y: CFloat
    
    init() {
        self.x = 0
        self.y = 0
    }
    
    init(s: CFloat) {
        self.x = s
        self.y = s
    }
    
    init(x: CFloat, y: CFloat) {
        self.x = x
        self.y = y
    }
    
    var length2: CFloat {
        get {
            return x * x + y * y
        }
    }
    
    var length: CFloat {
        get {
            return sqrt(self.length2)
        }
        set(l) {
            self = l * normalize(self)
        }
    }
    
    // Swizzle (Vec2) Properties
    var xx: Vec2 {get {return Vec2(x: x, y: x)}}
    var yx: Vec2 {get {return Vec2(x: y, y: x)} set(v) {self.y = v.x; self.x = v.y}}
    var xy: Vec2 {get {return Vec2(x: x, y: y)} set(v) {self.x = v.x; self.y = v.y}}
    var yy: Vec2 {get {return Vec2(x: y, y: y)}}
    
    // Swizzle (Vec3) Properties
    var xxx: Vec3 {get {return Vec3(x: x, y: x, z: x)}}
    var yxx: Vec3 {get {return Vec3(x: y, y: x, z: x)}}
    var xyx: Vec3 {get {return Vec3(x: x, y: y, z: x)}}
    var yyx: Vec3 {get {return Vec3(x: y, y: y, z: x)}}
    var xxy: Vec3 {get {return Vec3(x: x, y: x, z: y)}}
    var yxy: Vec3 {get {return Vec3(x: y, y: x, z: y)}}
    var xyy: Vec3 {get {return Vec3(x: x, y: y, z: y)}}
    var yyy: Vec3 {get {return Vec3(x: y, y: y, z: y)}}
    
    // Swizzle (Vec4) Properties
    var xxxx: Vec4 {get {return Vec4(x: x, y: x, z: x, w: x)}}
    var yxxx: Vec4 {get {return Vec4(x: y, y: x, z: x, w: x)}}
    var xyxx: Vec4 {get {return Vec4(x: x, y: y, z: x, w: x)}}
    var yyxx: Vec4 {get {return Vec4(x: y, y: y, z: x, w: x)}}
    var xxyx: Vec4 {get {return Vec4(x: x, y: x, z: y, w: x)}}
    var yxyx: Vec4 {get {return Vec4(x: y, y: x, z: y, w: x)}}
    var xyyx: Vec4 {get {return Vec4(x: x, y: y, z: y, w: x)}}
    var yyyx: Vec4 {get {return Vec4(x: y, y: y, z: y, w: x)}}
    var xxxy: Vec4 {get {return Vec4(x: x, y: x, z: x, w: y)}}
    var yxxy: Vec4 {get {return Vec4(x: y, y: x, z: x, w: y)}}
    var xyxy: Vec4 {get {return Vec4(x: x, y: y, z: x, w: y)}}
    var yyxy: Vec4 {get {return Vec4(x: y, y: y, z: x, w: y)}}
    var xxyy: Vec4 {get {return Vec4(x: x, y: x, z: y, w: y)}}
    var yxyy: Vec4 {get {return Vec4(x: y, y: x, z: y, w: y)}}
    var xyyy: Vec4 {get {return Vec4(x: x, y: y, z: y, w: y)}}
    var yyyy: Vec4 {get {return Vec4(x: y, y: y, z: y, w: y)}}
}

// Vec2 Prefix Operators
@prefix func - (v: Vec2) -> Vec2 {return Vec2(x: -v.x, y: -v.y)}

// Vec2 Infix Operators
@infix func + (a: Vec2, b: Vec2) -> Vec2 {return Vec2(x: a.x + b.x, y: a.y + b.y)}
@infix func - (a: Vec2, b: Vec2) -> Vec2 {return Vec2(x: a.x - b.x, y: a.y - b.y)}
@infix func * (a: Vec2, b: Vec2) -> Vec2 {return Vec2(x: a.x * b.x, y: a.y * b.y)}
@infix func / (a: Vec2, b: Vec2) -> Vec2 {return Vec2(x: a.x / b.x, y: a.y / b.y)}

// Vec2 Scalar Operators
@infix func * (s: CFloat, v: Vec2) -> Vec2 {return Vec2(x: s * v.x, y: s * v.y)}
@infix func * (v: Vec2, s: CFloat) -> Vec2 {return Vec2(x: v.x * s, y: v.y * s)}
@infix func / (v: Vec2, s: CFloat) -> Vec2 {return Vec2(x: v.x / s, y: v.y / s)}

// Functions which operate on Vec2
func length(v: Vec2) -> CFloat {return v.length}
func length2(v: Vec2) -> CFloat {return v.length2}
func normalize(v: Vec2) -> Vec2 {return v / v.length}
func dot(a: Vec2, b: Vec2) -> CFloat {return a.x * b.x + a.y * b.y}
func mix(a: Vec2, b: Vec2, t: Vec2) -> Vec2 {return a + (b - a) * t}
func mix(a: Vec2, b: Vec2, t: CFloat) -> Vec2 {return a + (b - a) * t}
