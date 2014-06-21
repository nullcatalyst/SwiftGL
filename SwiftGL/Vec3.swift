//
//  Vec3.swift
//  SwiftGL
//
//  Created by Scott Bennett on 2014-06-08.
//  Copyright (c) 2014 Scott Bennett. All rights reserved.
//

import Darwin

struct Vec3 {
    var x, y, z: CFloat
    
    init() {
        self.x = 0
        self.y = 0
        self.z = 0
    }
    
    init(s: CFloat) {
        self.x = s
        self.y = s
        self.z = s
    }
    
    init(x: CFloat, y: CFloat) {
        self.x = x
        self.y = y
        self.z = 0
    }
    
    init(x: CFloat, y: CFloat, z: CFloat) {
        self.x = x
        self.y = y
        self.z = z
    }
    
    init(xy: Vec2, z: CFloat) {
        self.x = xy.x
        self.y = xy.y
        self.z = z
    }
    
    init(x: CFloat, yz: Vec2) {
        self.x = x
        self.y = yz.x
        self.z = yz.y
    }
    
    var length2: CFloat {
        get {
            return x * x + y * y + z * z
        }
    }
    
    var length: CFloat {
        get {
            return sqrt(self.length2)
        }
        set {
            self = length * normalize(self)
        }
    }
    
    // Swizzle (Vec2) Properties
    var xx: Vec2 {get {return Vec2(x: x, y: x)}}
    var yx: Vec2 {get {return Vec2(x: y, y: x)} set(v) {self.y = v.x; self.x = v.y}}
    var zx: Vec2 {get {return Vec2(x: z, y: x)} set(v) {self.z = v.x; self.x = v.y}}
    var yy: Vec2 {get {return Vec2(x: y, y: y)}}
    var xy: Vec2 {get {return Vec2(x: x, y: y)} set(v) {self.x = v.x; self.y = v.y}}
    var zy: Vec2 {get {return Vec2(x: z, y: y)} set(v) {self.z = v.x; self.y = v.y}}
    var xz: Vec2 {get {return Vec2(x: x, y: z)} set(v) {self.x = v.x; self.z = v.y}}
    var yz: Vec2 {get {return Vec2(x: y, y: z)} set(v) {self.y = v.x; self.z = v.y}}
    var zz: Vec2 {get {return Vec2(x: z, y: z)}}
    
    // Swizzle (Vec3) Properties
    var xxx: Vec3 {get {return Vec3(x: x, y: x, z: x)}}
    var yxx: Vec3 {get {return Vec3(x: y, y: x, z: x)}}
    var zxx: Vec3 {get {return Vec3(x: z, y: x, z: x)}}
    var yyx: Vec3 {get {return Vec3(x: y, y: y, z: x)}}
    var xyx: Vec3 {get {return Vec3(x: x, y: y, z: x)}}
    var zyx: Vec3 {get {return Vec3(x: z, y: y, z: x)} set(v) {self.z = v.x; self.y = v.y; self.x = v.z}}
    var xzx: Vec3 {get {return Vec3(x: x, y: z, z: x)}}
    var yzx: Vec3 {get {return Vec3(x: y, y: z, z: x)} set(v) {self.y = v.x; self.z = v.y; self.x = v.z}}
    var zzx: Vec3 {get {return Vec3(x: z, y: z, z: x)}}
    var xxy: Vec3 {get {return Vec3(x: x, y: x, z: y)}}
    var yxy: Vec3 {get {return Vec3(x: y, y: x, z: y)}}
    var zxy: Vec3 {get {return Vec3(x: z, y: x, z: y)} set(v) {self.z = v.x; self.x = v.y; self.y = v.z}}
    var yyy: Vec3 {get {return Vec3(x: y, y: y, z: y)}}
    var xyy: Vec3 {get {return Vec3(x: x, y: y, z: y)}}
    var zyy: Vec3 {get {return Vec3(x: z, y: y, z: y)}}
    var xzy: Vec3 {get {return Vec3(x: x, y: z, z: y)} set(v) {self.x = v.x; self.z = v.y; self.y = v.z}}
    var yzy: Vec3 {get {return Vec3(x: y, y: z, z: y)}}
    var zzy: Vec3 {get {return Vec3(x: z, y: z, z: y)}}
    var xxz: Vec3 {get {return Vec3(x: x, y: x, z: z)}}
    var yxz: Vec3 {get {return Vec3(x: y, y: x, z: z)} set(v) {self.y = v.x; self.x = v.y; self.z = v.z}}
    var zxz: Vec3 {get {return Vec3(x: z, y: x, z: z)}}
    var yyz: Vec3 {get {return Vec3(x: y, y: y, z: z)}}
    var xyz: Vec3 {get {return Vec3(x: x, y: y, z: z)} set(v) {self.x = v.x; self.y = v.y; self.z = v.z}}
    var zyz: Vec3 {get {return Vec3(x: z, y: y, z: z)}}
    var xzz: Vec3 {get {return Vec3(x: x, y: z, z: z)}}
    var yzz: Vec3 {get {return Vec3(x: y, y: z, z: z)}}
    var zzz: Vec3 {get {return Vec3(x: z, y: z, z: z)}}
    
    // Swizzle (Vec4) Properties
    var xxxx: Vec4 {get {return Vec4(x: x, y: x, z: x, w: x)}}
    var yxxx: Vec4 {get {return Vec4(x: y, y: x, z: x, w: x)}}
    var zxxx: Vec4 {get {return Vec4(x: z, y: x, z: x, w: x)}}
    var yyxx: Vec4 {get {return Vec4(x: y, y: y, z: x, w: x)}}
    var xyxx: Vec4 {get {return Vec4(x: x, y: y, z: x, w: x)}}
    var zyxx: Vec4 {get {return Vec4(x: z, y: y, z: x, w: x)}}
    var xzxx: Vec4 {get {return Vec4(x: x, y: z, z: x, w: x)}}
    var yzxx: Vec4 {get {return Vec4(x: y, y: z, z: x, w: x)}}
    var zzxx: Vec4 {get {return Vec4(x: z, y: z, z: x, w: x)}}
    var xxyx: Vec4 {get {return Vec4(x: x, y: x, z: y, w: x)}}
    var yxyx: Vec4 {get {return Vec4(x: y, y: x, z: y, w: x)}}
    var zxyx: Vec4 {get {return Vec4(x: z, y: x, z: y, w: x)}}
    var yyyx: Vec4 {get {return Vec4(x: y, y: y, z: y, w: x)}}
    var xyyx: Vec4 {get {return Vec4(x: x, y: y, z: y, w: x)}}
    var zyyx: Vec4 {get {return Vec4(x: z, y: y, z: y, w: x)}}
    var xzyx: Vec4 {get {return Vec4(x: x, y: z, z: y, w: x)}}
    var yzyx: Vec4 {get {return Vec4(x: y, y: z, z: y, w: x)}}
    var zzyx: Vec4 {get {return Vec4(x: z, y: z, z: y, w: x)}}
    var xxzx: Vec4 {get {return Vec4(x: x, y: x, z: z, w: x)}}
    var yxzx: Vec4 {get {return Vec4(x: y, y: x, z: z, w: x)}}
    var zxzx: Vec4 {get {return Vec4(x: z, y: x, z: z, w: x)}}
    var yyzx: Vec4 {get {return Vec4(x: y, y: y, z: z, w: x)}}
    var xyzx: Vec4 {get {return Vec4(x: x, y: y, z: z, w: x)}}
    var zyzx: Vec4 {get {return Vec4(x: z, y: y, z: z, w: x)}}
    var xzzx: Vec4 {get {return Vec4(x: x, y: z, z: z, w: x)}}
    var yzzx: Vec4 {get {return Vec4(x: y, y: z, z: z, w: x)}}
    var zzzx: Vec4 {get {return Vec4(x: z, y: z, z: z, w: x)}}
    var xxxy: Vec4 {get {return Vec4(x: x, y: x, z: x, w: y)}}
    var yxxy: Vec4 {get {return Vec4(x: y, y: x, z: x, w: y)}}
    var zxxy: Vec4 {get {return Vec4(x: z, y: x, z: x, w: y)}}
    var yyxy: Vec4 {get {return Vec4(x: y, y: y, z: x, w: y)}}
    var xyxy: Vec4 {get {return Vec4(x: x, y: y, z: x, w: y)}}
    var zyxy: Vec4 {get {return Vec4(x: z, y: y, z: x, w: y)}}
    var xzxy: Vec4 {get {return Vec4(x: x, y: z, z: x, w: y)}}
    var yzxy: Vec4 {get {return Vec4(x: y, y: z, z: x, w: y)}}
    var zzxy: Vec4 {get {return Vec4(x: z, y: z, z: x, w: y)}}
    var xxyy: Vec4 {get {return Vec4(x: x, y: x, z: y, w: y)}}
    var yxyy: Vec4 {get {return Vec4(x: y, y: x, z: y, w: y)}}
    var zxyy: Vec4 {get {return Vec4(x: z, y: x, z: y, w: y)}}
    var yyyy: Vec4 {get {return Vec4(x: y, y: y, z: y, w: y)}}
    var xyyy: Vec4 {get {return Vec4(x: x, y: y, z: y, w: y)}}
    var zyyy: Vec4 {get {return Vec4(x: z, y: y, z: y, w: y)}}
    var xzyy: Vec4 {get {return Vec4(x: x, y: z, z: y, w: y)}}
    var yzyy: Vec4 {get {return Vec4(x: y, y: z, z: y, w: y)}}
    var zzyy: Vec4 {get {return Vec4(x: z, y: z, z: y, w: y)}}
    var xxzy: Vec4 {get {return Vec4(x: x, y: x, z: z, w: y)}}
    var yxzy: Vec4 {get {return Vec4(x: y, y: x, z: z, w: y)}}
    var zxzy: Vec4 {get {return Vec4(x: z, y: x, z: z, w: y)}}
    var yyzy: Vec4 {get {return Vec4(x: y, y: y, z: z, w: y)}}
    var xyzy: Vec4 {get {return Vec4(x: x, y: y, z: z, w: y)}}
    var zyzy: Vec4 {get {return Vec4(x: z, y: y, z: z, w: y)}}
    var xzzy: Vec4 {get {return Vec4(x: x, y: z, z: z, w: y)}}
    var yzzy: Vec4 {get {return Vec4(x: y, y: z, z: z, w: y)}}
    var zzzy: Vec4 {get {return Vec4(x: z, y: z, z: z, w: y)}}
    var xxxz: Vec4 {get {return Vec4(x: x, y: x, z: x, w: z)}}
    var yxxz: Vec4 {get {return Vec4(x: y, y: x, z: x, w: z)}}
    var zxxz: Vec4 {get {return Vec4(x: z, y: x, z: x, w: z)}}
    var yyxz: Vec4 {get {return Vec4(x: y, y: y, z: x, w: z)}}
    var xyxz: Vec4 {get {return Vec4(x: x, y: y, z: x, w: z)}}
    var zyxz: Vec4 {get {return Vec4(x: z, y: y, z: x, w: z)}}
    var xzxz: Vec4 {get {return Vec4(x: x, y: z, z: x, w: z)}}
    var yzxz: Vec4 {get {return Vec4(x: y, y: z, z: x, w: z)}}
    var zzxz: Vec4 {get {return Vec4(x: z, y: z, z: x, w: z)}}
    var xxyz: Vec4 {get {return Vec4(x: x, y: x, z: y, w: z)}}
    var yxyz: Vec4 {get {return Vec4(x: y, y: x, z: y, w: z)}}
    var zxyz: Vec4 {get {return Vec4(x: z, y: x, z: y, w: z)}}
    var yyyz: Vec4 {get {return Vec4(x: y, y: y, z: y, w: z)}}
    var xyyz: Vec4 {get {return Vec4(x: x, y: y, z: y, w: z)}}
    var zyyz: Vec4 {get {return Vec4(x: z, y: y, z: y, w: z)}}
    var xzyz: Vec4 {get {return Vec4(x: x, y: z, z: y, w: z)}}
    var yzyz: Vec4 {get {return Vec4(x: y, y: z, z: y, w: z)}}
    var zzyz: Vec4 {get {return Vec4(x: z, y: z, z: y, w: z)}}
    var xxzz: Vec4 {get {return Vec4(x: x, y: x, z: z, w: z)}}
    var yxzz: Vec4 {get {return Vec4(x: y, y: x, z: z, w: z)}}
    var zxzz: Vec4 {get {return Vec4(x: z, y: x, z: z, w: z)}}
    var yyzz: Vec4 {get {return Vec4(x: y, y: y, z: z, w: z)}}
    var xyzz: Vec4 {get {return Vec4(x: x, y: y, z: z, w: z)}}
    var zyzz: Vec4 {get {return Vec4(x: z, y: y, z: z, w: z)}}
    var xzzz: Vec4 {get {return Vec4(x: x, y: z, z: z, w: z)}}
    var yzzz: Vec4 {get {return Vec4(x: y, y: z, z: z, w: z)}}
    var zzzz: Vec4 {get {return Vec4(x: z, y: z, z: z, w: z)}}
}

// Make it easier to interpret Vec3 as a string
extension Vec3: Printable, DebugPrintable {
    var description:      String {get {return "(\(x), \(y), \(z))"}}
    var debugDescription: String {get {return "Vec3(x: \(x), y: \(y), z: \(z))"}}
}

// Vec3 Prefix Operators
@prefix func - (v: Vec3) -> Vec3 {return Vec3(x: -v.x, y: -v.y, z: -v.z)}

// Vec3 Infix Operators
@infix func + (a: Vec3, b: Vec3) -> Vec3 {return Vec3(x: a.x + b.x, y: a.y + b.y, z: a.z + b.z)}
@infix func - (a: Vec3, b: Vec3) -> Vec3 {return Vec3(x: a.x - b.x, y: a.y - b.y, z: a.z - b.z)}
@infix func * (a: Vec3, b: Vec3) -> Vec3 {return Vec3(x: a.x * b.x, y: a.y * b.y, z: a.z * b.z)}
@infix func / (a: Vec3, b: Vec3) -> Vec3 {return Vec3(x: a.x / b.x, y: a.y / b.y, z: a.z / b.z)}

// Vec3 Scalar Operators
@infix func * (s: CFloat, v: Vec3) -> Vec3 {return Vec3(x: s * v.x, y: s * v.y, z: s * v.z)}
@infix func * (v: Vec3, s: CFloat) -> Vec3 {return Vec3(x: v.x * s, y: v.y * s, z: v.z * s)}
@infix func / (v: Vec3, s: CFloat) -> Vec3 {return Vec3(x: v.x / s, y: v.y / s, z: v.z / s)}

// Vec3 Assignment Operators
@assignment func += (inout a: Vec3, b: Vec3) {a = a + b}
@assignment func -= (inout a: Vec3, b: Vec3) {a = a - b}
@assignment func *= (inout a: Vec3, b: Vec3) {a = a * b}
@assignment func /= (inout a: Vec3, b: Vec3) {a = a / b}

@assignment func *= (inout a: Vec3, b: CFloat) {a = a * b}
@assignment func /= (inout a: Vec3, b: CFloat) {a = a / b}

// Functions which operate on Vec3
func length(v: Vec3) -> CFloat {return v.length}
func length2(v: Vec3) -> CFloat {return v.length2}
func normalize(v: Vec3) -> Vec3 {return v / v.length}
func dot(a: Vec3, b: Vec3) -> CFloat {return a.x * b.x + a.y * b.y + a.z * b.z}
func cross(a: Vec3, b: Vec3) -> Vec3 {return Vec3(x: a.y * b.z - a.z * b.y, y: a.z * b.x - a.x * b.z, z: a.x * b.y - a.y * b.x)}
func mix(a: Vec3, b: Vec3, t: Vec3) -> Vec3 {return a + (b - a) * t}
func mix(a: Vec3, b: Vec3, t: CFloat) -> Vec3 {return a + (b - a) * t}
