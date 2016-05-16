//
//  Vec3.swift
//  SwiftGL
//
//  Created by Scott Bennett on 2014-06-08.
//  Copyright (c) 2014 Scott Bennett. All rights reserved.
//

import Darwin

public struct Vec3 {
    public var x, y, z: Float

    public init() {
        self.x = 0
        self.y = 0
        self.z = 0
    }

    // Explicit initializers

    public init(s: Float) {
        self.x = s
        self.y = s
        self.z = s
    }

    public init(x: Float) {
        self.x = x
        self.y = 0
        self.z = 0
    }

    public init(x: Float, y: Float) {
        self.x = x
        self.y = y
        self.z = 0
    }

    public init(x: Float, y: Float, z: Float) {
        self.x = x
        self.y = y
        self.z = z
    }

    public init(xy: Vec2, z: Float) {
        self.x = xy.x
        self.y = xy.y
        self.z = z
    }

    public init(x: Float, yz: Vec2) {
        self.x = x
        self.y = yz.x
        self.z = yz.y
    }

    // Implicit initializers

    public init(_ x: Float) {
        self.x = x
        self.y = 0
        self.z = 0
    }

    public init(_ x: Float, _ y: Float) {
        self.x = x
        self.y = y
        self.z = 0
    }

    public init(_ x: Float, _ y: Float, _ z: Float) {
        self.x = x
        self.y = y
        self.z = z
    }

    public init(_ xy: Vec2, _ z: Float) {
        self.x = xy.x
        self.y = xy.y
        self.z = z
    }

    public init(_ x: Float, _ yz: Vec2) {
        self.x = x
        self.y = yz.x
        self.z = yz.y
    }

    public var length2: Float {
        get {
            return x * x + y * y + z * z
        }
    }

    public var length: Float {
        get {
            return sqrt(self.length2)
        }
        set {
            self = length * normalize(self)
        }
    }

    // Swizzle (Vec2) Properties
    public var xx: Vec2 { get { return Vec2(x: x, y: x) } }
    public var yx: Vec2 { get { return Vec2(x: y, y: x) } set(v) { self.y = v.x; self.x = v.y } }
    public var zx: Vec2 { get { return Vec2(x: z, y: x) } set(v) { self.z = v.x; self.x = v.y } }
    public var yy: Vec2 { get { return Vec2(x: y, y: y) } }
    public var xy: Vec2 { get { return Vec2(x: x, y: y) } set(v) { self.x = v.x; self.y = v.y } }
    public var zy: Vec2 { get { return Vec2(x: z, y: y) } set(v) { self.z = v.x; self.y = v.y } }
    public var xz: Vec2 { get { return Vec2(x: x, y: z) } set(v) { self.x = v.x; self.z = v.y } }
    public var yz: Vec2 { get { return Vec2(x: y, y: z) } set(v) { self.y = v.x; self.z = v.y } }
    public var zz: Vec2 { get { return Vec2(x: z, y: z) } }

    // Swizzle (Vec3) Properties
    public var xxx: Vec3 { get { return Vec3(x: x, y: x, z: x) } }
    public var yxx: Vec3 { get { return Vec3(x: y, y: x, z: x) } }
    public var zxx: Vec3 { get { return Vec3(x: z, y: x, z: x) } }
    public var yyx: Vec3 { get { return Vec3(x: y, y: y, z: x) } }
    public var xyx: Vec3 { get { return Vec3(x: x, y: y, z: x) } }
    public var zyx: Vec3 { get { return Vec3(x: z, y: y, z: x) } set(v) { self.z = v.x; self.y = v.y; self.x = v.z } }
    public var xzx: Vec3 { get { return Vec3(x: x, y: z, z: x) } }
    public var yzx: Vec3 { get { return Vec3(x: y, y: z, z: x) } set(v) { self.y = v.x; self.z = v.y; self.x = v.z } }
    public var zzx: Vec3 { get { return Vec3(x: z, y: z, z: x) } }
    public var xxy: Vec3 { get { return Vec3(x: x, y: x, z: y) } }
    public var yxy: Vec3 { get { return Vec3(x: y, y: x, z: y) } }
    public var zxy: Vec3 { get { return Vec3(x: z, y: x, z: y) } set(v) { self.z = v.x; self.x = v.y; self.y = v.z } }
    public var yyy: Vec3 { get { return Vec3(x: y, y: y, z: y) } }
    public var xyy: Vec3 { get { return Vec3(x: x, y: y, z: y) } }
    public var zyy: Vec3 { get { return Vec3(x: z, y: y, z: y) } }
    public var xzy: Vec3 { get { return Vec3(x: x, y: z, z: y) } set(v) { self.x = v.x; self.z = v.y; self.y = v.z } }
    public var yzy: Vec3 { get { return Vec3(x: y, y: z, z: y) } }
    public var zzy: Vec3 { get { return Vec3(x: z, y: z, z: y) } }
    public var xxz: Vec3 { get { return Vec3(x: x, y: x, z: z) } }
    public var yxz: Vec3 { get { return Vec3(x: y, y: x, z: z) } set(v) { self.y = v.x; self.x = v.y; self.z = v.z } }
    public var zxz: Vec3 { get { return Vec3(x: z, y: x, z: z) } }
    public var yyz: Vec3 { get { return Vec3(x: y, y: y, z: z) } }
    public var xyz: Vec3 { get { return Vec3(x: x, y: y, z: z) } set(v) { self.x = v.x; self.y = v.y; self.z = v.z } }
    public var zyz: Vec3 { get { return Vec3(x: z, y: y, z: z) } }
    public var xzz: Vec3 { get { return Vec3(x: x, y: z, z: z) } }
    public var yzz: Vec3 { get { return Vec3(x: y, y: z, z: z) } }
    public var zzz: Vec3 { get { return Vec3(x: z, y: z, z: z) } }

    // Swizzle (Vec4) Properties
    public var xxxx: Vec4 { get { return Vec4(x: x, y: x, z: x, w: x) } }
    public var yxxx: Vec4 { get { return Vec4(x: y, y: x, z: x, w: x) } }
    public var zxxx: Vec4 { get { return Vec4(x: z, y: x, z: x, w: x) } }
    public var yyxx: Vec4 { get { return Vec4(x: y, y: y, z: x, w: x) } }
    public var xyxx: Vec4 { get { return Vec4(x: x, y: y, z: x, w: x) } }
    public var zyxx: Vec4 { get { return Vec4(x: z, y: y, z: x, w: x) } }
    public var xzxx: Vec4 { get { return Vec4(x: x, y: z, z: x, w: x) } }
    public var yzxx: Vec4 { get { return Vec4(x: y, y: z, z: x, w: x) } }
    public var zzxx: Vec4 { get { return Vec4(x: z, y: z, z: x, w: x) } }
    public var xxyx: Vec4 { get { return Vec4(x: x, y: x, z: y, w: x) } }
    public var yxyx: Vec4 { get { return Vec4(x: y, y: x, z: y, w: x) } }
    public var zxyx: Vec4 { get { return Vec4(x: z, y: x, z: y, w: x) } }
    public var yyyx: Vec4 { get { return Vec4(x: y, y: y, z: y, w: x) } }
    public var xyyx: Vec4 { get { return Vec4(x: x, y: y, z: y, w: x) } }
    public var zyyx: Vec4 { get { return Vec4(x: z, y: y, z: y, w: x) } }
    public var xzyx: Vec4 { get { return Vec4(x: x, y: z, z: y, w: x) } }
    public var yzyx: Vec4 { get { return Vec4(x: y, y: z, z: y, w: x) } }
    public var zzyx: Vec4 { get { return Vec4(x: z, y: z, z: y, w: x) } }
    public var xxzx: Vec4 { get { return Vec4(x: x, y: x, z: z, w: x) } }
    public var yxzx: Vec4 { get { return Vec4(x: y, y: x, z: z, w: x) } }
    public var zxzx: Vec4 { get { return Vec4(x: z, y: x, z: z, w: x) } }
    public var yyzx: Vec4 { get { return Vec4(x: y, y: y, z: z, w: x) } }
    public var xyzx: Vec4 { get { return Vec4(x: x, y: y, z: z, w: x) } }
    public var zyzx: Vec4 { get { return Vec4(x: z, y: y, z: z, w: x) } }
    public var xzzx: Vec4 { get { return Vec4(x: x, y: z, z: z, w: x) } }
    public var yzzx: Vec4 { get { return Vec4(x: y, y: z, z: z, w: x) } }
    public var zzzx: Vec4 { get { return Vec4(x: z, y: z, z: z, w: x) } }
    public var xxxy: Vec4 { get { return Vec4(x: x, y: x, z: x, w: y) } }
    public var yxxy: Vec4 { get { return Vec4(x: y, y: x, z: x, w: y) } }
    public var zxxy: Vec4 { get { return Vec4(x: z, y: x, z: x, w: y) } }
    public var yyxy: Vec4 { get { return Vec4(x: y, y: y, z: x, w: y) } }
    public var xyxy: Vec4 { get { return Vec4(x: x, y: y, z: x, w: y) } }
    public var zyxy: Vec4 { get { return Vec4(x: z, y: y, z: x, w: y) } }
    public var xzxy: Vec4 { get { return Vec4(x: x, y: z, z: x, w: y) } }
    public var yzxy: Vec4 { get { return Vec4(x: y, y: z, z: x, w: y) } }
    public var zzxy: Vec4 { get { return Vec4(x: z, y: z, z: x, w: y) } }
    public var xxyy: Vec4 { get { return Vec4(x: x, y: x, z: y, w: y) } }
    public var yxyy: Vec4 { get { return Vec4(x: y, y: x, z: y, w: y) } }
    public var zxyy: Vec4 { get { return Vec4(x: z, y: x, z: y, w: y) } }
    public var yyyy: Vec4 { get { return Vec4(x: y, y: y, z: y, w: y) } }
    public var xyyy: Vec4 { get { return Vec4(x: x, y: y, z: y, w: y) } }
    public var zyyy: Vec4 { get { return Vec4(x: z, y: y, z: y, w: y) } }
    public var xzyy: Vec4 { get { return Vec4(x: x, y: z, z: y, w: y) } }
    public var yzyy: Vec4 { get { return Vec4(x: y, y: z, z: y, w: y) } }
    public var zzyy: Vec4 { get { return Vec4(x: z, y: z, z: y, w: y) } }
    public var xxzy: Vec4 { get { return Vec4(x: x, y: x, z: z, w: y) } }
    public var yxzy: Vec4 { get { return Vec4(x: y, y: x, z: z, w: y) } }
    public var zxzy: Vec4 { get { return Vec4(x: z, y: x, z: z, w: y) } }
    public var yyzy: Vec4 { get { return Vec4(x: y, y: y, z: z, w: y) } }
    public var xyzy: Vec4 { get { return Vec4(x: x, y: y, z: z, w: y) } }
    public var zyzy: Vec4 { get { return Vec4(x: z, y: y, z: z, w: y) } }
    public var xzzy: Vec4 { get { return Vec4(x: x, y: z, z: z, w: y) } }
    public var yzzy: Vec4 { get { return Vec4(x: y, y: z, z: z, w: y) } }
    public var zzzy: Vec4 { get { return Vec4(x: z, y: z, z: z, w: y) } }
    public var xxxz: Vec4 { get { return Vec4(x: x, y: x, z: x, w: z) } }
    public var yxxz: Vec4 { get { return Vec4(x: y, y: x, z: x, w: z) } }
    public var zxxz: Vec4 { get { return Vec4(x: z, y: x, z: x, w: z) } }
    public var yyxz: Vec4 { get { return Vec4(x: y, y: y, z: x, w: z) } }
    public var xyxz: Vec4 { get { return Vec4(x: x, y: y, z: x, w: z) } }
    public var zyxz: Vec4 { get { return Vec4(x: z, y: y, z: x, w: z) } }
    public var xzxz: Vec4 { get { return Vec4(x: x, y: z, z: x, w: z) } }
    public var yzxz: Vec4 { get { return Vec4(x: y, y: z, z: x, w: z) } }
    public var zzxz: Vec4 { get { return Vec4(x: z, y: z, z: x, w: z) } }
    public var xxyz: Vec4 { get { return Vec4(x: x, y: x, z: y, w: z) } }
    public var yxyz: Vec4 { get { return Vec4(x: y, y: x, z: y, w: z) } }
    public var zxyz: Vec4 { get { return Vec4(x: z, y: x, z: y, w: z) } }
    public var yyyz: Vec4 { get { return Vec4(x: y, y: y, z: y, w: z) } }
    public var xyyz: Vec4 { get { return Vec4(x: x, y: y, z: y, w: z) } }
    public var zyyz: Vec4 { get { return Vec4(x: z, y: y, z: y, w: z) } }
    public var xzyz: Vec4 { get { return Vec4(x: x, y: z, z: y, w: z) } }
    public var yzyz: Vec4 { get { return Vec4(x: y, y: z, z: y, w: z) } }
    public var zzyz: Vec4 { get { return Vec4(x: z, y: z, z: y, w: z) } }
    public var xxzz: Vec4 { get { return Vec4(x: x, y: x, z: z, w: z) } }
    public var yxzz: Vec4 { get { return Vec4(x: y, y: x, z: z, w: z) } }
    public var zxzz: Vec4 { get { return Vec4(x: z, y: x, z: z, w: z) } }
    public var yyzz: Vec4 { get { return Vec4(x: y, y: y, z: z, w: z) } }
    public var xyzz: Vec4 { get { return Vec4(x: x, y: y, z: z, w: z) } }
    public var zyzz: Vec4 { get { return Vec4(x: z, y: y, z: z, w: z) } }
    public var xzzz: Vec4 { get { return Vec4(x: x, y: z, z: z, w: z) } }
    public var yzzz: Vec4 { get { return Vec4(x: y, y: z, z: z, w: z) } }
    public var zzzz: Vec4 { get { return Vec4(x: z, y: z, z: z, w: z) } }
}

// Make it easier to interpret Vec3 as a string
extension Vec3: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String { get { return "(\(x), \(y), \(z))" } }
    public var debugDescription: String { get { return "Vec3(x: \(x), y: \(y), z: \(z))" } }
}

// Vec3 Prefix Operators
public prefix func - (v: Vec3) -> Vec3 { return Vec3(x: -v.x, y: -v.y, z: -v.z) }

// Vec3 Infix Operators
public func + (a: Vec3, b: Vec3) -> Vec3 { return Vec3(x: a.x + b.x, y: a.y + b.y, z: a.z + b.z) }
public func - (a: Vec3, b: Vec3) -> Vec3 { return Vec3(x: a.x - b.x, y: a.y - b.y, z: a.z - b.z) }
public func * (a: Vec3, b: Vec3) -> Vec3 { return Vec3(x: a.x * b.x, y: a.y * b.y, z: a.z * b.z) }
public func / (a: Vec3, b: Vec3) -> Vec3 { return Vec3(x: a.x / b.x, y: a.y / b.y, z: a.z / b.z) }

// Vec3 Scalar Operators
public func * (s: Float, v: Vec3) -> Vec3 { return Vec3(x: s * v.x, y: s * v.y, z: s * v.z) }
public func * (v: Vec3, s: Float) -> Vec3 { return Vec3(x: v.x * s, y: v.y * s, z: v.z * s) }
public func / (v: Vec3, s: Float) -> Vec3 { return Vec3(x: v.x / s, y: v.y / s, z: v.z / s) }

// Vec3 Assignment Operators
public func += (inout a: Vec3, b: Vec3) { a = a + b }
public func -= (inout a: Vec3, b: Vec3) { a = a - b }
public func *= (inout a: Vec3, b: Vec3) { a = a * b }
public func /= (inout a: Vec3, b: Vec3) { a = a / b }

public func *= (inout a: Vec3, b: Float) { a = a * b }
public func /= (inout a: Vec3, b: Float) { a = a / b }

// Functions which operate on Vec3
public func length(v: Vec3) -> Float { return v.length }
public func length2(v: Vec3) -> Float { return v.length2 }
public func normalize(v: Vec3) -> Vec3 { return v / v.length }
public func dot(a: Vec3, _ b: Vec3) -> Float { return a.x * b.x + a.y * b.y + a.z * b.z }
public func cross(a: Vec3, _ b: Vec3) -> Vec3 { return Vec3(x: a.y * b.z - a.z * b.y, y: a.z * b.x - a.x * b.z, z: a.x * b.y - a.y * b.x) }

public func clamp(value: Vec3, min: Float, max: Float) -> Vec3 { return Vec3(clamp(value.x, min: min, max: max), clamp(value.y, min: min, max: max), clamp(value.z, min: min, max: max)) }
public func mix(a: Vec3, b: Vec3, t: Float) -> Vec3 { return a + (b - a) * t }
public func smoothstep(a: Vec3, b: Vec3, t: Float) -> Vec3 { return mix(a, b: b, t: t * t * (3 - 2 * t)) }

public func clamp(value: Vec3, min: Vec3, max: Vec3) -> Vec3 { return Vec3(clamp(value.x, min: min.x, max: max.x), clamp(value.y, min: min.y, max: max.y), clamp(value.z, min: min.z, max: max.z)) }
public func mix(a: Vec3, b: Vec3, t: Vec3) -> Vec3 { return a + (b - a) * t }
public func smoothstep(a: Vec3, b: Vec3, t: Vec3) -> Vec3 { return mix(a, b: b, t: t * t * (Vec3(s: 3) - 2 * t)) }
