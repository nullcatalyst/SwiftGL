//
//  Vec4.swift
//  SwiftGL
//
//  Created by Scott Bennett on 2014-06-08.
//  Copyright (c) 2014 Project Catalyst. All rights reserved.
//

import Foundation

extension Vec4 {
    init() {
        self.x = 0
        self.y = 0
        self.z = 0
        self.w = 0
    }
    
    init(s: CFloat) {
        self.x = s
        self.y = s
        self.z = s
        self.w = s
    }
    
    init(x: CFloat, y: CFloat) {
        self.x = x
        self.y = y
        self.z = 0
        self.w = 1
    }
    
    init(x: CFloat, y: CFloat, z: CFloat) {
        self.x = x
        self.y = y
        self.z = z
        self.w = 1
    }
    
    init(x: CFloat, y: CFloat, z: CFloat, w: CFloat) {
        self.x = x
        self.y = y
        self.z = z
        self.w = w
    }
    
    var length2: CFloat {
    get {
        return x * x + y * y + z * z + w * w
    }
    }
    
    var length: CFloat {
    get {
        return sqrtf(self.length2)
    }
    set(l) {
        self = l * normalize(self)
    }
    }
    
    // Swizzle (Vec2) Properties
    var xx: Vec2 {get {return Vec2(x: x, y: x)}}
    var yx: Vec2 {get {return Vec2(x: y, y: x)} set(v) {self.y = v.x; self.x = v.y}}
    var zx: Vec2 {get {return Vec2(x: z, y: x)} set(v) {self.z = v.x; self.x = v.y}}
    var wx: Vec2 {get {return Vec2(x: w, y: x)} set(v) {self.w = v.x; self.x = v.y}}
    var xy: Vec2 {get {return Vec2(x: x, y: y)} set(v) {self.x = v.x; self.y = v.y}}
    var yy: Vec2 {get {return Vec2(x: y, y: y)}}
    var zy: Vec2 {get {return Vec2(x: z, y: y)} set(v) {self.z = v.x; self.y = v.y}}
    var wy: Vec2 {get {return Vec2(x: w, y: y)} set(v) {self.w = v.x; self.y = v.y}}
    var xz: Vec2 {get {return Vec2(x: x, y: z)} set(v) {self.x = v.x; self.z = v.y}}
    var yz: Vec2 {get {return Vec2(x: y, y: z)} set(v) {self.y = v.x; self.z = v.y}}
    var zz: Vec2 {get {return Vec2(x: z, y: z)}}
    var wz: Vec2 {get {return Vec2(x: w, y: z)} set(v) {self.w = v.x; self.z = v.y}}
    var xw: Vec2 {get {return Vec2(x: x, y: w)} set(v) {self.x = v.x; self.w = v.y}}
    var yw: Vec2 {get {return Vec2(x: y, y: w)} set(v) {self.y = v.x; self.w = v.y}}
    var zw: Vec2 {get {return Vec2(x: z, y: w)} set(v) {self.z = v.x; self.w = v.y}}
    var ww: Vec2 {get {return Vec2(x: w, y: w)}}
    
    // Swizzle (Vec3) Properties
    var xxx: Vec3 {get {return Vec3(x: x, y: x, z: x)}}
    var yxx: Vec3 {get {return Vec3(x: y, y: x, z: x)}}
    var zxx: Vec3 {get {return Vec3(x: z, y: x, z: x)}}
    var wxx: Vec3 {get {return Vec3(x: w, y: x, z: x)}}
    var xyx: Vec3 {get {return Vec3(x: x, y: y, z: x)}}
    var yyx: Vec3 {get {return Vec3(x: y, y: y, z: x)}}
    var zyx: Vec3 {get {return Vec3(x: z, y: y, z: x)} set(v) {self.z = v.x; self.y = v.y; self.x = v.z}}
    var wyx: Vec3 {get {return Vec3(x: w, y: y, z: x)} set(v) {self.w = v.x; self.y = v.y; self.x = v.z}}
    var xzx: Vec3 {get {return Vec3(x: x, y: z, z: x)}}
    var yzx: Vec3 {get {return Vec3(x: y, y: z, z: x)} set(v) {self.y = v.x; self.z = v.y; self.x = v.z}}
    var zzx: Vec3 {get {return Vec3(x: z, y: z, z: x)}}
    var wzx: Vec3 {get {return Vec3(x: w, y: z, z: x)} set(v) {self.w = v.x; self.z = v.y; self.x = v.z}}
    var xwx: Vec3 {get {return Vec3(x: x, y: w, z: x)}}
    var ywx: Vec3 {get {return Vec3(x: y, y: w, z: x)} set(v) {self.y = v.x; self.w = v.y; self.x = v.z}}
    var zwx: Vec3 {get {return Vec3(x: z, y: w, z: x)} set(v) {self.z = v.x; self.w = v.y; self.x = v.z}}
    var wwx: Vec3 {get {return Vec3(x: w, y: w, z: x)}}
    var xxy: Vec3 {get {return Vec3(x: x, y: x, z: y)}}
    var yxy: Vec3 {get {return Vec3(x: y, y: x, z: y)}}
    var zxy: Vec3 {get {return Vec3(x: z, y: x, z: y)} set(v) {self.z = v.x; self.x = v.y; self.y = v.z}}
    var wxy: Vec3 {get {return Vec3(x: w, y: x, z: y)} set(v) {self.w = v.x; self.x = v.y; self.y = v.z}}
    var xyy: Vec3 {get {return Vec3(x: x, y: y, z: y)}}
    var yyy: Vec3 {get {return Vec3(x: y, y: y, z: y)}}
    var zyy: Vec3 {get {return Vec3(x: z, y: y, z: y)}}
    var wyy: Vec3 {get {return Vec3(x: w, y: y, z: y)}}
    var xzy: Vec3 {get {return Vec3(x: x, y: z, z: y)} set(v) {self.x = v.x; self.z = v.y; self.y = v.z}}
    var yzy: Vec3 {get {return Vec3(x: y, y: z, z: y)}}
    var zzy: Vec3 {get {return Vec3(x: z, y: z, z: y)}}
    var wzy: Vec3 {get {return Vec3(x: w, y: z, z: y)} set(v) {self.w = v.x; self.z = v.y; self.y = v.z}}
    var xwy: Vec3 {get {return Vec3(x: x, y: w, z: y)} set(v) {self.x = v.x; self.w = v.y; self.y = v.z}}
    var ywy: Vec3 {get {return Vec3(x: y, y: w, z: y)}}
    var zwy: Vec3 {get {return Vec3(x: z, y: w, z: y)} set(v) {self.z = v.x; self.w = v.y; self.y = v.z}}
    var wwy: Vec3 {get {return Vec3(x: w, y: w, z: y)}}
    var xxz: Vec3 {get {return Vec3(x: x, y: x, z: z)}}
    var yxz: Vec3 {get {return Vec3(x: y, y: x, z: z)} set(v) {self.y = v.x; self.x = v.y; self.z = v.z}}
    var zxz: Vec3 {get {return Vec3(x: z, y: x, z: z)}}
    var wxz: Vec3 {get {return Vec3(x: w, y: x, z: z)} set(v) {self.w = v.x; self.x = v.y; self.z = v.z}}
    var xyz: Vec3 {get {return Vec3(x: x, y: y, z: z)} set(v) {self.x = v.x; self.y = v.y; self.z = v.z}}
    var yyz: Vec3 {get {return Vec3(x: y, y: y, z: z)}}
    var zyz: Vec3 {get {return Vec3(x: z, y: y, z: z)}}
    var wyz: Vec3 {get {return Vec3(x: w, y: y, z: z)} set(v) {self.w = v.x; self.y = v.y; self.z = v.z}}
    var xzz: Vec3 {get {return Vec3(x: x, y: z, z: z)}}
    var yzz: Vec3 {get {return Vec3(x: y, y: z, z: z)}}
    var zzz: Vec3 {get {return Vec3(x: z, y: z, z: z)}}
    var wzz: Vec3 {get {return Vec3(x: w, y: z, z: z)}}
    var xwz: Vec3 {get {return Vec3(x: x, y: w, z: z)} set(v) {self.x = v.x; self.w = v.y; self.z = v.z}}
    var ywz: Vec3 {get {return Vec3(x: y, y: w, z: z)} set(v) {self.y = v.x; self.w = v.y; self.z = v.z}}
    var zwz: Vec3 {get {return Vec3(x: z, y: w, z: z)}}
    var wwz: Vec3 {get {return Vec3(x: w, y: w, z: z)}}
    var xxw: Vec3 {get {return Vec3(x: x, y: x, z: w)}}
    var yxw: Vec3 {get {return Vec3(x: y, y: x, z: w)} set(v) {self.y = v.x; self.x = v.y; self.w = v.z}}
    var zxw: Vec3 {get {return Vec3(x: z, y: x, z: w)} set(v) {self.z = v.x; self.x = v.y; self.w = v.z}}
    var wxw: Vec3 {get {return Vec3(x: w, y: x, z: w)}}
    var xyw: Vec3 {get {return Vec3(x: x, y: y, z: w)} set(v) {self.x = v.x; self.y = v.y; self.w = v.z}}
    var yyw: Vec3 {get {return Vec3(x: y, y: y, z: w)}}
    var zyw: Vec3 {get {return Vec3(x: z, y: y, z: w)} set(v) {self.z = v.x; self.y = v.y; self.w = v.z}}
    var wyw: Vec3 {get {return Vec3(x: w, y: y, z: w)}}
    var xzw: Vec3 {get {return Vec3(x: x, y: z, z: w)} set(v) {self.x = v.x; self.z = v.y; self.w = v.z}}
    var yzw: Vec3 {get {return Vec3(x: y, y: z, z: w)} set(v) {self.y = v.x; self.z = v.y; self.w = v.z}}
    var zzw: Vec3 {get {return Vec3(x: z, y: z, z: w)}}
    var wzw: Vec3 {get {return Vec3(x: w, y: z, z: w)}}
    var xww: Vec3 {get {return Vec3(x: x, y: w, z: w)}}
    var yww: Vec3 {get {return Vec3(x: y, y: w, z: w)}}
    var zww: Vec3 {get {return Vec3(x: z, y: w, z: w)}}
    var www: Vec3 {get {return Vec3(x: w, y: w, z: w)}}
    
    // Swizzle (Vec4) Properties
    var xxxx: Vec4 {get {return Vec4(x: x, y: x, z: x, w: x)}}
    var yxxx: Vec4 {get {return Vec4(x: y, y: x, z: x, w: x)}}
    var zxxx: Vec4 {get {return Vec4(x: z, y: x, z: x, w: x)}}
    var wxxx: Vec4 {get {return Vec4(x: w, y: x, z: x, w: x)}}
    var xyxx: Vec4 {get {return Vec4(x: x, y: y, z: x, w: x)}}
    var yyxx: Vec4 {get {return Vec4(x: y, y: y, z: x, w: x)}}
    var zyxx: Vec4 {get {return Vec4(x: z, y: y, z: x, w: x)}}
    var wyxx: Vec4 {get {return Vec4(x: w, y: y, z: x, w: x)}}
    var xzxx: Vec4 {get {return Vec4(x: x, y: z, z: x, w: x)}}
    var yzxx: Vec4 {get {return Vec4(x: y, y: z, z: x, w: x)}}
    var zzxx: Vec4 {get {return Vec4(x: z, y: z, z: x, w: x)}}
    var wzxx: Vec4 {get {return Vec4(x: w, y: z, z: x, w: x)}}
    var xwxx: Vec4 {get {return Vec4(x: x, y: w, z: x, w: x)}}
    var ywxx: Vec4 {get {return Vec4(x: y, y: w, z: x, w: x)}}
    var zwxx: Vec4 {get {return Vec4(x: z, y: w, z: x, w: x)}}
    var wwxx: Vec4 {get {return Vec4(x: w, y: w, z: x, w: x)}}
    var xxyx: Vec4 {get {return Vec4(x: x, y: x, z: y, w: x)}}
    var yxyx: Vec4 {get {return Vec4(x: y, y: x, z: y, w: x)}}
    var zxyx: Vec4 {get {return Vec4(x: z, y: x, z: y, w: x)}}
    var wxyx: Vec4 {get {return Vec4(x: w, y: x, z: y, w: x)}}
    var xyyx: Vec4 {get {return Vec4(x: x, y: y, z: y, w: x)}}
    var yyyx: Vec4 {get {return Vec4(x: y, y: y, z: y, w: x)}}
    var zyyx: Vec4 {get {return Vec4(x: z, y: y, z: y, w: x)}}
    var wyyx: Vec4 {get {return Vec4(x: w, y: y, z: y, w: x)}}
    var xzyx: Vec4 {get {return Vec4(x: x, y: z, z: y, w: x)}}
    var yzyx: Vec4 {get {return Vec4(x: y, y: z, z: y, w: x)}}
    var zzyx: Vec4 {get {return Vec4(x: z, y: z, z: y, w: x)}}
    var wzyx: Vec4 {get {return Vec4(x: w, y: z, z: y, w: x)} set(v) {self.w = v.x; self.z = v.y; self.y = v.z; self.x = v.w}}
    var xwyx: Vec4 {get {return Vec4(x: x, y: w, z: y, w: x)}}
    var ywyx: Vec4 {get {return Vec4(x: y, y: w, z: y, w: x)}}
    var zwyx: Vec4 {get {return Vec4(x: z, y: w, z: y, w: x)} set(v) {self.z = v.x; self.w = v.y; self.y = v.z; self.x = v.w}}
    var wwyx: Vec4 {get {return Vec4(x: w, y: w, z: y, w: x)}}
    var xxzx: Vec4 {get {return Vec4(x: x, y: x, z: z, w: x)}}
    var yxzx: Vec4 {get {return Vec4(x: y, y: x, z: z, w: x)}}
    var zxzx: Vec4 {get {return Vec4(x: z, y: x, z: z, w: x)}}
    var wxzx: Vec4 {get {return Vec4(x: w, y: x, z: z, w: x)}}
    var xyzx: Vec4 {get {return Vec4(x: x, y: y, z: z, w: x)}}
    var yyzx: Vec4 {get {return Vec4(x: y, y: y, z: z, w: x)}}
    var zyzx: Vec4 {get {return Vec4(x: z, y: y, z: z, w: x)}}
    var wyzx: Vec4 {get {return Vec4(x: w, y: y, z: z, w: x)} set(v) {self.w = v.x; self.y = v.y; self.z = v.z; self.x = v.w}}
    var xzzx: Vec4 {get {return Vec4(x: x, y: z, z: z, w: x)}}
    var yzzx: Vec4 {get {return Vec4(x: y, y: z, z: z, w: x)}}
    var zzzx: Vec4 {get {return Vec4(x: z, y: z, z: z, w: x)}}
    var wzzx: Vec4 {get {return Vec4(x: w, y: z, z: z, w: x)}}
    var xwzx: Vec4 {get {return Vec4(x: x, y: w, z: z, w: x)}}
    var ywzx: Vec4 {get {return Vec4(x: y, y: w, z: z, w: x)} set(v) {self.y = v.x; self.w = v.y; self.z = v.z; self.x = v.w}}
    var zwzx: Vec4 {get {return Vec4(x: z, y: w, z: z, w: x)}}
    var wwzx: Vec4 {get {return Vec4(x: w, y: w, z: z, w: x)}}
    var xxwx: Vec4 {get {return Vec4(x: x, y: x, z: w, w: x)}}
    var yxwx: Vec4 {get {return Vec4(x: y, y: x, z: w, w: x)}}
    var zxwx: Vec4 {get {return Vec4(x: z, y: x, z: w, w: x)}}
    var wxwx: Vec4 {get {return Vec4(x: w, y: x, z: w, w: x)}}
    var xywx: Vec4 {get {return Vec4(x: x, y: y, z: w, w: x)}}
    var yywx: Vec4 {get {return Vec4(x: y, y: y, z: w, w: x)}}
    var zywx: Vec4 {get {return Vec4(x: z, y: y, z: w, w: x)} set(v) {self.z = v.x; self.y = v.y; self.w = v.z; self.x = v.w}}
    var wywx: Vec4 {get {return Vec4(x: w, y: y, z: w, w: x)}}
    var xzwx: Vec4 {get {return Vec4(x: x, y: z, z: w, w: x)}}
    var yzwx: Vec4 {get {return Vec4(x: y, y: z, z: w, w: x)} set(v) {self.y = v.x; self.z = v.y; self.w = v.z; self.x = v.w}}
    var zzwx: Vec4 {get {return Vec4(x: z, y: z, z: w, w: x)}}
    var wzwx: Vec4 {get {return Vec4(x: w, y: z, z: w, w: x)}}
    var xwwx: Vec4 {get {return Vec4(x: x, y: w, z: w, w: x)}}
    var ywwx: Vec4 {get {return Vec4(x: y, y: w, z: w, w: x)}}
    var zwwx: Vec4 {get {return Vec4(x: z, y: w, z: w, w: x)}}
    var wwwx: Vec4 {get {return Vec4(x: w, y: w, z: w, w: x)}}
    var xxxy: Vec4 {get {return Vec4(x: x, y: x, z: x, w: y)}}
    var yxxy: Vec4 {get {return Vec4(x: y, y: x, z: x, w: y)}}
    var zxxy: Vec4 {get {return Vec4(x: z, y: x, z: x, w: y)}}
    var wxxy: Vec4 {get {return Vec4(x: w, y: x, z: x, w: y)}}
    var xyxy: Vec4 {get {return Vec4(x: x, y: y, z: x, w: y)}}
    var yyxy: Vec4 {get {return Vec4(x: y, y: y, z: x, w: y)}}
    var zyxy: Vec4 {get {return Vec4(x: z, y: y, z: x, w: y)}}
    var wyxy: Vec4 {get {return Vec4(x: w, y: y, z: x, w: y)}}
    var xzxy: Vec4 {get {return Vec4(x: x, y: z, z: x, w: y)}}
    var yzxy: Vec4 {get {return Vec4(x: y, y: z, z: x, w: y)}}
    var zzxy: Vec4 {get {return Vec4(x: z, y: z, z: x, w: y)}}
    var wzxy: Vec4 {get {return Vec4(x: w, y: z, z: x, w: y)} set(v) {self.w = v.x; self.z = v.y; self.x = v.z; self.y = v.w}}
    var xwxy: Vec4 {get {return Vec4(x: x, y: w, z: x, w: y)}}
    var ywxy: Vec4 {get {return Vec4(x: y, y: w, z: x, w: y)}}
    var zwxy: Vec4 {get {return Vec4(x: z, y: w, z: x, w: y)} set(v) {self.z = v.x; self.w = v.y; self.x = v.z; self.y = v.w}}
    var wwxy: Vec4 {get {return Vec4(x: w, y: w, z: x, w: y)}}
    var xxyy: Vec4 {get {return Vec4(x: x, y: x, z: y, w: y)}}
    var yxyy: Vec4 {get {return Vec4(x: y, y: x, z: y, w: y)}}
    var zxyy: Vec4 {get {return Vec4(x: z, y: x, z: y, w: y)}}
    var wxyy: Vec4 {get {return Vec4(x: w, y: x, z: y, w: y)}}
    var xyyy: Vec4 {get {return Vec4(x: x, y: y, z: y, w: y)}}
    var yyyy: Vec4 {get {return Vec4(x: y, y: y, z: y, w: y)}}
    var zyyy: Vec4 {get {return Vec4(x: z, y: y, z: y, w: y)}}
    var wyyy: Vec4 {get {return Vec4(x: w, y: y, z: y, w: y)}}
    var xzyy: Vec4 {get {return Vec4(x: x, y: z, z: y, w: y)}}
    var yzyy: Vec4 {get {return Vec4(x: y, y: z, z: y, w: y)}}
    var zzyy: Vec4 {get {return Vec4(x: z, y: z, z: y, w: y)}}
    var wzyy: Vec4 {get {return Vec4(x: w, y: z, z: y, w: y)}}
    var xwyy: Vec4 {get {return Vec4(x: x, y: w, z: y, w: y)}}
    var ywyy: Vec4 {get {return Vec4(x: y, y: w, z: y, w: y)}}
    var zwyy: Vec4 {get {return Vec4(x: z, y: w, z: y, w: y)}}
    var wwyy: Vec4 {get {return Vec4(x: w, y: w, z: y, w: y)}}
    var xxzy: Vec4 {get {return Vec4(x: x, y: x, z: z, w: y)}}
    var yxzy: Vec4 {get {return Vec4(x: y, y: x, z: z, w: y)}}
    var zxzy: Vec4 {get {return Vec4(x: z, y: x, z: z, w: y)}}
    var wxzy: Vec4 {get {return Vec4(x: w, y: x, z: z, w: y)} set(v) {self.w = v.x; self.x = v.y; self.z = v.z; self.y = v.w}}
    var xyzy: Vec4 {get {return Vec4(x: x, y: y, z: z, w: y)}}
    var yyzy: Vec4 {get {return Vec4(x: y, y: y, z: z, w: y)}}
    var zyzy: Vec4 {get {return Vec4(x: z, y: y, z: z, w: y)}}
    var wyzy: Vec4 {get {return Vec4(x: w, y: y, z: z, w: y)}}
    var xzzy: Vec4 {get {return Vec4(x: x, y: z, z: z, w: y)}}
    var yzzy: Vec4 {get {return Vec4(x: y, y: z, z: z, w: y)}}
    var zzzy: Vec4 {get {return Vec4(x: z, y: z, z: z, w: y)}}
    var wzzy: Vec4 {get {return Vec4(x: w, y: z, z: z, w: y)}}
    var xwzy: Vec4 {get {return Vec4(x: x, y: w, z: z, w: y)} set(v) {self.x = v.x; self.w = v.y; self.z = v.z; self.y = v.w}}
    var ywzy: Vec4 {get {return Vec4(x: y, y: w, z: z, w: y)}}
    var zwzy: Vec4 {get {return Vec4(x: z, y: w, z: z, w: y)}}
    var wwzy: Vec4 {get {return Vec4(x: w, y: w, z: z, w: y)}}
    var xxwy: Vec4 {get {return Vec4(x: x, y: x, z: w, w: y)}}
    var yxwy: Vec4 {get {return Vec4(x: y, y: x, z: w, w: y)}}
    var zxwy: Vec4 {get {return Vec4(x: z, y: x, z: w, w: y)} set(v) {self.z = v.x; self.x = v.y; self.w = v.z; self.y = v.w}}
    var wxwy: Vec4 {get {return Vec4(x: w, y: x, z: w, w: y)}}
    var xywy: Vec4 {get {return Vec4(x: x, y: y, z: w, w: y)}}
    var yywy: Vec4 {get {return Vec4(x: y, y: y, z: w, w: y)}}
    var zywy: Vec4 {get {return Vec4(x: z, y: y, z: w, w: y)}}
    var wywy: Vec4 {get {return Vec4(x: w, y: y, z: w, w: y)}}
    var xzwy: Vec4 {get {return Vec4(x: x, y: z, z: w, w: y)} set(v) {self.x = v.x; self.z = v.y; self.w = v.z; self.y = v.w}}
    var yzwy: Vec4 {get {return Vec4(x: y, y: z, z: w, w: y)}}
    var zzwy: Vec4 {get {return Vec4(x: z, y: z, z: w, w: y)}}
    var wzwy: Vec4 {get {return Vec4(x: w, y: z, z: w, w: y)}}
    var xwwy: Vec4 {get {return Vec4(x: x, y: w, z: w, w: y)}}
    var ywwy: Vec4 {get {return Vec4(x: y, y: w, z: w, w: y)}}
    var zwwy: Vec4 {get {return Vec4(x: z, y: w, z: w, w: y)}}
    var wwwy: Vec4 {get {return Vec4(x: w, y: w, z: w, w: y)}}
    var xxxz: Vec4 {get {return Vec4(x: x, y: x, z: x, w: z)}}
    var yxxz: Vec4 {get {return Vec4(x: y, y: x, z: x, w: z)}}
    var zxxz: Vec4 {get {return Vec4(x: z, y: x, z: x, w: z)}}
    var wxxz: Vec4 {get {return Vec4(x: w, y: x, z: x, w: z)}}
    var xyxz: Vec4 {get {return Vec4(x: x, y: y, z: x, w: z)}}
    var yyxz: Vec4 {get {return Vec4(x: y, y: y, z: x, w: z)}}
    var zyxz: Vec4 {get {return Vec4(x: z, y: y, z: x, w: z)}}
    var wyxz: Vec4 {get {return Vec4(x: w, y: y, z: x, w: z)} set(v) {self.w = v.x; self.y = v.y; self.x = v.z; self.z = v.w}}
    var xzxz: Vec4 {get {return Vec4(x: x, y: z, z: x, w: z)}}
    var yzxz: Vec4 {get {return Vec4(x: y, y: z, z: x, w: z)}}
    var zzxz: Vec4 {get {return Vec4(x: z, y: z, z: x, w: z)}}
    var wzxz: Vec4 {get {return Vec4(x: w, y: z, z: x, w: z)}}
    var xwxz: Vec4 {get {return Vec4(x: x, y: w, z: x, w: z)}}
    var ywxz: Vec4 {get {return Vec4(x: y, y: w, z: x, w: z)} set(v) {self.y = v.x; self.w = v.y; self.x = v.z; self.z = v.w}}
    var zwxz: Vec4 {get {return Vec4(x: z, y: w, z: x, w: z)}}
    var wwxz: Vec4 {get {return Vec4(x: w, y: w, z: x, w: z)}}
    var xxyz: Vec4 {get {return Vec4(x: x, y: x, z: y, w: z)}}
    var yxyz: Vec4 {get {return Vec4(x: y, y: x, z: y, w: z)}}
    var zxyz: Vec4 {get {return Vec4(x: z, y: x, z: y, w: z)}}
    var wxyz: Vec4 {get {return Vec4(x: w, y: x, z: y, w: z)} set(v) {self.w = v.x; self.x = v.y; self.y = v.z; self.z = v.w}}
    var xyyz: Vec4 {get {return Vec4(x: x, y: y, z: y, w: z)}}
    var yyyz: Vec4 {get {return Vec4(x: y, y: y, z: y, w: z)}}
    var zyyz: Vec4 {get {return Vec4(x: z, y: y, z: y, w: z)}}
    var wyyz: Vec4 {get {return Vec4(x: w, y: y, z: y, w: z)}}
    var xzyz: Vec4 {get {return Vec4(x: x, y: z, z: y, w: z)}}
    var yzyz: Vec4 {get {return Vec4(x: y, y: z, z: y, w: z)}}
    var zzyz: Vec4 {get {return Vec4(x: z, y: z, z: y, w: z)}}
    var wzyz: Vec4 {get {return Vec4(x: w, y: z, z: y, w: z)}}
    var xwyz: Vec4 {get {return Vec4(x: x, y: w, z: y, w: z)} set(v) {self.x = v.x; self.w = v.y; self.y = v.z; self.z = v.w}}
    var ywyz: Vec4 {get {return Vec4(x: y, y: w, z: y, w: z)}}
    var zwyz: Vec4 {get {return Vec4(x: z, y: w, z: y, w: z)}}
    var wwyz: Vec4 {get {return Vec4(x: w, y: w, z: y, w: z)}}
    var xxzz: Vec4 {get {return Vec4(x: x, y: x, z: z, w: z)}}
    var yxzz: Vec4 {get {return Vec4(x: y, y: x, z: z, w: z)}}
    var zxzz: Vec4 {get {return Vec4(x: z, y: x, z: z, w: z)}}
    var wxzz: Vec4 {get {return Vec4(x: w, y: x, z: z, w: z)}}
    var xyzz: Vec4 {get {return Vec4(x: x, y: y, z: z, w: z)}}
    var yyzz: Vec4 {get {return Vec4(x: y, y: y, z: z, w: z)}}
    var zyzz: Vec4 {get {return Vec4(x: z, y: y, z: z, w: z)}}
    var wyzz: Vec4 {get {return Vec4(x: w, y: y, z: z, w: z)}}
    var xzzz: Vec4 {get {return Vec4(x: x, y: z, z: z, w: z)}}
    var yzzz: Vec4 {get {return Vec4(x: y, y: z, z: z, w: z)}}
    var zzzz: Vec4 {get {return Vec4(x: z, y: z, z: z, w: z)}}
    var wzzz: Vec4 {get {return Vec4(x: w, y: z, z: z, w: z)}}
    var xwzz: Vec4 {get {return Vec4(x: x, y: w, z: z, w: z)}}
    var ywzz: Vec4 {get {return Vec4(x: y, y: w, z: z, w: z)}}
    var zwzz: Vec4 {get {return Vec4(x: z, y: w, z: z, w: z)}}
    var wwzz: Vec4 {get {return Vec4(x: w, y: w, z: z, w: z)}}
    var xxwz: Vec4 {get {return Vec4(x: x, y: x, z: w, w: z)}}
    var yxwz: Vec4 {get {return Vec4(x: y, y: x, z: w, w: z)} set(v) {self.y = v.x; self.x = v.y; self.w = v.z; self.z = v.w}}
    var zxwz: Vec4 {get {return Vec4(x: z, y: x, z: w, w: z)}}
    var wxwz: Vec4 {get {return Vec4(x: w, y: x, z: w, w: z)}}
    var xywz: Vec4 {get {return Vec4(x: x, y: y, z: w, w: z)} set(v) {self.x = v.x; self.y = v.y; self.w = v.z; self.z = v.w}}
    var yywz: Vec4 {get {return Vec4(x: y, y: y, z: w, w: z)}}
    var zywz: Vec4 {get {return Vec4(x: z, y: y, z: w, w: z)}}
    var wywz: Vec4 {get {return Vec4(x: w, y: y, z: w, w: z)}}
    var xzwz: Vec4 {get {return Vec4(x: x, y: z, z: w, w: z)}}
    var yzwz: Vec4 {get {return Vec4(x: y, y: z, z: w, w: z)}}
    var zzwz: Vec4 {get {return Vec4(x: z, y: z, z: w, w: z)}}
    var wzwz: Vec4 {get {return Vec4(x: w, y: z, z: w, w: z)}}
    var xwwz: Vec4 {get {return Vec4(x: x, y: w, z: w, w: z)}}
    var ywwz: Vec4 {get {return Vec4(x: y, y: w, z: w, w: z)}}
    var zwwz: Vec4 {get {return Vec4(x: z, y: w, z: w, w: z)}}
    var wwwz: Vec4 {get {return Vec4(x: w, y: w, z: w, w: z)}}
    var xxxw: Vec4 {get {return Vec4(x: x, y: x, z: x, w: w)}}
    var yxxw: Vec4 {get {return Vec4(x: y, y: x, z: x, w: w)}}
    var zxxw: Vec4 {get {return Vec4(x: z, y: x, z: x, w: w)}}
    var wxxw: Vec4 {get {return Vec4(x: w, y: x, z: x, w: w)}}
    var xyxw: Vec4 {get {return Vec4(x: x, y: y, z: x, w: w)}}
    var yyxw: Vec4 {get {return Vec4(x: y, y: y, z: x, w: w)}}
    var zyxw: Vec4 {get {return Vec4(x: z, y: y, z: x, w: w)} set(v) {self.z = v.x; self.y = v.y; self.x = v.z; self.w = v.w}}
    var wyxw: Vec4 {get {return Vec4(x: w, y: y, z: x, w: w)}}
    var xzxw: Vec4 {get {return Vec4(x: x, y: z, z: x, w: w)}}
    var yzxw: Vec4 {get {return Vec4(x: y, y: z, z: x, w: w)} set(v) {self.y = v.x; self.z = v.y; self.x = v.z; self.w = v.w}}
    var zzxw: Vec4 {get {return Vec4(x: z, y: z, z: x, w: w)}}
    var wzxw: Vec4 {get {return Vec4(x: w, y: z, z: x, w: w)}}
    var xwxw: Vec4 {get {return Vec4(x: x, y: w, z: x, w: w)}}
    var ywxw: Vec4 {get {return Vec4(x: y, y: w, z: x, w: w)}}
    var zwxw: Vec4 {get {return Vec4(x: z, y: w, z: x, w: w)}}
    var wwxw: Vec4 {get {return Vec4(x: w, y: w, z: x, w: w)}}
    var xxyw: Vec4 {get {return Vec4(x: x, y: x, z: y, w: w)}}
    var yxyw: Vec4 {get {return Vec4(x: y, y: x, z: y, w: w)}}
    var zxyw: Vec4 {get {return Vec4(x: z, y: x, z: y, w: w)} set(v) {self.z = v.x; self.x = v.y; self.y = v.z; self.w = v.w}}
    var wxyw: Vec4 {get {return Vec4(x: w, y: x, z: y, w: w)}}
    var xyyw: Vec4 {get {return Vec4(x: x, y: y, z: y, w: w)}}
    var yyyw: Vec4 {get {return Vec4(x: y, y: y, z: y, w: w)}}
    var zyyw: Vec4 {get {return Vec4(x: z, y: y, z: y, w: w)}}
    var wyyw: Vec4 {get {return Vec4(x: w, y: y, z: y, w: w)}}
    var xzyw: Vec4 {get {return Vec4(x: x, y: z, z: y, w: w)} set(v) {self.x = v.x; self.z = v.y; self.y = v.z; self.w = v.w}}
    var yzyw: Vec4 {get {return Vec4(x: y, y: z, z: y, w: w)}}
    var zzyw: Vec4 {get {return Vec4(x: z, y: z, z: y, w: w)}}
    var wzyw: Vec4 {get {return Vec4(x: w, y: z, z: y, w: w)}}
    var xwyw: Vec4 {get {return Vec4(x: x, y: w, z: y, w: w)}}
    var ywyw: Vec4 {get {return Vec4(x: y, y: w, z: y, w: w)}}
    var zwyw: Vec4 {get {return Vec4(x: z, y: w, z: y, w: w)}}
    var wwyw: Vec4 {get {return Vec4(x: w, y: w, z: y, w: w)}}
    var xxzw: Vec4 {get {return Vec4(x: x, y: x, z: z, w: w)}}
    var yxzw: Vec4 {get {return Vec4(x: y, y: x, z: z, w: w)} set(v) {self.y = v.x; self.x = v.y; self.z = v.z; self.w = v.w}}
    var zxzw: Vec4 {get {return Vec4(x: z, y: x, z: z, w: w)}}
    var wxzw: Vec4 {get {return Vec4(x: w, y: x, z: z, w: w)}}
    var xyzw: Vec4 {get {return Vec4(x: x, y: y, z: z, w: w)} set(v) {self.x = v.x; self.y = v.y; self.z = v.z; self.w = v.w}}
    var yyzw: Vec4 {get {return Vec4(x: y, y: y, z: z, w: w)}}
    var zyzw: Vec4 {get {return Vec4(x: z, y: y, z: z, w: w)}}
    var wyzw: Vec4 {get {return Vec4(x: w, y: y, z: z, w: w)}}
    var xzzw: Vec4 {get {return Vec4(x: x, y: z, z: z, w: w)}}
    var yzzw: Vec4 {get {return Vec4(x: y, y: z, z: z, w: w)}}
    var zzzw: Vec4 {get {return Vec4(x: z, y: z, z: z, w: w)}}
    var wzzw: Vec4 {get {return Vec4(x: w, y: z, z: z, w: w)}}
    var xwzw: Vec4 {get {return Vec4(x: x, y: w, z: z, w: w)}}
    var ywzw: Vec4 {get {return Vec4(x: y, y: w, z: z, w: w)}}
    var zwzw: Vec4 {get {return Vec4(x: z, y: w, z: z, w: w)}}
    var wwzw: Vec4 {get {return Vec4(x: w, y: w, z: z, w: w)}}
    var xxww: Vec4 {get {return Vec4(x: x, y: x, z: w, w: w)}}
    var yxww: Vec4 {get {return Vec4(x: y, y: x, z: w, w: w)}}
    var zxww: Vec4 {get {return Vec4(x: z, y: x, z: w, w: w)}}
    var wxww: Vec4 {get {return Vec4(x: w, y: x, z: w, w: w)}}
    var xyww: Vec4 {get {return Vec4(x: x, y: y, z: w, w: w)}}
    var yyww: Vec4 {get {return Vec4(x: y, y: y, z: w, w: w)}}
    var zyww: Vec4 {get {return Vec4(x: z, y: y, z: w, w: w)}}
    var wyww: Vec4 {get {return Vec4(x: w, y: y, z: w, w: w)}}
    var xzww: Vec4 {get {return Vec4(x: x, y: z, z: w, w: w)}}
    var yzww: Vec4 {get {return Vec4(x: y, y: z, z: w, w: w)}}
    var zzww: Vec4 {get {return Vec4(x: z, y: z, z: w, w: w)}}
    var wzww: Vec4 {get {return Vec4(x: w, y: z, z: w, w: w)}}
    var xwww: Vec4 {get {return Vec4(x: x, y: w, z: w, w: w)}}
    var ywww: Vec4 {get {return Vec4(x: y, y: w, z: w, w: w)}}
    var zwww: Vec4 {get {return Vec4(x: z, y: w, z: w, w: w)}}
    var wwww: Vec4 {get {return Vec4(x: w, y: w, z: w, w: w)}}
}

// Vec2 Prefix Operators
@prefix func - (v: Vec4) -> Vec4 {return Vec4(x: -v.x, y: -v.y, z: -v.z, w: -v.w)}

// Vec2 Infix Operators
@infix func + (a: Vec4, b: Vec4) -> Vec4 {return Vec4(x: a.x + b.x, y: a.y + b.y, z: a.z + b.z, w: a.w + b.w)}
@infix func - (a: Vec4, b: Vec4) -> Vec4 {return Vec4(x: a.x - b.x, y: a.y - b.y, z: a.z - b.z, w: a.w - b.w)}
@infix func * (a: Vec4, b: Vec4) -> Vec4 {return Vec4(x: a.x * b.x, y: a.y * b.y, z: a.z * b.z, w: a.w * b.w)}
@infix func / (a: Vec4, b: Vec4) -> Vec4 {return Vec4(x: a.x / b.x, y: a.y / b.y, z: a.z / b.z, w: a.w / b.w)}

// Vec2 Scalar Operators
@infix func * (s: CFloat, v: Vec4) -> Vec4 {return Vec4(x: s * v.x, y: s * v.y, z: s * v.z, w: s * v.w)}
@infix func * (v: Vec4, s: CFloat) -> Vec4 {return Vec4(x: v.x * s, y: v.y * s, z: v.z * s, w: v.w * s)}
@infix func / (v: Vec4, s: CFloat) -> Vec4 {return Vec4(x: v.x / s, y: v.y / s, z: v.z / s, w: v.w / s)}

// Functions which operate on Vec2
func length(v: Vec4) -> CFloat {return v.length}
func length2(v: Vec4) -> CFloat {return v.length2}
func normalize(v: Vec4) -> Vec4 {return v / v.length}
func mix(a: Vec4, b: Vec4, t: CFloat) -> Vec4 {return a + (b - a) * t}
func dot(a: Vec4, b: Vec4) -> CFloat {return a.x * b.x + a.y * b.y + a.z * b.z + a.w * b.w}
