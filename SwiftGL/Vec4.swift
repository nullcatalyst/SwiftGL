//
//  Vec4.swift
//  SwiftGL
//
//  Created by Scott Bennett on 2014-06-08.
//  Copyright (c) 2014 Scott Bennett. All rights reserved.
//

import Darwin

public struct Vec4 {
    public var x, y, z, w: CFloat
    
    public init() {
        self.x = 0
        self.y = 0
        self.z = 0
        self.w = 0
    }
    
    // Explicit Initializers
    
    public init(s: CFloat) {
        self.x = s
        self.y = s
        self.z = s
        self.w = s
    }
    
    public init(x: CFloat) {
        self.x = x
        self.y = 0
        self.z = 0
        self.w = 1
    }
    
    public init(x: CFloat, y: CFloat) {
        self.x = x
        self.y = y
        self.z = 0
        self.w = 1
    }
    
    public init(x: CFloat, y: CFloat, z: CFloat) {
        self.x = x
        self.y = y
        self.z = z
        self.w = 1
    }
    
    public init(x: CFloat, y: CFloat, z: CFloat, w: CFloat) {
        self.x = x
        self.y = y
        self.z = z
        self.w = w
    }
    
    public init(xy: Vec2, z: CFloat, w: CFloat) {
        self.x = xy.x
        self.y = xy.y
        self.z = z
        self.w = w
    }
    
    public init(x: CFloat, yz: Vec2, w: CFloat) {
        self.x = x
        self.y = yz.x
        self.z = yz.y
        self.w = w
    }
    
    public init(x: CFloat, y: CFloat, zw: Vec2) {
        self.x = x
        self.y = y
        self.z = zw.x
        self.w = zw.y
    }
    
    public init(xy: Vec2, zw: Vec2) {
        self.x = xy.x
        self.y = xy.y
        self.z = zw.x
        self.w = zw.y
    }
    
    public init(xyz: Vec3, w: CFloat) {
        self.x = xyz.x
        self.y = xyz.y
        self.z = xyz.z
        self.w = w
    }
    
    public init(x: CFloat, yzw: Vec3) {
        self.x = x
        self.y = yzw.x
        self.z = yzw.y
        self.w = yzw.z
    }
    
    // Implicit Initializers
    
    public init(_ x: CFloat) {
        self.x = x
        self.y = 0
        self.z = 0
        self.w = 1
    }
    
    public init(_ x: CFloat, _ y: CFloat) {
        self.x = x
        self.y = y
        self.z = 0
        self.w = 1
    }
    
    public init(_ x: CFloat, _ y: CFloat, _ z: CFloat) {
        self.x = x
        self.y = y
        self.z = z
        self.w = 1
    }
    
    public init(_ x: CFloat, _ y: CFloat, _ z: CFloat, _ w: CFloat) {
        self.x = x
        self.y = y
        self.z = z
        self.w = w
    }
    
    public init(_ xy: Vec2, _ z: CFloat, _ w: CFloat) {
        self.x = xy.x
        self.y = xy.y
        self.z = z
        self.w = w
    }
    
    public init(_ x: CFloat, _ yz: Vec2, _ w: CFloat) {
        self.x = x
        self.y = yz.x
        self.z = yz.y
        self.w = w
    }
    
    public init(_ x: CFloat, _ y: CFloat, _ zw: Vec2) {
        self.x = x
        self.y = y
        self.z = zw.x
        self.w = zw.y
    }
    
    public init(_ xy: Vec2, _ zw: Vec2) {
        self.x = xy.x
        self.y = xy.y
        self.z = zw.x
        self.w = zw.y
    }
    
    public init(_ xyz: Vec3, _ w: CFloat) {
        self.x = xyz.x
        self.y = xyz.y
        self.z = xyz.z
        self.w = w
    }
    
    public init(_ x: CFloat, _ yzw: Vec3) {
        self.x = x
        self.y = yzw.x
        self.z = yzw.y
        self.w = yzw.z
    }
    
    public var length2: CFloat {
        get {
            return x * x + y * y + z * z + w * w
        }
    }
    
    public var length: CFloat {
        get {
            return sqrt(self.length2)
        }
        set {
            self = length * normalize(self)
        }
    }
    
    // Swizzle (Vec2) Properties
    public var xx: Vec2 {get {return Vec2(x: x, y: x)}}
    public var yx: Vec2 {get {return Vec2(x: y, y: x)} set(v) {self.y = v.x; self.x = v.y}}
    public var zx: Vec2 {get {return Vec2(x: z, y: x)} set(v) {self.z = v.x; self.x = v.y}}
    public var wx: Vec2 {get {return Vec2(x: w, y: x)} set(v) {self.w = v.x; self.x = v.y}}
    public var xy: Vec2 {get {return Vec2(x: x, y: y)} set(v) {self.x = v.x; self.y = v.y}}
    public var yy: Vec2 {get {return Vec2(x: y, y: y)}}
    public var zy: Vec2 {get {return Vec2(x: z, y: y)} set(v) {self.z = v.x; self.y = v.y}}
    public var wy: Vec2 {get {return Vec2(x: w, y: y)} set(v) {self.w = v.x; self.y = v.y}}
    public var xz: Vec2 {get {return Vec2(x: x, y: z)} set(v) {self.x = v.x; self.z = v.y}}
    public var yz: Vec2 {get {return Vec2(x: y, y: z)} set(v) {self.y = v.x; self.z = v.y}}
    public var zz: Vec2 {get {return Vec2(x: z, y: z)}}
    public var wz: Vec2 {get {return Vec2(x: w, y: z)} set(v) {self.w = v.x; self.z = v.y}}
    public var xw: Vec2 {get {return Vec2(x: x, y: w)} set(v) {self.x = v.x; self.w = v.y}}
    public var yw: Vec2 {get {return Vec2(x: y, y: w)} set(v) {self.y = v.x; self.w = v.y}}
    public var zw: Vec2 {get {return Vec2(x: z, y: w)} set(v) {self.z = v.x; self.w = v.y}}
    public var ww: Vec2 {get {return Vec2(x: w, y: w)}}
    
    // Swizzle (Vec3) Properties
    public var xxx: Vec3 {get {return Vec3(x: x, y: x, z: x)}}
    public var yxx: Vec3 {get {return Vec3(x: y, y: x, z: x)}}
    public var zxx: Vec3 {get {return Vec3(x: z, y: x, z: x)}}
    public var wxx: Vec3 {get {return Vec3(x: w, y: x, z: x)}}
    public var xyx: Vec3 {get {return Vec3(x: x, y: y, z: x)}}
    public var yyx: Vec3 {get {return Vec3(x: y, y: y, z: x)}}
    public var zyx: Vec3 {get {return Vec3(x: z, y: y, z: x)} set(v) {self.z = v.x; self.y = v.y; self.x = v.z}}
    public var wyx: Vec3 {get {return Vec3(x: w, y: y, z: x)} set(v) {self.w = v.x; self.y = v.y; self.x = v.z}}
    public var xzx: Vec3 {get {return Vec3(x: x, y: z, z: x)}}
    public var yzx: Vec3 {get {return Vec3(x: y, y: z, z: x)} set(v) {self.y = v.x; self.z = v.y; self.x = v.z}}
    public var zzx: Vec3 {get {return Vec3(x: z, y: z, z: x)}}
    public var wzx: Vec3 {get {return Vec3(x: w, y: z, z: x)} set(v) {self.w = v.x; self.z = v.y; self.x = v.z}}
    public var xwx: Vec3 {get {return Vec3(x: x, y: w, z: x)}}
    public var ywx: Vec3 {get {return Vec3(x: y, y: w, z: x)} set(v) {self.y = v.x; self.w = v.y; self.x = v.z}}
    public var zwx: Vec3 {get {return Vec3(x: z, y: w, z: x)} set(v) {self.z = v.x; self.w = v.y; self.x = v.z}}
    public var wwx: Vec3 {get {return Vec3(x: w, y: w, z: x)}}
    public var xxy: Vec3 {get {return Vec3(x: x, y: x, z: y)}}
    public var yxy: Vec3 {get {return Vec3(x: y, y: x, z: y)}}
    public var zxy: Vec3 {get {return Vec3(x: z, y: x, z: y)} set(v) {self.z = v.x; self.x = v.y; self.y = v.z}}
    public var wxy: Vec3 {get {return Vec3(x: w, y: x, z: y)} set(v) {self.w = v.x; self.x = v.y; self.y = v.z}}
    public var xyy: Vec3 {get {return Vec3(x: x, y: y, z: y)}}
    public var yyy: Vec3 {get {return Vec3(x: y, y: y, z: y)}}
    public var zyy: Vec3 {get {return Vec3(x: z, y: y, z: y)}}
    public var wyy: Vec3 {get {return Vec3(x: w, y: y, z: y)}}
    public var xzy: Vec3 {get {return Vec3(x: x, y: z, z: y)} set(v) {self.x = v.x; self.z = v.y; self.y = v.z}}
    public var yzy: Vec3 {get {return Vec3(x: y, y: z, z: y)}}
    public var zzy: Vec3 {get {return Vec3(x: z, y: z, z: y)}}
    public var wzy: Vec3 {get {return Vec3(x: w, y: z, z: y)} set(v) {self.w = v.x; self.z = v.y; self.y = v.z}}
    public var xwy: Vec3 {get {return Vec3(x: x, y: w, z: y)} set(v) {self.x = v.x; self.w = v.y; self.y = v.z}}
    public var ywy: Vec3 {get {return Vec3(x: y, y: w, z: y)}}
    public var zwy: Vec3 {get {return Vec3(x: z, y: w, z: y)} set(v) {self.z = v.x; self.w = v.y; self.y = v.z}}
    public var wwy: Vec3 {get {return Vec3(x: w, y: w, z: y)}}
    public var xxz: Vec3 {get {return Vec3(x: x, y: x, z: z)}}
    public var yxz: Vec3 {get {return Vec3(x: y, y: x, z: z)} set(v) {self.y = v.x; self.x = v.y; self.z = v.z}}
    public var zxz: Vec3 {get {return Vec3(x: z, y: x, z: z)}}
    public var wxz: Vec3 {get {return Vec3(x: w, y: x, z: z)} set(v) {self.w = v.x; self.x = v.y; self.z = v.z}}
    public var xyz: Vec3 {get {return Vec3(x: x, y: y, z: z)} set(v) {self.x = v.x; self.y = v.y; self.z = v.z}}
    public var yyz: Vec3 {get {return Vec3(x: y, y: y, z: z)}}
    public var zyz: Vec3 {get {return Vec3(x: z, y: y, z: z)}}
    public var wyz: Vec3 {get {return Vec3(x: w, y: y, z: z)} set(v) {self.w = v.x; self.y = v.y; self.z = v.z}}
    public var xzz: Vec3 {get {return Vec3(x: x, y: z, z: z)}}
    public var yzz: Vec3 {get {return Vec3(x: y, y: z, z: z)}}
    public var zzz: Vec3 {get {return Vec3(x: z, y: z, z: z)}}
    public var wzz: Vec3 {get {return Vec3(x: w, y: z, z: z)}}
    public var xwz: Vec3 {get {return Vec3(x: x, y: w, z: z)} set(v) {self.x = v.x; self.w = v.y; self.z = v.z}}
    public var ywz: Vec3 {get {return Vec3(x: y, y: w, z: z)} set(v) {self.y = v.x; self.w = v.y; self.z = v.z}}
    public var zwz: Vec3 {get {return Vec3(x: z, y: w, z: z)}}
    public var wwz: Vec3 {get {return Vec3(x: w, y: w, z: z)}}
    public var xxw: Vec3 {get {return Vec3(x: x, y: x, z: w)}}
    public var yxw: Vec3 {get {return Vec3(x: y, y: x, z: w)} set(v) {self.y = v.x; self.x = v.y; self.w = v.z}}
    public var zxw: Vec3 {get {return Vec3(x: z, y: x, z: w)} set(v) {self.z = v.x; self.x = v.y; self.w = v.z}}
    public var wxw: Vec3 {get {return Vec3(x: w, y: x, z: w)}}
    public var xyw: Vec3 {get {return Vec3(x: x, y: y, z: w)} set(v) {self.x = v.x; self.y = v.y; self.w = v.z}}
    public var yyw: Vec3 {get {return Vec3(x: y, y: y, z: w)}}
    public var zyw: Vec3 {get {return Vec3(x: z, y: y, z: w)} set(v) {self.z = v.x; self.y = v.y; self.w = v.z}}
    public var wyw: Vec3 {get {return Vec3(x: w, y: y, z: w)}}
    public var xzw: Vec3 {get {return Vec3(x: x, y: z, z: w)} set(v) {self.x = v.x; self.z = v.y; self.w = v.z}}
    public var yzw: Vec3 {get {return Vec3(x: y, y: z, z: w)} set(v) {self.y = v.x; self.z = v.y; self.w = v.z}}
    public var zzw: Vec3 {get {return Vec3(x: z, y: z, z: w)}}
    public var wzw: Vec3 {get {return Vec3(x: w, y: z, z: w)}}
    public var xww: Vec3 {get {return Vec3(x: x, y: w, z: w)}}
    public var yww: Vec3 {get {return Vec3(x: y, y: w, z: w)}}
    public var zww: Vec3 {get {return Vec3(x: z, y: w, z: w)}}
    public var www: Vec3 {get {return Vec3(x: w, y: w, z: w)}}
    
    // Swizzle (Vec4) Properties
    public var xxxx: Vec4 {get {return Vec4(x: x, y: x, z: x, w: x)}}
    public var yxxx: Vec4 {get {return Vec4(x: y, y: x, z: x, w: x)}}
    public var zxxx: Vec4 {get {return Vec4(x: z, y: x, z: x, w: x)}}
    public var wxxx: Vec4 {get {return Vec4(x: w, y: x, z: x, w: x)}}
    public var xyxx: Vec4 {get {return Vec4(x: x, y: y, z: x, w: x)}}
    public var yyxx: Vec4 {get {return Vec4(x: y, y: y, z: x, w: x)}}
    public var zyxx: Vec4 {get {return Vec4(x: z, y: y, z: x, w: x)}}
    public var wyxx: Vec4 {get {return Vec4(x: w, y: y, z: x, w: x)}}
    public var xzxx: Vec4 {get {return Vec4(x: x, y: z, z: x, w: x)}}
    public var yzxx: Vec4 {get {return Vec4(x: y, y: z, z: x, w: x)}}
    public var zzxx: Vec4 {get {return Vec4(x: z, y: z, z: x, w: x)}}
    public var wzxx: Vec4 {get {return Vec4(x: w, y: z, z: x, w: x)}}
    public var xwxx: Vec4 {get {return Vec4(x: x, y: w, z: x, w: x)}}
    public var ywxx: Vec4 {get {return Vec4(x: y, y: w, z: x, w: x)}}
    public var zwxx: Vec4 {get {return Vec4(x: z, y: w, z: x, w: x)}}
    public var wwxx: Vec4 {get {return Vec4(x: w, y: w, z: x, w: x)}}
    public var xxyx: Vec4 {get {return Vec4(x: x, y: x, z: y, w: x)}}
    public var yxyx: Vec4 {get {return Vec4(x: y, y: x, z: y, w: x)}}
    public var zxyx: Vec4 {get {return Vec4(x: z, y: x, z: y, w: x)}}
    public var wxyx: Vec4 {get {return Vec4(x: w, y: x, z: y, w: x)}}
    public var xyyx: Vec4 {get {return Vec4(x: x, y: y, z: y, w: x)}}
    public var yyyx: Vec4 {get {return Vec4(x: y, y: y, z: y, w: x)}}
    public var zyyx: Vec4 {get {return Vec4(x: z, y: y, z: y, w: x)}}
    public var wyyx: Vec4 {get {return Vec4(x: w, y: y, z: y, w: x)}}
    public var xzyx: Vec4 {get {return Vec4(x: x, y: z, z: y, w: x)}}
    public var yzyx: Vec4 {get {return Vec4(x: y, y: z, z: y, w: x)}}
    public var zzyx: Vec4 {get {return Vec4(x: z, y: z, z: y, w: x)}}
    public var wzyx: Vec4 {get {return Vec4(x: w, y: z, z: y, w: x)} set(v) {self.w = v.x; self.z = v.y; self.y = v.z; self.x = v.w}}
    public var xwyx: Vec4 {get {return Vec4(x: x, y: w, z: y, w: x)}}
    public var ywyx: Vec4 {get {return Vec4(x: y, y: w, z: y, w: x)}}
    public var zwyx: Vec4 {get {return Vec4(x: z, y: w, z: y, w: x)} set(v) {self.z = v.x; self.w = v.y; self.y = v.z; self.x = v.w}}
    public var wwyx: Vec4 {get {return Vec4(x: w, y: w, z: y, w: x)}}
    public var xxzx: Vec4 {get {return Vec4(x: x, y: x, z: z, w: x)}}
    public var yxzx: Vec4 {get {return Vec4(x: y, y: x, z: z, w: x)}}
    public var zxzx: Vec4 {get {return Vec4(x: z, y: x, z: z, w: x)}}
    public var wxzx: Vec4 {get {return Vec4(x: w, y: x, z: z, w: x)}}
    public var xyzx: Vec4 {get {return Vec4(x: x, y: y, z: z, w: x)}}
    public var yyzx: Vec4 {get {return Vec4(x: y, y: y, z: z, w: x)}}
    public var zyzx: Vec4 {get {return Vec4(x: z, y: y, z: z, w: x)}}
    public var wyzx: Vec4 {get {return Vec4(x: w, y: y, z: z, w: x)} set(v) {self.w = v.x; self.y = v.y; self.z = v.z; self.x = v.w}}
    public var xzzx: Vec4 {get {return Vec4(x: x, y: z, z: z, w: x)}}
    public var yzzx: Vec4 {get {return Vec4(x: y, y: z, z: z, w: x)}}
    public var zzzx: Vec4 {get {return Vec4(x: z, y: z, z: z, w: x)}}
    public var wzzx: Vec4 {get {return Vec4(x: w, y: z, z: z, w: x)}}
    public var xwzx: Vec4 {get {return Vec4(x: x, y: w, z: z, w: x)}}
    public var ywzx: Vec4 {get {return Vec4(x: y, y: w, z: z, w: x)} set(v) {self.y = v.x; self.w = v.y; self.z = v.z; self.x = v.w}}
    public var zwzx: Vec4 {get {return Vec4(x: z, y: w, z: z, w: x)}}
    public var wwzx: Vec4 {get {return Vec4(x: w, y: w, z: z, w: x)}}
    public var xxwx: Vec4 {get {return Vec4(x: x, y: x, z: w, w: x)}}
    public var yxwx: Vec4 {get {return Vec4(x: y, y: x, z: w, w: x)}}
    public var zxwx: Vec4 {get {return Vec4(x: z, y: x, z: w, w: x)}}
    public var wxwx: Vec4 {get {return Vec4(x: w, y: x, z: w, w: x)}}
    public var xywx: Vec4 {get {return Vec4(x: x, y: y, z: w, w: x)}}
    public var yywx: Vec4 {get {return Vec4(x: y, y: y, z: w, w: x)}}
    public var zywx: Vec4 {get {return Vec4(x: z, y: y, z: w, w: x)} set(v) {self.z = v.x; self.y = v.y; self.w = v.z; self.x = v.w}}
    public var wywx: Vec4 {get {return Vec4(x: w, y: y, z: w, w: x)}}
    public var xzwx: Vec4 {get {return Vec4(x: x, y: z, z: w, w: x)}}
    public var yzwx: Vec4 {get {return Vec4(x: y, y: z, z: w, w: x)} set(v) {self.y = v.x; self.z = v.y; self.w = v.z; self.x = v.w}}
    public var zzwx: Vec4 {get {return Vec4(x: z, y: z, z: w, w: x)}}
    public var wzwx: Vec4 {get {return Vec4(x: w, y: z, z: w, w: x)}}
    public var xwwx: Vec4 {get {return Vec4(x: x, y: w, z: w, w: x)}}
    public var ywwx: Vec4 {get {return Vec4(x: y, y: w, z: w, w: x)}}
    public var zwwx: Vec4 {get {return Vec4(x: z, y: w, z: w, w: x)}}
    public var wwwx: Vec4 {get {return Vec4(x: w, y: w, z: w, w: x)}}
    public var xxxy: Vec4 {get {return Vec4(x: x, y: x, z: x, w: y)}}
    public var yxxy: Vec4 {get {return Vec4(x: y, y: x, z: x, w: y)}}
    public var zxxy: Vec4 {get {return Vec4(x: z, y: x, z: x, w: y)}}
    public var wxxy: Vec4 {get {return Vec4(x: w, y: x, z: x, w: y)}}
    public var xyxy: Vec4 {get {return Vec4(x: x, y: y, z: x, w: y)}}
    public var yyxy: Vec4 {get {return Vec4(x: y, y: y, z: x, w: y)}}
    public var zyxy: Vec4 {get {return Vec4(x: z, y: y, z: x, w: y)}}
    public var wyxy: Vec4 {get {return Vec4(x: w, y: y, z: x, w: y)}}
    public var xzxy: Vec4 {get {return Vec4(x: x, y: z, z: x, w: y)}}
    public var yzxy: Vec4 {get {return Vec4(x: y, y: z, z: x, w: y)}}
    public var zzxy: Vec4 {get {return Vec4(x: z, y: z, z: x, w: y)}}
    public var wzxy: Vec4 {get {return Vec4(x: w, y: z, z: x, w: y)} set(v) {self.w = v.x; self.z = v.y; self.x = v.z; self.y = v.w}}
    public var xwxy: Vec4 {get {return Vec4(x: x, y: w, z: x, w: y)}}
    public var ywxy: Vec4 {get {return Vec4(x: y, y: w, z: x, w: y)}}
    public var zwxy: Vec4 {get {return Vec4(x: z, y: w, z: x, w: y)} set(v) {self.z = v.x; self.w = v.y; self.x = v.z; self.y = v.w}}
    public var wwxy: Vec4 {get {return Vec4(x: w, y: w, z: x, w: y)}}
    public var xxyy: Vec4 {get {return Vec4(x: x, y: x, z: y, w: y)}}
    public var yxyy: Vec4 {get {return Vec4(x: y, y: x, z: y, w: y)}}
    public var zxyy: Vec4 {get {return Vec4(x: z, y: x, z: y, w: y)}}
    public var wxyy: Vec4 {get {return Vec4(x: w, y: x, z: y, w: y)}}
    public var xyyy: Vec4 {get {return Vec4(x: x, y: y, z: y, w: y)}}
    public var yyyy: Vec4 {get {return Vec4(x: y, y: y, z: y, w: y)}}
    public var zyyy: Vec4 {get {return Vec4(x: z, y: y, z: y, w: y)}}
    public var wyyy: Vec4 {get {return Vec4(x: w, y: y, z: y, w: y)}}
    public var xzyy: Vec4 {get {return Vec4(x: x, y: z, z: y, w: y)}}
    public var yzyy: Vec4 {get {return Vec4(x: y, y: z, z: y, w: y)}}
    public var zzyy: Vec4 {get {return Vec4(x: z, y: z, z: y, w: y)}}
    public var wzyy: Vec4 {get {return Vec4(x: w, y: z, z: y, w: y)}}
    public var xwyy: Vec4 {get {return Vec4(x: x, y: w, z: y, w: y)}}
    public var ywyy: Vec4 {get {return Vec4(x: y, y: w, z: y, w: y)}}
    public var zwyy: Vec4 {get {return Vec4(x: z, y: w, z: y, w: y)}}
    public var wwyy: Vec4 {get {return Vec4(x: w, y: w, z: y, w: y)}}
    public var xxzy: Vec4 {get {return Vec4(x: x, y: x, z: z, w: y)}}
    public var yxzy: Vec4 {get {return Vec4(x: y, y: x, z: z, w: y)}}
    public var zxzy: Vec4 {get {return Vec4(x: z, y: x, z: z, w: y)}}
    public var wxzy: Vec4 {get {return Vec4(x: w, y: x, z: z, w: y)} set(v) {self.w = v.x; self.x = v.y; self.z = v.z; self.y = v.w}}
    public var xyzy: Vec4 {get {return Vec4(x: x, y: y, z: z, w: y)}}
    public var yyzy: Vec4 {get {return Vec4(x: y, y: y, z: z, w: y)}}
    public var zyzy: Vec4 {get {return Vec4(x: z, y: y, z: z, w: y)}}
    public var wyzy: Vec4 {get {return Vec4(x: w, y: y, z: z, w: y)}}
    public var xzzy: Vec4 {get {return Vec4(x: x, y: z, z: z, w: y)}}
    public var yzzy: Vec4 {get {return Vec4(x: y, y: z, z: z, w: y)}}
    public var zzzy: Vec4 {get {return Vec4(x: z, y: z, z: z, w: y)}}
    public var wzzy: Vec4 {get {return Vec4(x: w, y: z, z: z, w: y)}}
    public var xwzy: Vec4 {get {return Vec4(x: x, y: w, z: z, w: y)} set(v) {self.x = v.x; self.w = v.y; self.z = v.z; self.y = v.w}}
    public var ywzy: Vec4 {get {return Vec4(x: y, y: w, z: z, w: y)}}
    public var zwzy: Vec4 {get {return Vec4(x: z, y: w, z: z, w: y)}}
    public var wwzy: Vec4 {get {return Vec4(x: w, y: w, z: z, w: y)}}
    public var xxwy: Vec4 {get {return Vec4(x: x, y: x, z: w, w: y)}}
    public var yxwy: Vec4 {get {return Vec4(x: y, y: x, z: w, w: y)}}
    public var zxwy: Vec4 {get {return Vec4(x: z, y: x, z: w, w: y)} set(v) {self.z = v.x; self.x = v.y; self.w = v.z; self.y = v.w}}
    public var wxwy: Vec4 {get {return Vec4(x: w, y: x, z: w, w: y)}}
    public var xywy: Vec4 {get {return Vec4(x: x, y: y, z: w, w: y)}}
    public var yywy: Vec4 {get {return Vec4(x: y, y: y, z: w, w: y)}}
    public var zywy: Vec4 {get {return Vec4(x: z, y: y, z: w, w: y)}}
    public var wywy: Vec4 {get {return Vec4(x: w, y: y, z: w, w: y)}}
    public var xzwy: Vec4 {get {return Vec4(x: x, y: z, z: w, w: y)} set(v) {self.x = v.x; self.z = v.y; self.w = v.z; self.y = v.w}}
    public var yzwy: Vec4 {get {return Vec4(x: y, y: z, z: w, w: y)}}
    public var zzwy: Vec4 {get {return Vec4(x: z, y: z, z: w, w: y)}}
    public var wzwy: Vec4 {get {return Vec4(x: w, y: z, z: w, w: y)}}
    public var xwwy: Vec4 {get {return Vec4(x: x, y: w, z: w, w: y)}}
    public var ywwy: Vec4 {get {return Vec4(x: y, y: w, z: w, w: y)}}
    public var zwwy: Vec4 {get {return Vec4(x: z, y: w, z: w, w: y)}}
    public var wwwy: Vec4 {get {return Vec4(x: w, y: w, z: w, w: y)}}
    public var xxxz: Vec4 {get {return Vec4(x: x, y: x, z: x, w: z)}}
    public var yxxz: Vec4 {get {return Vec4(x: y, y: x, z: x, w: z)}}
    public var zxxz: Vec4 {get {return Vec4(x: z, y: x, z: x, w: z)}}
    public var wxxz: Vec4 {get {return Vec4(x: w, y: x, z: x, w: z)}}
    public var xyxz: Vec4 {get {return Vec4(x: x, y: y, z: x, w: z)}}
    public var yyxz: Vec4 {get {return Vec4(x: y, y: y, z: x, w: z)}}
    public var zyxz: Vec4 {get {return Vec4(x: z, y: y, z: x, w: z)}}
    public var wyxz: Vec4 {get {return Vec4(x: w, y: y, z: x, w: z)} set(v) {self.w = v.x; self.y = v.y; self.x = v.z; self.z = v.w}}
    public var xzxz: Vec4 {get {return Vec4(x: x, y: z, z: x, w: z)}}
    public var yzxz: Vec4 {get {return Vec4(x: y, y: z, z: x, w: z)}}
    public var zzxz: Vec4 {get {return Vec4(x: z, y: z, z: x, w: z)}}
    public var wzxz: Vec4 {get {return Vec4(x: w, y: z, z: x, w: z)}}
    public var xwxz: Vec4 {get {return Vec4(x: x, y: w, z: x, w: z)}}
    public var ywxz: Vec4 {get {return Vec4(x: y, y: w, z: x, w: z)} set(v) {self.y = v.x; self.w = v.y; self.x = v.z; self.z = v.w}}
    public var zwxz: Vec4 {get {return Vec4(x: z, y: w, z: x, w: z)}}
    public var wwxz: Vec4 {get {return Vec4(x: w, y: w, z: x, w: z)}}
    public var xxyz: Vec4 {get {return Vec4(x: x, y: x, z: y, w: z)}}
    public var yxyz: Vec4 {get {return Vec4(x: y, y: x, z: y, w: z)}}
    public var zxyz: Vec4 {get {return Vec4(x: z, y: x, z: y, w: z)}}
    public var wxyz: Vec4 {get {return Vec4(x: w, y: x, z: y, w: z)} set(v) {self.w = v.x; self.x = v.y; self.y = v.z; self.z = v.w}}
    public var xyyz: Vec4 {get {return Vec4(x: x, y: y, z: y, w: z)}}
    public var yyyz: Vec4 {get {return Vec4(x: y, y: y, z: y, w: z)}}
    public var zyyz: Vec4 {get {return Vec4(x: z, y: y, z: y, w: z)}}
    public var wyyz: Vec4 {get {return Vec4(x: w, y: y, z: y, w: z)}}
    public var xzyz: Vec4 {get {return Vec4(x: x, y: z, z: y, w: z)}}
    public var yzyz: Vec4 {get {return Vec4(x: y, y: z, z: y, w: z)}}
    public var zzyz: Vec4 {get {return Vec4(x: z, y: z, z: y, w: z)}}
    public var wzyz: Vec4 {get {return Vec4(x: w, y: z, z: y, w: z)}}
    public var xwyz: Vec4 {get {return Vec4(x: x, y: w, z: y, w: z)} set(v) {self.x = v.x; self.w = v.y; self.y = v.z; self.z = v.w}}
    public var ywyz: Vec4 {get {return Vec4(x: y, y: w, z: y, w: z)}}
    public var zwyz: Vec4 {get {return Vec4(x: z, y: w, z: y, w: z)}}
    public var wwyz: Vec4 {get {return Vec4(x: w, y: w, z: y, w: z)}}
    public var xxzz: Vec4 {get {return Vec4(x: x, y: x, z: z, w: z)}}
    public var yxzz: Vec4 {get {return Vec4(x: y, y: x, z: z, w: z)}}
    public var zxzz: Vec4 {get {return Vec4(x: z, y: x, z: z, w: z)}}
    public var wxzz: Vec4 {get {return Vec4(x: w, y: x, z: z, w: z)}}
    public var xyzz: Vec4 {get {return Vec4(x: x, y: y, z: z, w: z)}}
    public var yyzz: Vec4 {get {return Vec4(x: y, y: y, z: z, w: z)}}
    public var zyzz: Vec4 {get {return Vec4(x: z, y: y, z: z, w: z)}}
    public var wyzz: Vec4 {get {return Vec4(x: w, y: y, z: z, w: z)}}
    public var xzzz: Vec4 {get {return Vec4(x: x, y: z, z: z, w: z)}}
    public var yzzz: Vec4 {get {return Vec4(x: y, y: z, z: z, w: z)}}
    public var zzzz: Vec4 {get {return Vec4(x: z, y: z, z: z, w: z)}}
    public var wzzz: Vec4 {get {return Vec4(x: w, y: z, z: z, w: z)}}
    public var xwzz: Vec4 {get {return Vec4(x: x, y: w, z: z, w: z)}}
    public var ywzz: Vec4 {get {return Vec4(x: y, y: w, z: z, w: z)}}
    public var zwzz: Vec4 {get {return Vec4(x: z, y: w, z: z, w: z)}}
    public var wwzz: Vec4 {get {return Vec4(x: w, y: w, z: z, w: z)}}
    public var xxwz: Vec4 {get {return Vec4(x: x, y: x, z: w, w: z)}}
    public var yxwz: Vec4 {get {return Vec4(x: y, y: x, z: w, w: z)} set(v) {self.y = v.x; self.x = v.y; self.w = v.z; self.z = v.w}}
    public var zxwz: Vec4 {get {return Vec4(x: z, y: x, z: w, w: z)}}
    public var wxwz: Vec4 {get {return Vec4(x: w, y: x, z: w, w: z)}}
    public var xywz: Vec4 {get {return Vec4(x: x, y: y, z: w, w: z)} set(v) {self.x = v.x; self.y = v.y; self.w = v.z; self.z = v.w}}
    public var yywz: Vec4 {get {return Vec4(x: y, y: y, z: w, w: z)}}
    public var zywz: Vec4 {get {return Vec4(x: z, y: y, z: w, w: z)}}
    public var wywz: Vec4 {get {return Vec4(x: w, y: y, z: w, w: z)}}
    public var xzwz: Vec4 {get {return Vec4(x: x, y: z, z: w, w: z)}}
    public var yzwz: Vec4 {get {return Vec4(x: y, y: z, z: w, w: z)}}
    public var zzwz: Vec4 {get {return Vec4(x: z, y: z, z: w, w: z)}}
    public var wzwz: Vec4 {get {return Vec4(x: w, y: z, z: w, w: z)}}
    public var xwwz: Vec4 {get {return Vec4(x: x, y: w, z: w, w: z)}}
    public var ywwz: Vec4 {get {return Vec4(x: y, y: w, z: w, w: z)}}
    public var zwwz: Vec4 {get {return Vec4(x: z, y: w, z: w, w: z)}}
    public var wwwz: Vec4 {get {return Vec4(x: w, y: w, z: w, w: z)}}
    public var xxxw: Vec4 {get {return Vec4(x: x, y: x, z: x, w: w)}}
    public var yxxw: Vec4 {get {return Vec4(x: y, y: x, z: x, w: w)}}
    public var zxxw: Vec4 {get {return Vec4(x: z, y: x, z: x, w: w)}}
    public var wxxw: Vec4 {get {return Vec4(x: w, y: x, z: x, w: w)}}
    public var xyxw: Vec4 {get {return Vec4(x: x, y: y, z: x, w: w)}}
    public var yyxw: Vec4 {get {return Vec4(x: y, y: y, z: x, w: w)}}
    public var zyxw: Vec4 {get {return Vec4(x: z, y: y, z: x, w: w)} set(v) {self.z = v.x; self.y = v.y; self.x = v.z; self.w = v.w}}
    public var wyxw: Vec4 {get {return Vec4(x: w, y: y, z: x, w: w)}}
    public var xzxw: Vec4 {get {return Vec4(x: x, y: z, z: x, w: w)}}
    public var yzxw: Vec4 {get {return Vec4(x: y, y: z, z: x, w: w)} set(v) {self.y = v.x; self.z = v.y; self.x = v.z; self.w = v.w}}
    public var zzxw: Vec4 {get {return Vec4(x: z, y: z, z: x, w: w)}}
    public var wzxw: Vec4 {get {return Vec4(x: w, y: z, z: x, w: w)}}
    public var xwxw: Vec4 {get {return Vec4(x: x, y: w, z: x, w: w)}}
    public var ywxw: Vec4 {get {return Vec4(x: y, y: w, z: x, w: w)}}
    public var zwxw: Vec4 {get {return Vec4(x: z, y: w, z: x, w: w)}}
    public var wwxw: Vec4 {get {return Vec4(x: w, y: w, z: x, w: w)}}
    public var xxyw: Vec4 {get {return Vec4(x: x, y: x, z: y, w: w)}}
    public var yxyw: Vec4 {get {return Vec4(x: y, y: x, z: y, w: w)}}
    public var zxyw: Vec4 {get {return Vec4(x: z, y: x, z: y, w: w)} set(v) {self.z = v.x; self.x = v.y; self.y = v.z; self.w = v.w}}
    public var wxyw: Vec4 {get {return Vec4(x: w, y: x, z: y, w: w)}}
    public var xyyw: Vec4 {get {return Vec4(x: x, y: y, z: y, w: w)}}
    public var yyyw: Vec4 {get {return Vec4(x: y, y: y, z: y, w: w)}}
    public var zyyw: Vec4 {get {return Vec4(x: z, y: y, z: y, w: w)}}
    public var wyyw: Vec4 {get {return Vec4(x: w, y: y, z: y, w: w)}}
    public var xzyw: Vec4 {get {return Vec4(x: x, y: z, z: y, w: w)} set(v) {self.x = v.x; self.z = v.y; self.y = v.z; self.w = v.w}}
    public var yzyw: Vec4 {get {return Vec4(x: y, y: z, z: y, w: w)}}
    public var zzyw: Vec4 {get {return Vec4(x: z, y: z, z: y, w: w)}}
    public var wzyw: Vec4 {get {return Vec4(x: w, y: z, z: y, w: w)}}
    public var xwyw: Vec4 {get {return Vec4(x: x, y: w, z: y, w: w)}}
    public var ywyw: Vec4 {get {return Vec4(x: y, y: w, z: y, w: w)}}
    public var zwyw: Vec4 {get {return Vec4(x: z, y: w, z: y, w: w)}}
    public var wwyw: Vec4 {get {return Vec4(x: w, y: w, z: y, w: w)}}
    public var xxzw: Vec4 {get {return Vec4(x: x, y: x, z: z, w: w)}}
    public var yxzw: Vec4 {get {return Vec4(x: y, y: x, z: z, w: w)} set(v) {self.y = v.x; self.x = v.y; self.z = v.z; self.w = v.w}}
    public var zxzw: Vec4 {get {return Vec4(x: z, y: x, z: z, w: w)}}
    public var wxzw: Vec4 {get {return Vec4(x: w, y: x, z: z, w: w)}}
    public var xyzw: Vec4 {get {return Vec4(x: x, y: y, z: z, w: w)} set(v) {self.x = v.x; self.y = v.y; self.z = v.z; self.w = v.w}}
    public var yyzw: Vec4 {get {return Vec4(x: y, y: y, z: z, w: w)}}
    public var zyzw: Vec4 {get {return Vec4(x: z, y: y, z: z, w: w)}}
    public var wyzw: Vec4 {get {return Vec4(x: w, y: y, z: z, w: w)}}
    public var xzzw: Vec4 {get {return Vec4(x: x, y: z, z: z, w: w)}}
    public var yzzw: Vec4 {get {return Vec4(x: y, y: z, z: z, w: w)}}
    public var zzzw: Vec4 {get {return Vec4(x: z, y: z, z: z, w: w)}}
    public var wzzw: Vec4 {get {return Vec4(x: w, y: z, z: z, w: w)}}
    public var xwzw: Vec4 {get {return Vec4(x: x, y: w, z: z, w: w)}}
    public var ywzw: Vec4 {get {return Vec4(x: y, y: w, z: z, w: w)}}
    public var zwzw: Vec4 {get {return Vec4(x: z, y: w, z: z, w: w)}}
    public var wwzw: Vec4 {get {return Vec4(x: w, y: w, z: z, w: w)}}
    public var xxww: Vec4 {get {return Vec4(x: x, y: x, z: w, w: w)}}
    public var yxww: Vec4 {get {return Vec4(x: y, y: x, z: w, w: w)}}
    public var zxww: Vec4 {get {return Vec4(x: z, y: x, z: w, w: w)}}
    public var wxww: Vec4 {get {return Vec4(x: w, y: x, z: w, w: w)}}
    public var xyww: Vec4 {get {return Vec4(x: x, y: y, z: w, w: w)}}
    public var yyww: Vec4 {get {return Vec4(x: y, y: y, z: w, w: w)}}
    public var zyww: Vec4 {get {return Vec4(x: z, y: y, z: w, w: w)}}
    public var wyww: Vec4 {get {return Vec4(x: w, y: y, z: w, w: w)}}
    public var xzww: Vec4 {get {return Vec4(x: x, y: z, z: w, w: w)}}
    public var yzww: Vec4 {get {return Vec4(x: y, y: z, z: w, w: w)}}
    public var zzww: Vec4 {get {return Vec4(x: z, y: z, z: w, w: w)}}
    public var wzww: Vec4 {get {return Vec4(x: w, y: z, z: w, w: w)}}
    public var xwww: Vec4 {get {return Vec4(x: x, y: w, z: w, w: w)}}
    public var ywww: Vec4 {get {return Vec4(x: y, y: w, z: w, w: w)}}
    public var zwww: Vec4 {get {return Vec4(x: z, y: w, z: w, w: w)}}
    public var wwww: Vec4 {get {return Vec4(x: w, y: w, z: w, w: w)}}
}

// Make it easier to interpret Vec4 as a string
extension Vec4: Printable, DebugPrintable {
    public var description:      String {get {return "(\(x), \(y), \(z), \(w))"}}
    public var debugDescription: String {get {return "Vec4(x: \(x), y: \(y), z: \(z), w: \(w))"}}
}

// Vec2 Prefix Operators
public prefix func - (v: Vec4) -> Vec4 {return Vec4(x: -v.x, y: -v.y, z: -v.z, w: -v.w)}

// Vec2 Infix Operators
public func + (a: Vec4, b: Vec4) -> Vec4 {return Vec4(x: a.x + b.x, y: a.y + b.y, z: a.z + b.z, w: a.w + b.w)}
public func - (a: Vec4, b: Vec4) -> Vec4 {return Vec4(x: a.x - b.x, y: a.y - b.y, z: a.z - b.z, w: a.w - b.w)}
public func * (a: Vec4, b: Vec4) -> Vec4 {return Vec4(x: a.x * b.x, y: a.y * b.y, z: a.z * b.z, w: a.w * b.w)}
public func / (a: Vec4, b: Vec4) -> Vec4 {return Vec4(x: a.x / b.x, y: a.y / b.y, z: a.z / b.z, w: a.w / b.w)}

// Vec2 Scalar Operators
public func * (s: CFloat, v: Vec4) -> Vec4 {return Vec4(x: s * v.x, y: s * v.y, z: s * v.z, w: s * v.w)}
public func * (v: Vec4, s: CFloat) -> Vec4 {return Vec4(x: v.x * s, y: v.y * s, z: v.z * s, w: v.w * s)}
public func / (v: Vec4, s: CFloat) -> Vec4 {return Vec4(x: v.x / s, y: v.y / s, z: v.z / s, w: v.w / s)}

// Vec4 Assignment Operators
public func += (inout a: Vec4, b: Vec4) {a = a + b}
public func -= (inout a: Vec4, b: Vec4) {a = a - b}
public func *= (inout a: Vec4, b: Vec4) {a = a * b}
public func /= (inout a: Vec4, b: Vec4) {a = a / b}

public func *= (inout a: Vec4, b: CFloat) {a = a * b}
public func /= (inout a: Vec4, b: CFloat) {a = a / b}

// Functions which operate on Vec2
public func length(v: Vec4) -> CFloat {return v.length}
public func length2(v: Vec4) -> CFloat {return v.length2}
public func normalize(v: Vec4) -> Vec4 {return v / v.length}
public func dot(a: Vec4, b: Vec4) -> CFloat {return a.x * b.x + a.y * b.y + a.z * b.z + a.w * b.w}
public func mix(a: Vec4, b: Vec4, t: Vec4) -> Vec4 {return a + (b - a) * t}
public func mix(a: Vec4, b: Vec4, t: CFloat) -> Vec4 {return a + (b - a) * t}
